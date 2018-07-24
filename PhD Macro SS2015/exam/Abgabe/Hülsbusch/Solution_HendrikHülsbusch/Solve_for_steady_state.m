beta = 0.99;  eta = 0.8; delta=0.02; 

% Paras from table
IB = 0.02; GB = 0.2; Y=1; omega = 2; N = 1/3; TR = 0;

% problem function to calculate steady state
target_f = @(lambda,tau,omega,theta,C,N,I,r,K,TR,alpha,KB,delta,IB,Y,z,eta,GB,rho_z,rho_GB,rho_IB,rho_tau,eps_z,eps_GB,eps_I,eps_tau) ...
          ( ( (1-tau)*omega - (theta*C/(1-N)) )^2 + ... EQ: (1)            
            ( lambda - 1/C)^2 + ... EQ: (3)
            ( C + I - ((1-tau)*(omega*N+r*K)+TR) )^2 + ... EQ: (0) (above EQ (1))
            ( K - ((1-delta)*K+I) )^2 + ... EQ: (4)
            ( KB -((1-delta)*KB+IB) )^2 + ... EQ: (5)
            ( Y - (z*KB^eta*K^alpha*N^(1-alpha)) )^2 + ... EQ: (6)
            ( omega*N - (1-alpha)*Y )^2 + ... EQ: (7)
            ( r*K - alpha*Y)^2 + ...           EQ: (8)
            ( GB + IB + TR - (tau*(omega*N+r*K)) )^2 + ... EQ: (10)          
            ( Y - (C+I+GB+IB) )^2 ); % EQ: (14)
TR = 0 ;
% incorporate known parameters
target_small_f = @          (lambda,tau,  theta,C,    I,r,K,  alpha,KB,            z        )...
                    target_f(lambda,tau,2,theta,C,1/3,I,r,K,TR,alpha,KB,0.02,0.02,1,z,0.8,0.2,0.75,0.75,0.75,0.75,0.01,0.01,0.01,0.01);

% rewrite function to handle vectors                
target_small_x_f = @(x) target_small_f(x(1),x(2),x(3),x(4),x(5),x(6),x(7),x(8),x(9),x(10));

% use global search to find minimum for possible ill posed problem
x0=[0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1];
    opts = optimoptions('fmincon','Algorithm','sqp');
    problem=createOptimProblem('fmincon','objective', ...
        @(x) target_small_x_f(x),'x0',x0,'lb',[0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0   ]-2,'ub',[10 ,10,10 ,10 ,10 ,10 ,10 ,10 ,10 ,10  ]*1);
    [x,~,~,~,solsgs] = run(GlobalSearch,problem);
    solsgs.Fval

% Result from global search
x = [1.3095    0.2200    1.3619    0.7636    0.0164    0.4073    0.8184  0.3333    1.0000    2.2238    ];
% Result from global search with TR = 0.01
% x = [ 1.3000    0.2300    1.3347    0.7692    0.0108    0.6192    0.5383    0.3333    1.0000    2.5570    ];
    
% check steady state and parameters 

lambda = x(1)
tau = x(2)
theta = x(3)
C = x(4)
I = x(5)
r = x(6)
K = x(7)
alpha = x(8)
KB = x(9)
z = x(10)




        
                
        
        






















