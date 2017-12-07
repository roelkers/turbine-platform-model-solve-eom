function [ q,t ] = solve_eom_w_damping( )

%%% DOF 
%%% Vector q contains the 6 DOF of the system

%%% q(1): (x) fore-aft displacement [m]
%%% q(2): (y) side-side displacement [m]
%%% q(3): (z) negative-heave displacement [m]
%%% q(4): (Theta_x) side-side roll [rad]
%%% q(5): (Theta_y) fore-aft roll [rad]
%%% q(6): (Theta_z) yaw [rad]
%%% q(7): (x) fore-aft displacement velocity [m/s]
%%% q(8): (y) side-side displacement velocity [m/s]
%%% q(9): (z) negative-heave displacement velocity [m/s]
%%% q(10): (Theta_x) side-side roll velocity [rad/s]
%%% q(11): (Theta_y) fore-aft roll velocity [rad/s]
%%% q(12): (Theta_z) yaw velocity [rad/s]

%%% Obtain system parameters and forces

[params,forces] = setup_verification_damping();

%%% Construct mass and stiffness matrix

M = mass_matrix_for_solving(params);
K = stiffness_matrix_for_solving(params,forces);
D = damping_matrix_for_solving(forces);

roll = 5 *pi/180;
pitch = 2 *pi/180;
yaw = 0 *pi/180;

%%% initial condition
q0 = [0 0 1 roll pitch yaw 0 0 0 0 0 0];
%q0 = [0 1 1 0 0 0 0 0 0 0 0 0];

%%% time intervall
t0 = 0;
tf = 40;
tspan = [t0 tf];
%%%configure mass matrix
options=odeset('Mass',M); 

%%% solve with ode23s
[T,Q]=ode23s(@(t,q) rhs(t,q,K,D) ,tspan ,q0 ,options); 

%%%
tfplot = 60;
%%% X
subplot(2,3,1)
plot(T,Q(:,1),'r');
axis([t0 tfplot -0.2 0.15]);
xlabel('Time [s]')
ylabel('surge [m]')
%%% Y
subplot(2,3,2);
plot(T,Q(:,2),'g');
axis([t0 tfplot -0.2 0.15]);
xlabel('Time [s]')
ylabel('sway [m]')
%%% Z
subplot(2,3,3);
plot(T,Q(:,3),'m');
axis([t0 tfplot -1 1]);
xlabel('Time [s]')
ylabel('heave [m]')
%%% Theta_X
subplot(2,3,4);
plot(T,Q(:,4)*180/pi,'k');
axis([t0 tfplot -6 6]);
xlabel('Time [s]')
ylabel('roll [deg]')
%%% Theta_Y
subplot(2,3,5);
plot(T,Q(:,5)*180/pi,'b');
axis([t0 tfplot -2 3]);
xlabel('Time [s]')
ylabel('pitch [deg]')
%%% Theta_Z
subplot(2,3,6);
plot(T,Q(:,6)*180/pi,'c');
axis([t0 tfplot -0.04 0.01]);
xlabel('Time [s]')
ylabel('yaw [deg]')

title('ode solution');
%legend('x','y','z','side-side','fore-aft','yaw');

end
