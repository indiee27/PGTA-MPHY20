% This script finds the first N perfect numbers and displays them.
% The current list of known perfect numbers can be found here;
% https://en.wikipedia.org/wiki/List_of_perfect_numbers

N = 5;  % Limit the search to the first N perfect numbers

no_found = 0;
index = 0;
tic;
while no_found < N
    index = index + 1;
    if TestPerfect(index)
        % Display the found perfect number:
        disp(index);
        
        % Increase counter:
        no_found = no_found + 1;
        
        % Display the time it took to find the current perfect number
        toc;tic;
    end
end


% The first 5 perfect numbers are 6, 28, 496, 8128 and 33.550.336.
% As they increase rapidly, these are very costly to compute!