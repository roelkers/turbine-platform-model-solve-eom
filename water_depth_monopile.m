function [ lew ] = water_depth_monopile( params )

%%% Calculates the draft or draught of the monopile:
%%% It is the length between the bottom of it and the water surface

%%% It depends on the total mass of the monopile and the displaced water
%%% volume. These are proportional to the water density

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
%%%     /   |-|   \ E(Mono Pile bottom, ballast)

if(strcmp(params.model,'box'))
    
    m0 = params.m0;
    rho_w = params.rho_w;
    depth = params.depth;
    width = params.width;

    lew = m0/(depth*width*rho_w);
else if(strcmp(params.model,'cylinder'))
    end       
end

