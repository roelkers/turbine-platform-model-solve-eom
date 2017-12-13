function [ D ] = damping_matrix_for_solving(params, forces )

%%% computes damping matrix

%%% only features hydrodynamic damping force due to heave velocity from
%%% drag on the mono pile bottom for now

forces.chdz = damping_constant_due_to_heave_velocity(params);

chdz = forces.chdz;

%%% Apply morrisons drag equation:

D = zeros(12,12);

%%% Damping factor is found on the lower right quadrant of the matrix 
%%% on the diagonal

%%%Imaginary part is dismissed

D(9,9) = real(chdz);




end

