function [ It ] = mass_moment_inertia_in_yaw( params )

%%%Calculate mass moment of inertia in yaw
if(strcmp(params.model,'box'))
    m0 = params.m0;
    depth = params.depth;
    width = params.depth;

    It = 1/12 *m0 * (width^2 + depth^2);
else if(strcmp(params.model,'cylinder'))
    end  
end

