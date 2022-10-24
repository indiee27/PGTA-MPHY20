function is_prime = TestPrime(input)
% function is_prime = TestPrime(input)
% 
% This function tests whether INPUT is prime
%
% INPUTS:
% input     - a positive integer
% 
% OUTPUTS:
% is_prime  - a logical indicating if INPUT is prime

%find positive factors of n
factors = GetFactors(input);

%if there are only two factors then n is prime
is_prime = numel(factors) == 2;
%could also use size or length functions instead of numel