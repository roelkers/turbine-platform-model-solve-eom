function [params,forces] = setup()

%%% Floating Platform Model
%%% Author: Rufus Oelkers
%%% Chair of Experimental Fluid Dynamics TU Berlin 

%%% Computation of eigenmodes of a
%%% floating platform installed under an offshore wind
%%% turbine

%%% Setup script

%%% For detailed explanation of parameters and model
%%% refer to paper of TU Denmark

%%% DOF 
%%% Vector q contains the 6 DOF of the system
%%% q(1): (x) fore-aft displacement
%%% q(2): (y) side-side displacement
%%% q(3): (z) negative-heave displacement
%%% q(4): (Theta_x) side-side roll
%%% q(5): (Theta_y) fore-aft roll
%%% q(6): (Theta_z) yaw

%%% System parameters 

%%% collected in parameter structure
%%% mn : total mass of rotor/nacelle [kg]
%%% m0 : total mass (0th order mass moment) [kg]
%%% m1 : 1st order mass moment [kg m]
%%% m2 : 2nd order mass moment (mass moment of inertia in roll) [kg m2]
%%% It : mass moment of inertia in torsion [kg m2]
%%% leb : distance from point A to B [m]
%%% lbg : distance from point B to G [m]
%%% lgw : distance from point G to W [m]
%%% lwi : distance from point W to I [m]
%%% lin : distance from point I to N [m]
%%% dw : water depth  [m]

params.mn = 2.385e005;
params.m0 = 2.4764e006;
params.m1 = 5.9605e-008;
params.m2 = 1.2622e010;
params.It = 2.7879e006;
%params.leb = 72.6;
params.lbg = -0.9;
%params.lgw = 52.7;
%params.lwi = 10.6;
%params.lin = 68;
%params.dw = 300;

%%% assumption due to missing information about model
%%% distance between cable suspension C and gravitational center G 
params.lcg = -0.3;

%%% Forces

%%% kcx : cable horizontal stiffness, x-direction [N/m]
%%% kcy : cable horizontal stiffness, y-direction [N/m]
%%% kcz : cable vertical stiffness, z-direction [N/m]
%%% kbz : vertical stiffness due to buoyancy [N/m]
%%% khsx : water level hydrostatic stiffness due to fore-aft-roll [N/rad]
%%% khsy : water level hydrostatic stiffness due to side-side-roll [N/rad]
%%% ktc : cable stiffness due to torsion [N/rad]

forces.kcx = 1.2606e005;
forces.kcy = 1.2606e005;
forces.kcz = 1.2606e005;
forces.kbz = 5.0276e004;
forces.khsx = 6.9454e006;
forces.khsy = 6.9454e006;
forces.ktc = 6.6853e005;

end
