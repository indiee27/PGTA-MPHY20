function is_perfect = TestPerfect(input)
% function is_perfect = TestPerfect(input)
% 
% This function tests whether INPUT is a perfect number
%
% INPUTS:
% input         - a positive integer
% 
% OUTPUTS:
% is_perfect    - a logical indicating if INPUT is a perfect number

%find positive factors of n
factors = GetFactors(input);

%if n is perfect the sum of the factors (excluding the n) will equal n,
%i.e. the sum of the factors (including n) will equal 2*n
is_perfect = sum(factors) == 2*input;