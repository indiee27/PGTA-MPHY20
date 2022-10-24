% Load the CT data:
load('CT_vol.mat');

% Display the slice orthogonal to the first dimension, at index 256, using
% mm as axis unit:
figure;
subplot(2,3,[1 2]);
displaySlice(V, vox_dims, 1, 256, 2);

% Display the slice orthogonal to the second dimension, at index 256, using
% the voxel count as axis unit:
subplot(2,3,[4 5]);
displaySlice(V, vox_dims, 2, 256, 1);

% Display the slice orthogonal to the third dimension, at index 75, using
% mm as axis unit:
subplot(2,3,[3 6]);
displaySlice(V, vox_dims, 3, 75, 2);
