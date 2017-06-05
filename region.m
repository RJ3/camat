function [avesig,time,radi]=region(data,gr,gc,pr,pc,dt, maxrad, mode_selection)

% Find all the indices where the previous is less than the txt_maxrad

rad=sqrt((gr-pr).^2 + (gc-pc).^2);
radi=find(rad<=maxrad); 

avesig=zeros(size(data,3),1);                                                                                                                       
for i=1:length(radi)
    % for each radi, find the gr and gc for that for all frames. Use those indices for the data, and get rid of all the singleton dimensions there.
    pixsig=squeeze(data(gr(radi(i)),gc(radi(i)),:));                        
    % Add the avesid and pix sig.
    avesig=avesig+pixsig;                                                   
end

% Signal inversion here

if mode_selection == 2
avesig=-avesig+abs(max(avesig));
else
end

% divide each avesig by the length of radi.
avesig=avesig./length(radi);

time=0:dt:length(avesig)*dt-dt;