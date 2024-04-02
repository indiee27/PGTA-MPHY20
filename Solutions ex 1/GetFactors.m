function factors = GetFactors(input)
% function factors = GetFactors(input)
% 
% This function returns the factorisation of INPUT.
%
% inputs:
% input         The number to be factorised.
%
% output:
% factors       a 1D vector containing all positive factors.

if numel(input) > 1
    disp('Scalar input expected.');
end

factors = [];   % Allocate empty variable
for ncnt = 1:input
    if rem(input,ncnt) == 0
        factors = [factors , ncnt];
        factors(ncnt) = input;
    end
end