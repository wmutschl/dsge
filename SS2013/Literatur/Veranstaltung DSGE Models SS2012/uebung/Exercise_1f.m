% Set parameter values
beta = 0.99; 
alpha=0.36; 
sigma = 2; 
delta = 0.025; 
rho=0.9;
k = (alpha*beta/delta)^(1/(1-alpha)); 
c= k^alpha -delta*k;

% Matrix A
A = [1 -beta*alpha*(alpha-1)*k^(alpha-1)/sigma -beta*alpha*k^(alpha-1)/sigma; 	
    0 1 0;	
    0 0 1];

% Matrix B	
B = [1 0 0; 
      -c/k 1/beta k^(alpha-1); 
      0 0 rho];

% Matrix E
E = [0;
     0;
     0];

% Matrix C
C = [0;
       0;
       1];

%Matrix D
D = [1 beta*alpha*(alpha-1)*k^(alpha-1)/sigma beta*alpha*k^(alpha-1)/sigma; 	
       0 0 0;
       0 0 0];

% QZ-Factorization: A=Q'*AA*Z' and B=Q'*BB*Z'.
[AA,BB,Q,Z] = qz(A,B)
% In our notation AA=LAMDA and BB=OMEGA are upper triangular;
AA
BB
% Q and Z are unitary: Q'*Q=Q*Q'=Z'*Z=Z*Z'=I
Q'*Q
Q*Q'
Z'*Z
Z*Z'
% Have a look at the diagnoal Elements of AA and BB
AA
dAA = diag(AA)
BB
dBB = diag(BB)

% The quotient are the generalized Eigenvalues
dAA(1)/dBB(1)
dAA(2)/dBB(2)
dAA(3)/dBB(3)
eig(A,B)

% What Sims (2001) does, is to order the eigenvalues such that for the lower
% equations dAA/dBB <1

% Solution with Sims-Algorithm: gensys function
[F,EE,G,fmat,fwt,ywt,gev,eu,loose] = gensys(A,B,E,C,D);









