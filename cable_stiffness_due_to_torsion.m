function [ ktc ] = cable_stiffness_due_to_torsion( params )

%%% The cable pre-tensioning force must be known in order to 
%%% determine the cable torsion stiffness.

width = params.width;
fc = params.fc;

%%% It is assumed that there are three mooring cables

cn = 3;

%%% The lines are attached to the left and right of the square
%%% so the lever length is width/2

ktc = cn * fc * width/2;


end

