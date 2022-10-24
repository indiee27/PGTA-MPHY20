function dvh = calcDVHFast(dose,structure,dose_vals)
% dvh = calcDVHFast(dose,structure,dose_vals)
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
% NOTE - this function has been implemented using some vectorisation to
% remove the loops over all voxels



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


% Preallocate output dvh as a vector of the same length as dose_vals:
dvh = zeros(size(dose_vals));

% Select those values of array dose lying within the structure through 
% logical indexing: (this results in a 1D vector!)
dose_in_struct = dose(structure);
% In words, the expression above reads:
% 'Take those values of "dose" where "structure" is equal to one, and 
% assign them to "dose_in_struct".'

% Loop over values in dose_vals and test how many of the dose_in_struct
% values are greater than or equal to the value from dose_val
for n = 1:length(dose_vals)
    dvh(n) = sum(dose_in_struct>=dose_vals(n));
end

% Calculate number of voxels that lie within the structure by summing the 
% logical array:
num_vox_struct = sum(structure(:));
% Note: (:) tells MATLAB to treat the variable as a 1D vector instead,
% which simplifies the summation. Alternatively, you could use
% num_vox_struct = sum(sum(sum(structure)));

%convert dvh to percentage
dvh = 100*dvh/num_vox_struct;