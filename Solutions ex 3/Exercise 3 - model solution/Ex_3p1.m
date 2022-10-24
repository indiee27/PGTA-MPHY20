% Load RT data:
load('RTdata.mat');

% Compute smoothed version of ctv:
ctv_smooth = smooth3(ctv);

figure;

% Visualisation of the raw data:
subplot(1,3,1);
patch(isosurface(ctv,0.5),'facecolor','r','edgecolor','none');
% Lighting, view, axes:
view(3);    
camlight;   lighting gouraud;
axis equal vis3d;
title('raw data');

% Visualisation of the smoothed data:
subplot(1,3,2);
patch(isosurface(ctv_smooth,0.5),'facecolor','r','edgecolor','none');
% Lighting, view, axes:
view(3);
camlight;   lighting gouraud;
axis equal vis3d;
title('smoothed data');

% Visualisation of the smoothed data using isonormals:
subplot(1,3,3);
ctv_h = patch(isosurface(ctv_smooth,0.5),'facecolor','r','edgecolor','none');
isonormals(ctv_smooth,ctv_h);
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
hold on;

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
d_h = slice(double(dose),[],[],55);
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