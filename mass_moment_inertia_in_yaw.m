function [ It ] = mass_moment_inertia_in_yaw( params )

%%%Calculate mass moment of inertia in yaw

m0 = params.m0;
height = params.height;
width = params.depth;

It = 1/12 *m0 * (width^2 + depth^2);

end

