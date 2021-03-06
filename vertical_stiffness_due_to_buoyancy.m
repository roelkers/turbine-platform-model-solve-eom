function [ kbz ] = vertical_stiffness_due_to_buoyancy( params )

%%% An increasse in the water surface level will also change the location
%%% of buoyancy and hence the buoyancy force.

if(strcmp(params.model,'box'))
    rho_w = params.rho_w;
    g = params.g;
    width = params.width;
    depth = params.depth;
    
    %%% specific weight of sea water
    gammaw = rho_w * g;

    kbz = gammaw * depth * width;
else if(strcmp(params.model,'cylinder'))
    end  
end

