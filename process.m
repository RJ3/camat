function [Rtab,Mtab, mean_results]=process(locsa, upstroke_locs,t0_locs,depV,avesig,time,fps,minimum,maximum,type)
% Use type=0 for calcium
% Use type=1 for voltage

% F0 for whole epoch
F0=mean(avesig(1:t0_locs(1)));
F0_line=linspace(F0, F0, length(avesig(1:t0_locs(1))));

hold on
plot(time(1:t0_locs(1)),F0_line,'r')

% Loops for finding points
trans=1;
lasttrans=trans+1;

if length(locsa)>length(upstroke_locs)
        looplength=length(upstroke_locs);
elseif length(upstroke_locs)>length(locsa)
        looplength=length(locsa);        
elseif length(upstroke_locs)==length(locsa)
        looplength=length(locsa);
end

for i=1+1:looplength-1 % skip first and last transient
% for i=1:looplength-1 % skip first and last transient
    
% Return the Upstroke Point

    loct0=t0_locs(i);

lup=find(upstroke_locs>loct0,1,'first');
locup=upstroke_locs(lup);

% Return the Peak Point    
lp=find(locsa>locup,1,'first');
locpk=locsa(lp);

% Return the t0 Point
% lb2=find(imin2<locup,1,'last');
% loct0=imin2(lb2);

% Return to Baseline Point
% lb=find(avesig(locpk:end)<=(avesig(locpk)-((avesig(locpk)-avesig(loct0))*0.95)),1,'first');
[lb,~]=find(avesig(locpk:(t0_locs(i+1)-1))<minimum,1,'last');

if isempty(lb)
    locbase=t0_locs(i+1)-2;
else
    locbase=lb+locpk-1;
end

if loct0<locup<locpk<locbase
%     disp('okay')
elseif  loct0>locup
        loct0=t0_locs(i+1);
end

%Average the last 3 points to compensate for noise in the baseline
% avg_base=mean([avesig(locbase) avesig(locbase-1) avesig(locbase-3)]);
normalized=(avesig(locpk:locbase)-avesig(locbase))/(avesig(locpk)-avesig(locbase));
normSmooth=smooth(normalized,3,'sgolay',2);

% design butterworth and apply
% [b,a]=butter(15,50/(fps/2),'low');
% normSmooth=filtfilt(b,a,normalized);

[cad50_endpre,~]=find(normSmooth<=0.495,1,'first');
[cad90_endpre,~]=find(normSmooth<=0.195,1,'first'); %Cad80
%[cad90_endpre,~]=find(normSmooth<=0.095,1,'first'); %Cad90
[lp2pre,~]=find(normSmooth<=0.695,1,'first');

cad50_end=cad50_endpre+locpk;
cad90_end=cad90_endpre+locpk;
lp2=lp2pre+locpk;

% Find the 90% upstroke point
normUpstroke=(avesig(loct0:locpk)-avesig(loct0))/(avesig(locpk)-avesig(loct0));
[loc90pre,~]=find(normUpstroke>=0.895,1,'first');
loc90=loc90pre+loct0;


%% Plotting
% Plot the points of interest
% Plot the t0 Point
plot(time(loct0),avesig(loct0),'m^','Markersize',8,'MarkerFaceColor','m','MarkerEdgeColor','k');
% Plot the Initialize Upstroke Point
plot(time(locup),avesig(locup),'ro','Markersize',8,'MarkerFaceColor','c','MarkerEdgeColor','k');
% plot the 90% upstroke point
plot(time(loc90),avesig(loc90),'m^','MarkerSize',8,'MarkerFaceColor','k','MarkerEdgeColor','k');
% Plot the Peak Point
plot(time(locpk),avesig(locpk),'mo','Markersize',8,'MarkerFaceColor','m','MarkerEdgeColor','k');
% plot(time(lp1),avesig(lp1),'m^','Markersize',8,'MarkerFaceColor','m','MarkerEdgeColor','m');
plot(time(lp2),avesig(lp2),'mv','Markersize',8,'MarkerFaceColor','m','MarkerEdgeColor','k');
% Plot the cad50 ending
plot(time(cad50_end),avesig(cad50_end),'cs','Markersize',8,'MarkerFaceColor','c','MarkerEdgeColor','k');
% Plot the cad90 ending
plot(time(cad90_end),avesig(cad90_end),'cs','Markersize',8,'MarkerFaceColor','c','MarkerEdgeColor','k');
% Plot the Return to Baseline Point
plot(time(locbase),avesig(locbase),'yo','Markersize',8,'MarkerFaceColor','y','MarkerEdgeColor','k');

%% Main Fitting Functions
% Downstroke exponential (TauFall)
X=avesig(lp2:locbase);
X=double(X);
Tpre=(lp2:locbase)'-lp2;
T=linspace(0,length(Tpre)*(1/fps),length(Tpre))';

downstroke = @(params,T) params(1).*(exp(-params(3).*T))+params(2);
%x0 = [25; 100; 1]; % Old Camera
x0 = [200; 3000; 10]; % New Camera
options=optimset('Display','off','MaxFunEvals', 10000,'MaxIter',10000,...
    'Algorithm','levenberg-marquardt');
[params] = lsqcurvefit(downstroke,x0,T,X,[],[],options);
A=params(1);B=params(2);kFall=params(3);
recoverypred=A.*(exp(-kFall.*T))+B;

plot(time(lp2:locbase),recoverypred,'g-','linewidth',2);

%% Results Cell for single file analysis

% For Voltage
if type==1
    loct0=locup; % set initialization point to upstroke point
else
    loct0=loct0;
end

results(trans,1)=depV(trans);
results(trans,2)=(time(loc90)-time(loct0))*1000;
results(trans,3)=(1/kFall)*1000;
results(trans,4)=(time(lp2)-time(loct0))*1000; % CaD30
% results(trans,5)=(time(cad50_end)-time(loct0)); % CaD50
results(trans,5)=(time(cad90_end)-time(loct0))*1000; % CaD90 or 80 (check above)
results(trans,6)=(time(lp2)-time(loct0))./(time(cad90_end)-time(loct0));

% results(trans,7)=avesig(locpk);
results(trans,7)=avesig(locbase)/F0; %Diastolic
results(trans,8)=avesig(locpk)/F0; %Systolic

results(trans,9)=(time(locsa(lp+1))-time(locpk))*1000; % PeakTimeDiff

if type==0
    Rtab=array2table(results,'VariableNames',{'Vmax','UpTime90','TauFall','CaD30','CaD80','CaD30d80','D_F0','F1_F0','CL'});
elseif type==1
    Rtab=array2table(results,'VariableNames',{'Vmax','UpTime90','TauFall','APD30','APD80','APD30d80','D_F0','F1_F0','CL'});
end

trans=trans+1;
clearvars X T A B kFall kRise recoverywin locbase loct0
end

mean_results(1,:)=mean(results,1);
mean_results(2,:)=std(results,1);
mean_results(1,10)=results(1,7); % First Diastolic / F0
mean_results(1,11)=results(end,7); % Last Diastolic / F0

if type==0
    Mtab=array2table(mean_results,'VariableNames',{'Vmax','UpTime90','TauFall','CaD30','CaD80','CaD30d80','D_F0','F1_F0','CL','FD_F0','LD_F0'});
elseif type==1
    Mtab=array2table(mean_results,'VariableNames',{'Vmax','UpTime90','TauFall','APD30','APD80','APD30d80','D_F0','F1_F0','CL','FD_F0','LD_F0'});
end