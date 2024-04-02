% Load RT data:
load('RTdata.mat');

% Compute smoothed version of ctv:
ctv_smooth = smooth3(ctv);

figure; % open the figure

% Visualisation of the raw data:
subplot(1,3,1);
patch(isosurface(ctv,0.8),'facecolor','r','edgecolor','none'); % these are the name-value pairs 
% I would suggest looking at the documentation for the 'patch' command to
% see the input variables you can use (right click on 'patch' and click 'Help on patch'). Alternatively there is a very good
% list of variables you can enter here: https://uk.mathworks.com/help/matlab/ref/matlab.graphics.primitive.patch-properties.html

% Lighting, view, axes:
view(3); % this is what we were discussing when your computer plotted the top view - try changing the value here to see what it plots
camlight;   lighting gouraud;
axis equal vis3d;
title('raw data');

% Visualisation of the smoothed data:
subplot(1,3,2);
patch(isosurface(ctv_smooth,0.5),'facecolor','r','edgecolor','none'); % the input here is the ctv_smooth that is calculated in Line 5
% Lighting, view, axes:
view(3);
camlight;   lighting gouraud;
axis equal vis3d;
title('smoothed data');

% Visualisation of the smoothed data using isonormals:
subplot(1,3,3);
ctv_h = patch(isosurface(ctv_smooth,0.5),'facecolor','r','edgecolor','none');
isonormals(ctv_smooth,ctv_h); % in general this computes the normal of the vertices which basically makes the data smoother, it doesn't appear to change much here but it will for more varied datasets
% Lighting, view, axes:
view(3);
camlight;   lighting gouraud;
axis equal vis3d;
title('smoothed data with isonormals');

 

% ======== Create four-component visualisation: ========

% Smoothing data: (remember: ctv has already been smoothed above)
brainstem_smooth    = smooth3(brainstem);
r_parotid_smooth    = smooth3(r_parotid);
spinal_canal_smooth = smooth3(spinal_canal);

figure;
hold on; % this command is just a workaround to plot multiple things on the same axes, otherwise only the last plot will be shown

% Display the four isosurfaces:
% Set edge color to 'none' to suppress edges
% Set facealpha to 0.5 to achieve partial transparency
ctv_h   = patch(isosurface(ctv_smooth,0.5));
set(ctv_h,'edgecolor','none','facecolor','m','facealpha',0.5);
bs_h    = patch(isosurface(brainstem_smooth,0.5));
set(bs_h,'edgecolor','none','facecolor','b');
sc_h    = patch(isosurface(spinal_canal_smooth,0.5));
set(sc_h,'edgecolor','none','facecolor','r');
rp_h    = patch(isosurface(r_parotid_smooth,0.5));
set(rp_h,'edgecolor','none','facecolor','g');

% Set isonormals:
isonormals(ctv_smooth,          ctv_h);
isonormals(brainstem_smooth,    bs_h);
isonormals(spinal_canal_smooth, sc_h);
isonormals(r_parotid_smooth,    rp_h);

% Display slice from dose at z index 55:
d_h = slice(double(dose),[],[],55); % make sure you have a look at the documentation here for the 'slice' function
% the square brackets here are just placeholders for the x and y indices
set(d_h,'edgecolor','none','facealpha',0.5);
xlabel('x');
ylabel('y');
zlabel('z');
legend('CTV','Brainstem','Spinal canal','Parotid','Slice z = 55');
hold off;

% Lighting, view, axes:
view(3);
camlight;   lighting gouraud;
axis equal vis3d;

% --- Optional: uncomment these expressions to add a box and colorbar:
% --- Draw box around visualisation to aid 3D interpretation
box on;
% --- Show colorbar to help interpret the values in the displayed slice
colorbar;

% my advice in general for data visualisation in MATLAB is to just play
% with the different variables to see how it affects the image you create -
% this is a template here for the 'correct' visualisation of the data given
% to you so use it to test out the different functions and see how you can
% change the image, for example try using different isovalues (the 0.5 in
% isosurface) or changing the display properties like edgecolor or
% transparency etc