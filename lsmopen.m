function [data,dt]=lsmopen

% Zeiss LSM 510 READER
% Rafael Jaimes, PhD
% 2016-04-05

addpath(genpath('dependencies'))
% fname='/run/media/data/Data/Probenecid study/Frame Scan - calcium/exp119-control20xdifffreq.lsm';
[fname,pname]=uigetfile({'*.lsm'},'Select a Zeiss .lsm file','/run/media/data/Data/Probenecid study/');
header = bfopen([pname,fname]);
first=header{1,1}(1,1);
nframes=length(header{1,1}(:,1));
xy=size(first{1,1});
data=zeros(xy(1),xy(2),nframes);

metadata=header{1,2};
time2 = metadata.get('TimeStamp #00002');
time1 = metadata.get('TimeStamp #00001');
dt=time2-time1;

for p=1:nframes
    predata=header{1,1}(p,1);
    data(:,:,p)=predata{1,1};
end