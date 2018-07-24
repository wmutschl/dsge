clear all
syms pie piep xback xbackp x xp rback r r_nat r_natp tau tauback dy dyp da daback
syms u_a u_tau u_ap u_taup
syms beta phi_x phi_pie alpha rho_a rho_tau phi theta sig_a sig_tau kappa

% Model equations
m1 = - pie+ beta*piep + kappa*x;
m2 = -x + xp - (r - piep - r_nat);
m3 = - r + alpha*rback + (1-alpha)*(phi_pie*pie + phi_x*x);
m4 = -da + rho_a*daback + sig_a*u_a;
m5 = -tau + rho_tau*tauback + sig_tau*u_tau;
m6 = -r_nat + rho_a*da + (1-rho_tau)/(1+phi)*tau;
m7 = - dy + x - xback + da - (tau - tauback)/(1+phi);
m8 = x - xbackp;
m9 = u_ap;
m10 = u_taup;
f=[m1;m2;m3;m4;m5;m6;m7;m8;m9;m10];
var_x = [daback tauback rback xback u_a u_tau];
var_xp = [da tau r xbackp u_ap u_taup];
var_y = [pie x r_nat dy];
var_yp = [piep xp r_natp dyp];

f1 = jacobian(f,var_xp); 
f2 = jacobian(f,var_yp);
f3 = jacobian(f,var_x); 
f4 = jacobian(f,var_y);

% Evaluate
beta    = 0.97;
phi_x   = 0;
phi_pie = 1.5;
alpha   = 0;
rho_a     = 0.2;
rho_tau  = 0.5;
phi     = 1;
theta   = 0.75;
sig_a   = 0.02;
sig_tau = 0.02;
kappa   = ((1-theta)*(1-beta*theta)*(1+phi))/(theta);
daback=0; tauback=0; rback=0; xback=0; da=0; tau=0;
r=0; xbackp=0; pie=0; x=0; r_nat=0; dy=0; piep=0;
xp=0; r_natp=0; dyp=0; u_a=0; u_tau=0; u_ap=0; u_taup=0;

f1=eval(f1);
f2=eval(f2);
f3=eval(f3);
f4=eval(f4);

%% Klein (2000)'s algorithm
A=-[f1 f2]; B = [f3 f4];
nx = length(var_x);
% upper triangular factorization of the matrix pencil b-az
[S,T,Q,Z] = qz(A,B);                
[S,T,Q,Z] = ordqz(S,T,Q,Z,'udo');   % reordering of generalized eigenvalues descending order of s_ii/t_ii

% Check Blanchard-Khan
if abs(S(nx,nx)/T(nx,nx))<1 | abs(S(nx+1,nx+1)/T(nx+1,nx+1))>1;
   warning('Wrong number of stable eigenvalues.');
end

z11 = Z(1:nx,1:nx);
if rank(z11)<nx;
	error('Invertibility condition violated')
end

% Auxiliary matrices
z11i = z11\eye(nx);
z21 = Z(nx+1:end,1:nx);
s11 = S(1:nx,1:nx);
s11i = s11\eye(nx);
t11 = T(1:nx,1:nx);

% Solution matrices up to first order
gx = real(z21*z11i);
hx = real(z11*s11i*t11*z11i);