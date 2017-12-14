function [ khsy ] = hydrostatic_stiffness_due_to_fore_aft_roll( params )

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
    depth = params.depth;
    height = params.height;
    vw = m0/rho_w;

    %%% Inertia moment at waterline around y axis
    Iwy = depth*height^3/12; %pi/64*D^4; 

    %%% specific weight of sea water gamma
    gamma_w = rho_w * g;

    khsy = gamma_w * (Iwy - lbg * vw);
else if(strcmp(params.model,'cylinder'))
    end 
end

