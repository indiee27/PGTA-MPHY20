%% EXERCISE 1.1
disp('This is my first script')
x = pi;
y = sin(x);

% -----------------------------------------------------------
%% EXERCISE 1.2
% -----------------------------------------------------------
clear x
clear y

% EXAMPLE LOOP
for i = 1:1:10
    [i, i*i];
end

% changed for:
% 1. square of only all the even numbers
for i = 2:2:10
    [i, i*i];
end
% 2. square of each number in descending order
for i = 10:-1:1
    [i, i*i];
end
% 3. the cube of each number from 1 - 20
for i = 1:20
    [i, i*i*i];
end

% ---------------------------------------------------
%% EXERCISE 1.3
% ---------------------------------------------------
clear ans
clear i 

number = input('Input a positive integer');
fprintf('Your number was %d.\n', number);
% %d is a datatype and precision identifier
% \n is the New Line command and forces a line break in the displayed output.

% ---------------------------------------------------
%% EXERCISE 1.4
% ---------------------------------------------------
clear number

v = [1;0];
angle = pi/3;
M = [cos(angle) -sin(angle);sin(angle) cos(angle)];
v_rot = M*v;

% rotate [2 ; -2] by -45 degrees
V = [2; -2];
angle = -45;
angle = angle/360 * 2*pi;
M = [cos(angle) -sin(angle);sin(angle) cos(angle)];
V_rot = M*V;

% -----------------------------------------------------
%% EXERCISE 1.6
clear v V v_rot V_rot M angle



N = 5;  % Limit the search to the first N perfect numbers

num_found = 0;
i = 0; % index
tic; % stopwatch
while num_found < N
    i = i + 1;
    if TestPerfect(i)
        % display the found perfect number:
        disp(i);
        
        % increase counter:
        num_found = num_found + 1;
        
        % display the time it took to find the current perfect number
        toc;tic;
    end
end


