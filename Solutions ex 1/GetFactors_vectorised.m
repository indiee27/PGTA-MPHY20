function factors = GetFactors_vectorised(input)
% function factors = GetFactors_vectorised(input)
% 
% This function returns the factorisation of INPUT. This implementation
% uses vectorisation to remove all for-loops.
%
% inputs:
% input         The number to be factorised. Is expected to be an integer
%
% output:
% factors       a 1D vector containing all positive factors.

possible_factors = 1:sqrt(input);
factors = possible_factors(rem(input,possible_factors)==0);
