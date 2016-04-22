function [lsminf,scaninf,imfinf] = lsminfo(filename)
%LSMINFO read headers and entry directories for Zeiss LSM files
%   LSMINF = LSMINFO(FILENAME)
%
%   This will give you access to the notes that the Zeiss software stores in
%   .lsm files.  All the info is returned in the LSMINF structure, with major
%   substructures such as LSMINF.ScanInfo.  For backwards compatibility you can
%   also call the function as [LSMINF, SCANINF] = LSMINFO(FILENAME) to get the
%   large scaninfo substructure as its own separate return, but this is
%   deprecated.
%
%   You can also get the standard TIFF IMFINFO headers by calling the function as
%   [LSMINF, SCANINF, IMFINF] = LSMINFO(FILENAME).
%
%   Unfortunately, I haven't implemented a way to read the actual images out of
%   the LSM file; MatLab's builtin IMREAD should read TIFF files, but doesn't
%   seem to work with LSM.  The method I use is to export the LSM stack to a
%   series of single image files or a stacked TIFF using the Zeiss LSM Image
%   Browser and then use a FOR loop and IMREAD to get the data into MatLab.
%   There are some TIFF reader implementations available online that say they
%   will work to get image data out of LSM, but I haven't checked those out much
%   myself.
%
%   Also note that if you have the .mdb file that the Zeiss software puts out,
%   this can be read with Microsoft Access and includes much of the same
%   information.
%
%   See comments in file for license info, change log, and acknowledgements.
%

%    Updates from version 1.0.0 (30-Aug-05):
%       Most of the code in the current version is derived from LSM Toolbox, a
%       plugin for the image processing program ImageJ maintained by Patrick
%       Pirrotte and Jerome Mutterer.   However, there is some functionality
%       from my original version that I've kept for backwards compatibility.
%
%       LSM_H
%           Filled in many more field names read from the initial LSM header; no
%           more 'unknown' headers.  Also changed the names to match the LSM
%           Toolbox for ImageJ.  However, to maintain backward compatibility I
%           am leaving the old LSMINF fields there, even in cases where they are
%           duplicated in the new fields.
%
%           Filled in a few more names for the scaninfo tag map.  Should be up
%           to date with all names available from ImageJ now.  This has a small
%           possibility of breaking old code if you were using a scaninfo field
%           that hadn't been properly named before.  In this case, you were
%           accessing the scaninfo field by its hex value alone, e.g.
%           'scaninf.hD0000003'.  You will have to change your code to use the
%           new proper field name; look up the proper name from the tag map
%           struct in LSM_H.
%
%       lsminfo
%           Added functions to read channelcolors and timestamps info, thanks to
%           David Kolin from Montreal for the idea. This new information is put 
%           directly into lsminf.  I also put scaninf directly into lsminf as 
%           lsminf.ScanInfo, so now you can run lsminfo with only one output.
%
%           If you run lsminf without the 3rd output, it won't bother to run the
%           imfinf, as this was taking a lot of time and Norbert Kirchgessner
%           suggested I take it out.
%
%           Added check for fopen/fclose bug.  If fid was already opened before
%           running lsminfo, we will not fclose it when we are done.
%
%       New files:
%           channelinforead
%           timestampsread

%   Peter Li 12-Apr-07
%   Some rights reserved.  Licensed under Creative Commons: http://creativecommons.org/licenses/by-nc-sa/3.0/

error(nargchk(1, 1, nargin));
if ~exist(filename, 'file'), error(['Could not find file: ' filename]); end

LSM_H; % LSMINF from header file

openedfids = fopen('all');
fid = fopen(filename);
if fid == -1, error(['Could not open file: ' filename]); end

% Read special LSM IFD
ifd = ifdread(fid);
lsmifd = ifd([ifd.tagcode] == 34412);
if ~length(lsmifd), error('Could not find LSMINFO IFD entry'); end

% Read LSMINFO header
    % Old version of LSMINF for backward compatibility
    if fseek(fid, lsmifd.offset, 'bof'), error(['Received error on file seek to LSMInfoOffset(' lsmifd.offset '): ' ferror(fid)]); end
    lsminf = structread(fid, LSMINF);

    % New version of LSMINF
    if fseek(fid, lsmifd.offset, 'bof'), error(['Received error on file seek to LSMInfoOffset(' lsmifd.offset '): ' ferror(fid)]); end
    lsminf2 = structread(fid, LSMINF_2);

    lsminf = structcombine(lsminf, lsminf2);

% Read additional small databases and incorporate them into LSMINFO
lsminf = channelinforead(fid, lsminf);
lsminf = timestampsread(fid, lsminf);

% Read SCANINFO directory
scaninf = scaninforead(fid, lsminf.OffsetScanInformation);
lsminf.ScanInfo = scaninf;

% Watch out for fopen bug; if fid was already opened before running lsminfo,
% then we should leave it open.
if ~length(openedfids == fid)
    fclose(fid);
end

% Use MatLab imfinfo to read standard TIFF IFD entries
if nargout > 2
    imfinf = imfinfo(filename);
end