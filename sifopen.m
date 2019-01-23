function [ret, data3, fps, gain,fname,pname]=sifopen(source, ext)
%{
[ret, data, fps, gain]=sifopen99(source) where source is a string 
containing Andor .sif file name ret will return 0 if error occurs, 1 if ok. 
Data is a 3D image array across time. FPS is the 1/KineticCycleTime, and 
gain is the pre-amplifier gain.
IMPORTANT DEPENDENCIES: 
atsifiomex.mexw32 with ATSIFIO.dll
OR 
atsifiomex.mexw64 with ATSIFIO64.dll 
IN YOUR SET DIRECTORY FOR 32-BIT AND 64-BIT VERSIONS OF MATLAB RESPECTIVELY

Rafael Jaimes III 2012-11-11 ver 1.0
2017-01-02 ver 1.1 -- modified for GUI file selection and implementation
2018-07-11 -- fixed filterindex bug so it works with listbox in camat.
with camat GUI.
%}
addpath(genpath('dependencies'))

%seed='/run/media/lab/Posnack_Lab_Lang/Lang/RH237/';
seed='E:\Zyla\';

switch nargin
    case 0 % source was unspecified
        [fname,pname,filterindex]=uigetfile({'*.sif';'*.sifx'},'Select an Andor file',seed);
        source=[pname,fname];
    case 1 % file source was specified
        fname=[]; % these output vars will be blank, since source was specified
        pname=[]; % these output vars will be blank, since source was specified
        filterindex=1; %source only works for .SIF for now.
    case 2 % file source and ext were specified
        fname=[]; % these output vars will be blank, since source was specified
        pname=[]; % these output vars will be blank, since source was specified
        if strcmpi(ext, '.sif')
            filterindex = 1;
        elseif strcmpi(ext, '.sifx')
            filterindex = 2;
        end
end



rc=atsif_readfromfile(source);
if (rc == 22002)
    if filterindex == 1 % Normal andor .SIF selected
        disp('.SIF loading...')
        [~,loaded] = atsif_isloaded();
        if loaded
            %signal=0, ref=1, backgd=2, 3=source, 4=live;
            signal=0;            
            [~,present]=atsif_isdatasourcepresent(signal);    
                 if present
                    ret=1;
                    [~,KCT]=atsif_getpropertyvalue(signal,'KineticCycleTime');
                    fps=1/str2double(KCT);
                    [~,noframes]=atsif_getnumberframes(signal);
                    [~,size]=atsif_getframesize(signal);
                    [~,data]=atsif_getallframes(signal, size*noframes);
                    [~,left,bottom,right,top,hBin,vBin]=atsif_getsubimageinfo(signal,0);                    
                    [~,sgain]=atsif_getpropertyvalue(signal,'PreAmplifierGain');
                    gain=str2double(sgain);
                 end
            data3=reshape(data, (right-left+1)/hBin, (top-bottom+1)/vBin, noframes);
        end      
        disp('DONE loading .SIF...')
    elseif filterindex == 2 % Zyla .SIFX selected
        disp('.SIFX selected')
        [~,loaded] = atsif_isloaded();
        if loaded
            %signal=0, ref=1, backgd=2, 3=source, 4=live;
            signal=0;            
            [~,present]=atsif_isdatasourcepresent(signal);    
             if present
                ret=1;
                [~,KCT]=atsif_getpropertyvalue(signal,'KineticCycleTime');
                fps=1/str2double(KCT);
                [~,noframes]=atsif_getnumberframes(signal);
                [~,size]=atsif_getframesize(signal);
                [~,left,bottom,right,top,hBin,vBin]=atsif_getsubimageinfo(signal,0);                    
                [~,sgain]=atsif_getpropertyvalue(signal,'PreAmplifierGain');
                gain=str2double(sgain);
                data3=zeros((right-left+1)/hBin,(top-bottom+1)/vBin,noframes);
                for fn=0:1:noframes-1
                    [~,data]=atsif_getframe(signal, fn,size);
                    data3(:,:,fn+1)=reshape(data, (right-left+1)/hBin,(top-bottom+1)/vBin); % 
                end
             end
        disp('DONE loading .SIFX...')     
        end
    end
    atsif_closefile();
end     
   
if (rc == 22003)
    disp('SIF Format Error')
end

if (rc == 22004)
    disp('SIF Not Loaded')
end

if (rc == 22005)
    disp('SIF File Not Found')
end

if (rc == 22006)
    disp('SIF File Not Found')
end

if (rc == 22007)
    disp('SIF File Empty')
end

end
%{
Defining the 16 functions from the Andor SDK here.
Not all of these functions may be used in this version of sifopen, but they
are here for future implementation.
YOU NEED TO HAVE atsifiomex.mexw32 OR atsifiomex.mexw64 IN YOUR DIRECTORY 
FOR 32-BIT AND 64-BIT VERSIONS OF MATLAB RESPECTIVELY
%}

function ret=atsif_closefile()
ret = atsifiomex('ATSIF_CloseFile');
end

function [ret,data]=atsif_getallframes(source, size)
[ret,data] = atsifiomex('ATSIF_GetAllFrames', source, size);
end

function [ret,startPos]=atsif_getdatastartbyteposition(source)
[ret,startPos] = atsifiomex('ATSIF_GetDataStartBytePosition', source);
end

function [ret,data]=atsif_getframe(source, index, size)
[ret,data] = atsifiomex('ATSIF_GetFrame', source, index, size);
end

function [ret,size]=atsif_getframesize(source)
[ret,size] = atsifiomex('ATSIF_GetFrameSize', source);
end

function [ret,noframes]=atsif_getnumberframes(source)
[ret,noframes] = atsifiomex('ATSIF_GetNumberFrames', source);
end

function [ret,nosubImgs]=atsif_getnumbersubimages(source)
[ret,nosubImgs] = atsifiomex('ATSIF_GetNumberSubImages', source);
end

function [ret,calVal]=atsif_getpixelcalibration(source, axis, pixel)
[ret,calVal] = atsifiomex('ATSIF_GetPixelCalibration', source, axis, pixel);
end

function [ret,type]=atsif_getpropertytype(source, propName)
[ret,propType] = atsifiomex('ATSIF_GetPropertyType', source, propName);
end

function [ret,propVal]=atsif_getpropertyvalue(source, propName)
[ret,propVal] = atsifiomex('ATSIF_GetPropertyValue', source, propName);
end

function [ret,versH,versL]=atsif_getstructureversion(element)
[ret,versH,versL] = atsifiomex('ATSIF_GetStructureVersion', element);
end

function [ret,left,bottom,right,top,hBin,vBin]=atsif_getsubimageinfo(source, index)
[ret,left,bottom,right,top,hBin,vBin] = atsifiomex('ATSIF_GetSubImageInfo', source, index);
end

function [ret,present]=atsif_isdatasourcepresent(source)
[ret,present] = atsifiomex('ATSIF_IsDataSourcePresent', source);
end

function ret=atsif_readfromfile(filename)
ret = atsifiomex('ATSIF_ReadFromFile',filename);
end

function ret=atsif_setfileaccessmode(readmode)
ret = atsifiomex('ATSIF_SetFileAccessMode',readmode);
end

function [ret,loaded] = atsif_isloaded()
[ret,loaded] = atsifiomex('ATSIF_IsLoaded');
end