function [ dqdt ] = rhs( t,q,K,D )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

dqdt = -K*q-D*q;

end

