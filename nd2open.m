function [data,dt,fname]=nd2open(source)

% Nikon ND2 READER
% Rafael Jaimes, PhD
% 2016-04-29
% 2018-07-24 - updated to take a path in the filename

switch nargin
    case 0 % source was unspecified
        [fname,pname]=uigetfile({'*.nd2'},'Select a Nikon .nd2 file','/run/media/data/Data/');
        source=[pname,fname];    
    case 1 % file source was specified
        fname=[]; % these output vars will be blank, since source was specified
        pname=[]; % these output vars will be blank, since source was specified
end

addpath(genpath('dependencies'))
header = bfopen(source);
first=header{1,1}(1,1);
nframes=length(header{1,1}(:,1));
xy=size(first{1,1});
data=zeros(xy(1),xy(2),nframes);

metadata=header{1,2};
time2 = metadata.get('timestamp #0002');
time1 = metadata.get('timestamp #0001');

if isempty(time1)
    time2 = metadata.get('timestamp #00002');
    time1 = metadata.get('timestamp #00001');
end


dt=time2-time1;

for p=1:nframes
    predata=header{1,1}(p,1);
    data(:,:,p)=predata{1,1};
end