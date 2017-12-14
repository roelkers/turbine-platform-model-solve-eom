function [ D ] = damping_matrix_for_solving(params, M,K,Om )


%%% computes damping matrix

%%% damping matrix computed using Raleigh damping
%%% C = alpha*M + beta*K

%%% Alpha and Beta are scalars that can be found based on guesses
%%% (or measurements) of the damping ratios of the two lowest modes 
%%% zeta_1 and zeta_2. The two lowest modes are fore-aft roll and side-side
%%% roll.
%%% It is assumed that zeta_1 = zeta_2 for a cylinder.
%%% For a box they are not equal.

zeta1 = params.zeta_roll;
zeta2 = params.zeta_side;

alpha = 2*Om(1)*Om(2)/(Om(2)^2-Om(1)^2)*(Om(2)*zeta1 -Om(1)*zeta2);

beta = 2*Om(1)*Om(2)/(Om(2)^2-Om(1)^2)*(-1/Om(2)*zeta1 + 1/Om(1)*zeta2);

D = real(alpha*M + beta*K);

end

