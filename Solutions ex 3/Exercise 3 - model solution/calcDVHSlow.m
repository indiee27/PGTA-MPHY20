function dvh = calcDVHSlow(dose,structure,dose_vals)
% dvh = calcDVHSlow(dose,structure,dose_vals)
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
% NOTE - this function has been implemented using non-vectorised code



% ******** ERROR CHECKING: ********
if ~islogical(structure)
    error('Input structure is expected to be of type logical')
end
if length(size(dose))~=3
    error('Input dose is expected to be a 3D matrix');
end
if ~isnumeric(dose_vals) | ~isreal(dose_vals)
    error('Input dose_vals is expected to be numeric and real-valued');
end


% Preallocate output dvh as a vector of the same length as dose_vals:
dvh = zeros(size(dose_vals));


% The multi-nested loop below loops through all voxels, checks whether the
% current voxel lies within the structure, and if so checks whether the 
% dose received in the current voxel exceeds the value(s) in dose_vals:
for xcnt = 1:size(dose,1)
    for ycnt = 1:size(dose,2)
        for zcnt = 1:size(dose,3)
            
            % Check whether current voxel lies within structure:
            % Alternatively: "if structure(xcnt,ycnt,zcnt)==1"
            if structure(xcnt,ycnt,zcnt) 
                
                % Finally loop over each dose_val and test whether the 
                % received dose is greater or equal to dose_val. If so,
                % add one to corresponding dvh count:
                for n = 1:length(dose_vals)
                    
                    if dose(xcnt,ycnt,zcnt) >= dose_vals(n)
                        
                        dvh(n) = dvh(n) + 1;
                    
                    end
                end
                
            end
            
        end
    end
end

% What this results in, is a vector containing in each element the numbers
% of voxels that received a dose greater or equal to that in the
% corresponding element of dose_vals. This still needs to be converted into
% a persentage:

% Calculate number of voxels that lie within the structure by summing the 
% logical array:
num_vox_struct = sum(structure(:));
% Note: (:) tells MATLAB to treat the variable as a 1D vector instead,
% which simplifies the summation. Alternatively, you could use
% num_vox_struct = sum(sum(sum(structure)));

%convert dvh to percentage
dvh = 100*dvh/num_vox_struct;