function v_rot = rotateVector(v_orig, angle)
% function v_rot = rotateVector(v_orig, angle)
% 
% This function uses linear algebra to rotate a 2D vector V_ORIG by a
% certain ANGLE. 
% 
% INPUTS:
% v_orig        [2x1] vector
% angle         rotation angle in radians
%
% OUTPUTS:
% v_rot         The rotated result; a [2x1] vector.

if isreal(angle) & isnumeric(angle)
    M = [cos(angle) -sin(angle) ; sin(angle) cos(angle)];
else
    disp('Input ANGLE should be numeric and real-valued.');
    return;
end

if ndims(v_orig) ~= 2   |   numel(v_orig) ~= 2
    disp('Input v_orig expected to be two-dimensional and contain two elements.');
    return;
end

[a,b] = size(v_orig);
if a == 1
    v_orig = v_orig';
    warning('Input v_orig was transposed to meet input requirements!');
end

v_rot = M * v_orig;