% Application of the Klein (2000) Algorithm to the Stochastic Growth Model
%
% Author:       Fabian Goessling
% Email:        Fabian.Goessling@wiwi.uni-muenster.de
% This Version: 12.01.2016
%
% The .m file exactly reproduces the Dynare Output for the corresponding
% model, that is the transition functions are functions of a(t-1) and
% epsilon(t). Parts of the code are taken from the "solab.m" function
% written by Paul Klein.

clear all
clc 

syms c cp a ap aback k kp kback kbackp abackp
syms u_e u_ep
syms beta alpha delta rho sigma rhou chi

% Choose the solution: 1 = Dynare equivalent , 2 = Normal Solution
V = 2;
   
if V == 1
    m1 = -c^(-sigma) + beta*cp^(-sigma)*(alpha*exp(ap)*kp^(alpha-1)+1-delta);
    m2 = -kp + exp(a)*k^alpha - c + (1-delta)*k;
    m3 = -a + rho*aback + u_e;
    m4 = abackp - a;
    m5 = u_ep;

    f=[m1;m2;m3;m4;m5;];

    % Variables given at time t (predetermined)
    var_x   = [k aback];
    % Variables exogenous (shocks)
    var_z   = [u_e];
    % Stack predetermined and exogenous variables in a vector w = [x z];
    var_w   = [ k   aback u_e];
    var_wp  = [ kp abackp u_ep ]; 
    % Variables not predetermined (jump)
    var_y   = [ c a];
    var_yp  = [ cp ap];
    
elseif V == 2
    m1 = -c^(-sigma) + beta*cp^(-sigma)*(alpha*exp(ap)*kp^(alpha-1)+1-delta);
    m2 = -kp + exp(a)*k^alpha - c + (1-delta)*k;
    m3 = -ap + rho*a;
    
    f=[m1;m2;m3];


    % Variables given at time t (predetermined)
    var_x   = [k];
    % Variables exogenous (shocks)
    var_z   = [a];
    % Stack predetermined and exogenous variables in a vector w = [x z];
    var_w   = [ k  a];
    var_wp  = [ kp ap]; 
    % Variables not predetermined (jump)
    var_y   = [ c ];
    var_yp  = [ cp];
end
    

    
%%
n_z = length(var_z);
n_x = length(var_x);
n_y = length(var_y);
n_w = length(var_w);

f1 = jacobian(f,var_wp); 
f2 = jacobian(f,var_yp);
f3 = jacobian(f,var_w); 
f4 = jacobian(f,var_y);


A=[f1 f2]; B = -[f3 f4];

% Evaluate
beta    = 0.95;
sigma   = 1;
delta   = 0.01;
alpha   = 0.33;
rho     = 0.95; 
chi     = 0;

kp = ((1/beta - (1-delta))/alpha)^(1/(alpha-1)); k  = kp;
cp = k^alpha + (1-delta)*k - k; c = cp;
ap = 0; a = ap; abackp = a; aback= a;

A = eval(A);
B = eval(B);


% A*E_t(X_t+1) = B*X + E*f
% X = [x_t y_t+1]
% Easier: A * E_t([w_t+1 y_t+1]) + B*[w_t y_t] with w_t =  [x_t z_t]

% Upper triangular factorization of the matrix pencil B-lambda A
[S,T,Q,Z] = qz(A,B); 

% Check decomposition: A - Q'*S*Z' or S - Q*A*Z. Note that Matlabs qz()
% function returns Z directly not Z^H (compare with slides)
t_ii = diag(T);
s_ii = diag(S);
ratio_1 = abs(t_ii ./ s_ii)';
pos_init = ratio_1 > 1;

logic_vector = [];
for p = 1:length(ratio_1);
    logic_vector = [logic_vector sum(ratio_1(p) < ratio_1)];
end

[S_re,T_re,Q_re,Z_re] = ordqz(S,T,Q,Z,logic_vector);   % reordering of generalized eigenvalues descending order of s_ii/t_ii / ascending order of t_ii/s_ii

%S - Q*A*Z
t_ii_re = diag(T_re);
s_ii_re = diag(S_re);
ratio_2 = abs(t_ii_re ./ s_ii_re)';
pos_rear = ratio_2 > 1;

% New System:
% QSZ^h * E_t([w_t+1,y_t+1]) = QTZ^h*[w_t,y_t]
% SZ^h * E_t([w_t+1,y_t+1]) = TZ^h*[w_t,y_t]

% Check Blanchard-Khan
Number_unstable = sum(pos_rear);
%Z = Z';

if abs(S_re(n_w,n_w)/T_re(n_w,n_w))<1 | abs(S_re(n_w+1,n_w+1)/T_re(n_w+1,n_w+1))>1;
   warning('Wrong number of stable eigenvalues.');
end

z11 = Z_re(1:n_w,1:n_w);
if rank(z11)< n_w;
	error('Invertibility condition violated')
end

% Auxiliary matrices
z11i    = z11\eye(n_w);
z21     = Z_re(n_w+1:end,1:n_w);
s11     = S_re(1:n_w,1:n_w);
s11i    = s11\eye(n_w);
t11     = T_re(1:n_w,1:n_w);

% Solution matrices up to first order
L_y_w = real(z21*z11i);
L_w_w = real(z11*s11i*t11*z11i);

L_x_x = L_w_w(1:n_x,1:n_x);
L_x_z = L_w_w(1:n_x,n_x+1:end);

L_y_x = L_y_w(1:n_y,1:n_x);
L_y_z = L_y_w(1:n_y,n_x+1:end);

L_z_x = L_w_w(1+n_x:end,1:n_x);
L_z_z = L_w_w(1+n_x:end,n_x+1:end);
 

%% Simulation
periods         = 100;
sim_mat         = zeros(length([var_w var_y]),periods);

if V == 2
    sim_mat(:,1)    = [0,0.1,0]';
elseif V == 1
    sim_mat(:,1)    = [0,0.1,0,0,0]';
end

for i = 1:periods
    % Deviations from Steady State
    x_t(:,i)                             = sim_mat(1:length(var_x),i);
    z_t(:,i)                             = sim_mat(1+length(var_x):length(var_w),i);
    
    % States x_t+1
    sim_mat(1:length(var_x),i+1)    = L_x_x*x_t(:,i) + L_x_z*z_t(:,i);
    % Control y_t
    sim_mat(1+length(var_w):end,i)  =  L_y_x*x_t(:,i) + L_y_z*z_t(:,i);
                                    
    % Exogenous z_t
    sim_mat(length(var_x)+1:length(var_x)+length(var_z),i+1) = L_z_x*x_t(:,i)...
                                        + L_z_z*z_t(:,i);%+ 0.1*randn(1);
end

% Plot an IRF depending on the choice of starting values
plot(sim_mat');

