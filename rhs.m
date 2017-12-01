function [ dqdt ] = rhs( t,q,K )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

dqdt = -K*q;

end

