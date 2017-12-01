function [ q,t ] = solve_eom( )

%%% DOF 
%%% Vector q contains the 6 DOF of the system
%%% q(1): (x) fore-aft displacement
%%% q(2): (y) side-side displacement
%%% q(3): (z) negative-heave displacement
%%% q(4): (Theta_x) side-side roll
%%% q(5): (Theta_y) fore-aft roll
%%% q(6): (Theta_z) yaw

%%% Obtain system parameters and forces

[params,forces] = setup_verification_case_1();

%%% Construct mass and stiffness matrix

M = mass_matrix_for_solving(params);
K = stiffness_matrix_for_solving(params,forces);

%%% initial condition
q0 = [1 1 1 1 1 1 0.1 0.1 0.1 0.1 0.1 0.1];

%%% time intervall
t0 = 0;
tf = 1000;
tspan = [t0 tf];
%%%configure mass matrix
options=odeset('Mass',M); 

%%% solve with ode23s
[T,Q]=ode23s(@(t,q) rhs(t,q,K) ,tspan ,q0 ,options);  

hold on
plot(T,Q(:,1),'r');
plot(T,Q(:,2),'g');
plot(T,Q(:,3),'m');
plot(T,Q(:,4),'k');
plot(T,Q(:,5),'b');
plot(T,Q(:,6),'c');

legend('x','y','z','side-side','fore-aft','yaw');

axis([t0 tf -100 100]);
Q
end

