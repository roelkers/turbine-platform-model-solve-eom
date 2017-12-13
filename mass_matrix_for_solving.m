function M = mass_matrix_for_solving(params)

%%% Floating Platform Model
%%% Author: Rufus Oelkers
%%% Chair of Experimental Fluid Dynamics TU Berlin 

%%% Computation of eigenmodes of a
%%% floating platform installed under an offshore wind
%%% turbine

%%% Main Function

%%% For detailed explanation of parameters and model
%%% refer to paper of TU Denmark


%%% DOF 
%%% Vector q contains the 6 DOF of the system

%%% q(1): (x) fore-aft displacement [m]
%%% q(2): (y) side-side displacement [m]
%%% q(3): (z) negative-heave displacement [m]
%%% q(4): (Theta_x) side-side roll [rad]
%%% q(5): (Theta_y) fore-aft roll [rad]
%%% q(6): (Theta_z) yaw [rad]
%%% q(7): (xdot) fore-aft displacement velocity [m/s]
%%% q(8): (ydot) side-side displacement velocity [m/s]
%%% q(9): (zdot) negative-heave displacement velocity [m/s]
%%% q(10): (Thetadot_x) side-side roll velocity [rad/s]
%%% q(11): (Thetadot_y) fore-aft roll velocity [rad/s]
%%% q(12): (Thetadot_z) yaw velocity [rad/s]


%%% System parameters 

%%% collected in parameter structure
%%% mn : total mass of rotor/nacelle
%%% m0 : total mass (0th order mass moment)
%%% m1 : 1st order mass moment
%%% m2 : 2nd order mass moment (mass moment of inertia in roll)
%%% It : mass moment of inertia in torsion

m0 = params.m0;
m1 = params.m1;
m2 = params.m2;
It = params.It;

M = [1  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0 ;...
     0  ,1  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0 ;...
     0  ,0  ,1  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0 ;...
     0  ,0  ,0  ,1  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0 ;...
     0  ,0  ,0  ,0  ,1  ,0  ,0  ,0  ,0  ,0  ,0  ,0 ;...
     0  ,0  ,0  ,0  ,0  ,1  ,0  ,0  ,0  ,0  ,0  ,0 ;...
     0  ,0  ,0  ,0  ,0  ,0  ,m0 ,0  ,0  ,0  ,m1 ,0 ;...
     0  ,0  ,0  ,0  ,0  ,0  ,0  ,m0 ,0  ,m1 ,0  ,0 ;...
     0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,m0 ,0  ,0  ,0 ;...
     0  ,0  ,0  ,0  ,0  ,0  ,0  ,m1 ,0  ,m2 ,0  ,0 ;...
     0  ,0  ,0  ,0  ,0  ,0  ,m1 ,0  ,0  ,0  ,m2 ,0 ;...
     0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,It];

end

