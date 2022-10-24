function [] = displaySlice(V, vox_dims, dim, slice, axis_type)
% [] = displaySlice(V, vox_dims, dim, slice, axis_type)
% 
% This function displays a single slice from 3D image V.
% 
% INPUTS:
%       V               a 3D matrix containing 3D image data
%       vox_dims        a [1x3] vector containing the spatial dimensions of
%                       a voxel
%       dim             determines which dimension to display.
%                       1 = YZ plane, 2 = XZ plane, 3 = XY plane
%       slice           defines which slice number to plot
%       axis_type       flag to switch axes between pixel index (1) and 
%                       actual distance in mm (2).
% 
% OUTPUTS: none.




% **** ERROR CHECKING ****
if nargin ~= 5
    error('5 inputs required!')
end

% Check axis_type input value
if axis_type ~=1 && axis_type~=2
    error('Wrong axis_type selected. Options are "1" for pixel numbering or "2" for mm scale.');
end

% Obtain image size and check dimension is within bounds:
img_dims = size(V);
Ndim = length(img_dims);
if dim<0 || dim>Ndim
    error('Requested dimension exceeds available dimensions!');
end

% Check requested slice is within bounds:
if slice > img_dims(dim) || slice <= 0
    error('Requested slice is outside of image volume');
end




% **** SELECT SLICE, APPLY ASPECT RATIOS, COMPUTE SPATIAL AXES ****

% Compute actual spatial coordinates of the voxels:
x_axis = (0:img_dims(1)-1) * vox_dims(1);
y_axis = (0:img_dims(2)-1) * vox_dims(2);
z_axis = (0:img_dims(3)-1) * vox_dims(3);

switch dim
    case 1 % Display an YZ plane
        % Select the appropriate slice from the image data:
        to_plot = squeeze(V(slice,:,:))';
        % Apply the voxel aspect ratio - note, this aspect ratio is
        % different for each dimension!
        aspect_ratio = vox_dims([3 2 1]);
        % Compute spatial coordinates for the horizontal and vertical axes
        % of the slice - note, these axes are different for each dimension!
        hor_axis = y_axis;
        ver_axis = z_axis;
    case 2 % Display an XZ plane
        to_plot = squeeze(V(:,slice,:))';
        aspect_ratio = vox_dims([3 1 2]);
        hor_axis = x_axis;
        ver_axis = z_axis;
    case 3 % Display an XY plane
        to_plot = squeeze(V(:,:,slice))';
        aspect_ratio = vox_dims([1 2 3]);
        hor_axis = y_axis;
        ver_axis = x_axis;
end




% **** DISPLAY SLICE ****
colormap gray 
switch axis_type
    case 1 % use voxel indices
        imagesc(to_plot);
        daspect(aspect_ratio);
        xlabel('Voxel index');
        ylabel('Voxel index');
    case 2 % use spatial coordinates
        imagesc(hor_axis,ver_axis,to_plot);
        axis image;
        xlabel('Spatial co-ordinate [mm]');
        ylabel('Spatial co-ordinate [mm]');
end
if dim==1 || dim==2
    axis xy;
end