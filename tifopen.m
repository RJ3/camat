function [data3, fps, fname, pname]=tifopen(source)

% Open TIFF files, especially those taken with MetaMorph 7.5 TIFF format
% 2018-08-06 ver 1.0 RJ3

seed='/media/';

switch nargin
    case 0 % source was unspecified
        [fname,pname]=uigetfile({'*.tif';'*.tiff'},'Select a TIFF Stack',seed);
        source=[pname,fname];    
    case 1 % file source was specified
        fname=[]; % these output vars will be blank, since source was specified
        pname=[]; % these output vars will be blank, since source was specified
end

init=imfinfo(source);
nImages=length(init);

endTime=datetime(init(nImages).DateTime,'InputFormat','yyyyMMdd HH:mm:ss.SSS');
startTime=datetime(init(1).DateTime,'InputFormat','yyyyMMdd HH:mm:ss.SSS');
totalTime=endTime-startTime;
dt=milliseconds(totalTime)/nImages;
fps=1/(dt/1000);

imageW=init(1).Width;
imageH=init(1).Height;
data3=zeros(imageH,imageW,nImages,'uint16');

for p=1:nImages
    data3(:,:,p)=imread(source,'index',p,'Info',init);
end
