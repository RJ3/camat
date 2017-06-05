function tag = structmap(tagcode, map, numprefix)
% STRUCTMAP use struct as a map between field names and values
%   TAG = STRUCTMAP(TAGCODE, MAP, [NUMPREFIX])
%
%   Unfortunately, MatLab structs cannot have numerical field names, so we must
%   use a hack NUMPREFIX.  A better solution would be to use cell arrays and OO
%   programming.
%

%   Peter Li 30-Aug-05
%   Some rights reserved.  Licensed under Creative Commons: http://creativecommons.org/licenses/by-nc-sa/3.0/

error(nargchk(2, 3, nargin));
if nargin < 3, numprefix = 'x'; end % Default NUMPREFIX hack for numerical fields
if ~isstruct(map), error('Second argument must be a struct map'); end

if isnumeric(tagcode),
    tagcode = [numprefix num2str(tagcode)];
elseif ~ischar(tagcode),
    error('Function ''structmap'' is defined for tagcode values of class numeric and char only');
end

if isfield(map, tagcode),
    tag = map.(tagcode);
else
    tag = [];
end
