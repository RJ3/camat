function [trace,dt,fname]=txtopen

[fname,pname]=uigetfile({'*.txt'},'Select a TSV .txt file');


delimiter = '\t';
startRow = 2;

%% Format string for each line of text:
%   column6: double (%f)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%*s%f%*s%*s%*s%f%[^\n\r]';

%% Open the text file.
fileID = fopen([pname, fname],'r','n','UTF16-LE');
% Skip the BOM (Byte Order Mark).
fseek(fileID, 2, 'bof');

%% Read columns of data according to format string.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'EmptyValue' ,NaN,'HeaderLines' ,startRow-1, 'ReturnOnError', false);

%% Close the text file.
fclose(fileID);

%% Post processing for unimportable data.
% No unimportable data rules were applied during the import, so no post
% processing code is included. To generate code which works for
% unimportable data, select unimportable cells in a file and regenerate the
% script.

%% Allocate imported array to column variable names
time = dataArray{:, 1};
trace = dataArray{:,2};

dt=time(2,1)-time(1,1);