%% 1. Load the CT data:
load('CT_vol.mat');

%% 2. Display the slice orthogonal to the first dimension, at index 256, using
figure;
imagesc(squeeze(V(270,:,:)));
% V(270,:,:) will generate a 1x512x107 dataset, 
% squeeze turns it into a 512x107
axis image;
colormap gray;

%% 3. other dimensions
figure;
subplot(2,1,1)
imagesc(squeeze(V(:,270,:)))
colormap gray
subplot(2,1,2)
imagesc(V(:,:,100))

% why is squeeze not needed in the third dimension?
%m = V(:,:,100);
%n = V(:,270,:);
%o = V(270,:,:);

%% 4. transpose
figure;
imagesc(squeeze(V(270,:,:))');

%% 5. correct axes
figure;
subplot(2,2,1)
imagesc(squeeze(V(270,:,:)));
subtitle('normal')
subplot(2,2,2)
imagesc(squeeze(V(270,:,:))');
subtitle('transposed')
subplot(2,2,3)
imagesc(squeeze(V(270,:,:)));
axis xy;
subtitle('correct orientation')
subplot(2,2,4)
imagesc(squeeze(V(270,:,:))');
axis xy;
subtitle('transposed and correct orientation')

%% 6. data ratios and axis labels
% voxel measures 1.12 x 1.12 mm (xy)
% each slice is 3 mm

% first way (voxels):
figure;
subplot(1,2,1);
imagesc(squeeze(V(270,:,:))');
axis xy;
x = vox_dims(2);
y = vox_dims(3);
z = 1; % because its a 2d image so don't need the z dimension but not putting a 1 will create an error
daspect(1./[x y z]); % 1./ because its transposed

% second way (mm):
subplot(1,2,2)
i = vox_dims(2)*(0:img_dims(2)-1);
j = vox_dims(3)*(0:img_dims(3)-1);
imagesc(i,j,squeeze(V(270,:,:))');
axis xy;

%% 7. calling the function written
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
