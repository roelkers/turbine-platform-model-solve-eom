function [ dqdt ] = rhs( t,q,K,D,params )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%F = force_vector(params,q);
F = 0;

dqdt = -K*q-D*q+F;

end

