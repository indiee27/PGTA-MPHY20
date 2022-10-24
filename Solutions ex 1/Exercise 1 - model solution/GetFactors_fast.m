function factors = GetFactors_fast(input)
% function factors = GetFactors_fast(input)
% 
% This function returns the factorisation of INPUT. This is a faster
% implementation of GetFactors
%
% inputs:
% input         The number to be factorised. Is expected to be an integer
%
% output:
% factors       a 1D vector containing all positive factors.

if numel(input) > 1
    disp('Scalar input expected.');
end

factors = [1 input];   % 1 and input are always factors of input

% Only need to test to sqrt(input), any larger factor can be obtained by
% dividing input by smaller factors:
for ncnt = 2:floor(sqrt(input))
    if rem(input,ncnt) == 0
        factors = [factors , ncnt, input/ncnt];
    end
end

%finally check if sqrt(n) is a factor
if rem(input,sqrt(input)) == 0
    %if so remove the last factor as it will have been added twice
    factors = factors(1:end-1);
end

% Optional: sort factors into monotonically increasing vector:
factors = sort(factors);