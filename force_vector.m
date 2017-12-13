function [ F ] = force_vector( params, q)

%%% Force Vector

%%% For starters only forces from incident waves are considered

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

nz = params.nz;

rho_w = params.rho_w;
cdw = params.cdw;
width = params.width;
depth = params.depth;
caw = params.caw;
leg = params.leg;
lew = params.lew;

vwx = params.vwx;
vwxdot= params.vwxdot;
vwy = params.vwy;
vwydot = params.vwydot;

%z = linspace(-leg,-lew,nz);

    function pwx = pwx(z)
        udotxg = q(7) + z * q(11); 
        pwx = 1/2 * rho_w.*cdw*depth  .* abs(vwx-udotxg) .*(vwx-udotxg);%+ ...
      %pi/4* rho_w*depth*width*(vwxdot+caw*(vwxdot-udotdotxg)) 
    end

    function pwy = pwy(z)
        udotyg = q(8) + z * q(10);
        pwy = 1/2 .* rho_w*cdw*width  .* abs(vwy-udotyg) .*(vwy-udotyg);
      %pi/4* rho_w*depth*width*(vwydot+caw*(vwydot-udotdotyg)) 
    end

%udotxg = ones(nz,1)*q(7) + z*q(11); % udot_xg = qdot_xg + zg*thetadot_yg;
%udotyg = ones(nz,1)*q(8) - z*q(10); % udot_yg = qdot_yg - zg*thetadot_xg;

%%% Wave formula

%pwx = 1/2 * rho_w*cdw*depth  * abs(vwx-udotxg) *(vwx-udotxg); %+ ...
      %pi/4* rho_w*depth*width*(vwxdot+caw*(vwxdot-udotdotxg)) 
%pwy = 1/2 * rho_w*cdw*width  * abs(vwy-udotyg) *(vwy-udotyg); %+ ...
      %pi/4* rho_w*depth*width*(vwydot+caw*(vwydot-udotdotyg))   

%%% Force result integration

F = zeros(12,1);

F(7) = quad(@(z) pwx(z),-leg,-lew);
F(8) = quad(@(z) pwy(z),-leg,-lew);

F(10) = quad(@(z) z.*pwx(z),-leg,-lew);
F(11) = quad(@(z) z.*pwy(z),-leg,-lew);


end

