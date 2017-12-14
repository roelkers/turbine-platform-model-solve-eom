function [ khsx ] = hydrostatic_stiffness_due_to_side_side_roll( params )

%%% moment equilibrium in point G 

%%% ||
%%% ||
%%% ||======|-|   N (Nacelle)
%%% ||      | |    
%%% ||      | |
%%%         | |
%%%         | |
%%%         | |
%%%         |-|   I (Interface)
%%%         | |
%%%         |-|   M (Meta-centre point)
%%%         | |
%%% ~~~~~~~~| |~~ W (Water level) ~~~~~
%%%         |-|   G (Grav. centre)
%%%        /| |\  C (Mooring Cable suspension)
%%%       / |-| \ B (Buoyancy centre)
%%%      /  | |  \
%%%     /   |-|   \ E(Mono Pile bottom)

if(strcmp(params.model,'box'))
g  = params.g;
lbg = params.lbg;
m0 = params.m0;
rho_w = params.rho_w;
width = params.width;
height = params.height;

vw = m0/rho_w;

%%% Inertia moment at waterline around y axis
Iwx = width*height^3/12; %pi/64*D^4; %

%%% specific weight of sea water gamma
gamma_w = rho_w * g;

khsx = gamma_w * (Iwx - lbg * vw);
else if(strcmp(params.model,'cylinder'))
    end  
end

