function [num_peaks, locsa, upstroke_locs, t0_locs, depV, minimum, maximum, amp]=peak_detect(avesig, thres, mpd)

avesig_partialsmooth=double(avesig);
%avesig_partialsmooth=smooth(avesig_partialsmooth,3,'sgolay',2); % curve fitting toolbox

amp=thres*max(avesig_partialsmooth);

% Determine the gradient of the smoothed signal for the t0 and max dep vel
grad=gradient(avesig_partialsmooth);
grad2=gradient(grad);


% Use for Calcium
% Find the peaks in the 2nd derivative, these correspond to the beginning
% of the upstrokes (t0);
[~,t0_locs] = findpeaks3(grad2,'MINPEAKHEIGHT',mean(grad2)+std(grad2),...
    'MINPEAKDISTANCE',mpd);

% Find the maxima of the smoothed averaged signal
[~,locsa] = findpeaks3(avesig_partialsmooth,'MINPEAKHEIGHT',amp,'MINPEAKDISTANCE',mpd);

% Find all the minima for the smooth averaged signal
[~,~,~,imin] = extrema(avesig_partialsmooth);
% Sort the minima by ascending
imin2=sort(imin,'ascend');

% Find the peaks ~ corresponds to upstroke and max dep vel
[depV,upstroke_locs] = findpeaks3(grad,'MINPEAKHEIGHT',mean(grad)+std(grad),'MINPEAKDISTANCE',mpd);

%% Normalize the signal for 100% and 30% calculations
allpoints=sort(avesig(t0_locs(1):end));
% nump=length(allpoints);
maximum=mean(allpoints)+std(allpoints);
minimum=mean(allpoints)-0.5*std(allpoints);

% bottom=floor(nump*0.50); % this was 0.35 before
% maximum=mean(allpoints(end-20:end));
% minimum=mean(allpoints(1:bottom));
% minimum=mean(avesig(1:t0_locs(1)));

num_peaks=length(locsa);

% First derivative (for voltage) = upstroke_locs
% Second derivative (for calcium) = t0_locs