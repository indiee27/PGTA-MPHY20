% define a 2D column vector
v_orig = [1 ; 0]
% 60o rotation
angle = pi/3

% Call function rotateVector to rotate the vector a given angle:
v_rot = rotateVector(v_orig, angle)


disp('*****');
% And to rotate the vector [2 -2] by 45 deg:
v_orig = [2 ; -2]
angle = 45 / 360 * 2*pi;    % angle in degrees

% Call function rotateVector to rotate the vector a given angle:
v_rot = rotateVector(v_orig, angle)
