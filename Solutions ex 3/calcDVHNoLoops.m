function dvh = calcDVHNoLoops(dose,structure,dose_vals)
% dvh = calcDVHNoLoops(dose,structure,dose_vals)
% 
% This function calculates the dose volume histogram (DVH) for a given 
% structure and dose distribution
% 
% INPUTS: 
%   dose:       a 3D array containing the dose at each voxel [Gy]
%   structure:  a logical 3D array indicating which voxels are inside
%               the structure
%   dose_vals:  a vector containing the dose values that the DVH will be
%               calculated for [Gy]
% 
% OUTPUTS: 
%   dvh:        a column vector the same length as dose_vals, giving the
%               percentage of voxels in structure that recieved the 
%               corresponding dose value or greater
%
% for example, if dose_vals was [20 40] the function will return a vector 
% dvh containing 2 elements, where the first element gives the percentage 
% of voxels within the structure that received a dose greater than or equal
% to 20, and the second element gives the percentage of voxels within the 
% structure that received a dose greater than or equal to 40.
%
% NOTE - this function has been implemented using full vectorisation,
% removing ALL loops



% ******** ERROR CHECKING: ********
if ~islogical(structure)
    error('Input structure is expected to be of type logical')
end
if length(size(dose))~=3
    error('Input dose is expected to be a 3D matrix');
end
if ~isnumeric(dose_vals) || ~isreal(dose_vals)
    error('Input dose_vals is expected to be numeric and real-valued');
end


% Select those values of array dose lying within the structure through 
% logical indexing: (this results in a 1D vector!)
dose_in_struct = dose(structure);

% Now use ndgrid to create matrices containing all combinations of values
% from dose_in_struct and dose_vals:
[DOSE_IN_STRUCT, DOSE_VALS] = ndgrid(dose_in_struct,dose_vals);

% And finally compare all values from dose_in_struct against all values 
% from dose_vals:
dvh_counts = DOSE_IN_STRUCT >= DOSE_VALS;
% Note: we had to use ndgrid in line 48 to ensure that DOSE_IN_STRUCT and
%       DOSE_VALS had the same size, otherwise element-wise comparison
%       would not have been possible!

%sum up number of voxels which have dose greater than or equal to dose_val
%for each value of dose_val
dvh = sum(dvh_counts,1);

% Calculate number of voxels that lie within the structure by summing the 
% logical array:
num_vox_struct = sum(structure(:));

%convert dvh to percentage
dvh = 100*dvh/num_vox_struct;