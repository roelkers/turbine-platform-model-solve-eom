function [ D ] = damping_matrix_for_solving( forces )

%%% computes damping matrix

%%% only features hydrodynamic damping force due to heave velocity from
%%% drag on the mono pile bottom for now

chdz = forces.chdz;

%%% Apply morrisons drag equation:

D = zeros(12,12);

%%% Damping factor is found on the lower right quadrant of the matrix 
%%% on the diagonal

D(9,9) = chdz;




end

