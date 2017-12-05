function [ chdz ] = damping_constant_due_to_heave_velocity( params )

omega_zg = params.omega_zg;
xi = params.xi;
mt = params.mt;
rho_w = params.rho_w;
cm = params.cm;
D = params.D;

%%% chdz : hydrodynamic damping force due to heave velocity from drag on
%%% monopile bottom [kg/s] = [N s / m]

%%% Added mass

m_added = rho_w*cm*2*pi/3*D^3;

%%% Drag due to heave mode

chdz =  2*xi*omega_zg*(mt + m_added);

end

