% repeat the following code with i taking each value
% between 1 and 10 (in steps of 1)
disp('***** squares of numbers 1 through 10:');
for i=1:1:10
    disp([i,i*i]) % display the number and its square
end % end the for-loop (very important!)



% Modify to generate the squares of only all even numbers between 1 and 10:
disp('***** squares of even numbers between 2 and 10:');
for i = 2:2:10
    disp([i,i*i]) % display the number and its square
end % end the for-loop (very important!)


% Modify to generate the squares of all numbers between 10 and 1, descending:
disp('***** squares of descending numbers between 10 and 1:');
for i = 10:-1:1
    disp([i,i*i]) % display the number and its square
end % end the for-loop (very important!)


% Modify to generate the cubes of all numbers 1 and 20:
disp('***** cubes of numbers between 1 and 20:');
for i = 1:20
    disp([i,i*i*i]) % display the number and its square
end % end the for-loop (very important!)
