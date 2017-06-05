function lsminf = timestampsread(fid, lsminf)
%TIMESTAMPSREAD Read in actual timestamps from Zeiss LSM file format, do some
%basic calculations
%   LSMINF = TIMESTAMPSREAD(FID, LSMINF)
%
%   FID is the fopen file identifier to read data from.  LSMINF is the
%   previously read LSM headers up to this point, including file offset
%   location for the timestamps.
%

%   Peter Li 12-Apr-07
%   Some rights reserved.  Licensed under Creative Commons: http://creativecommons.org/licenses/by-nc-sa/3.0/

error(nargchk(2, 2, nargin));
if lsminf.OffsetTimeStamps == 0,
    lsminf(1).TimeStamps = [];
    return
end

LSM_H; % TIMESTAMPS from header file

if fseek(fid, lsminf.OffsetTimeStamps, 'bof'),
    error(['Received error on file seek to OffsetTimeStamps(' lsminf.OffsetTimeStamps '): ' ferror(fid)]); 
end

timestamps = structread(fid, TIMESTAMPS);
timestamps.Stamps = fread(fid, timestamps.NumberTimeStamps, 'float64');
timestamps.TimeStamps = timestamps.Stamps - timestamps.Stamps(1);
timestamps.TimeSteps = diff(timestamps.Stamps);
timestamps.AvgStep = mean(timestamps.TimeSteps);

lsminf.TimeStamps = timestamps;
