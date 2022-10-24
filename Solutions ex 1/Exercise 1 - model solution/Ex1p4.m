% define a 2D column vector
v_orig = [1 ; 0]
% 60o rotation
angle = pi/3
% 2x2 rotation matrix
M = [cos(angle) -sin(angle) ; sin(angle) cos(angle)]
% rotate the original vector by the 2x2 matrix
v_rot = M*v_orig


disp('*****');
% And to rotate the vector [2 -2] by 45 deg:
v_orig = [2 ; -2]
angle = 45                      % angle in degrees
angle = angle / 360 * 2*pi;     % convert angle to radians
M = [cos(angle) -sin(angle) ; sin(angle) cos(angle)];
v_rot = M * v_orig