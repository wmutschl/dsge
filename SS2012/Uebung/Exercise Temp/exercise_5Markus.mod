
%----------------------------------------------------------------
% 1. Declare variables and parameters
%----------------------------------------------------------------
	var y c i k A a l f u ul uc fk fl;
	varexo e_t; 
	parameters delta alpha psi tau beta theta rho A_ss;
	
%-------------------------------------------------------------
% 2. Set parameters
%----------------------------------------------------------------
% True parameter-Values

	delta=0.5;
    alpha=0.5;
    psi=0.5;
    tau=0.5;
    beta=0.5;
    theta=0.5;
    rho=0.5;
    A_ss=1;
%----------------------------------------------------------------
% 3. Model equations
%----------------------------------------------------------------
	model;
	y=c+i;
    f=(alpha*k(-1)^psi + (1-alpha)*l^psi)^(1/psi);
	y= A*f;
    k=i+(1-delta)*k(-1);
    u=(c^theta*(1-l)^(1-theta))^(1-tau)/(1-tau);
    ul=-(1-theta)*(c^theta*(1-l)^(1-theta))^(1-tau)/(1-l);
    uc=theta*(c^theta*(1-l)^(1-theta))^(1-tau)/c;
	fk=alpha*(alpha+(1-alpha)*(l/k(-1))^psi)^((1-psi)/psi);
	fl=(1-alpha)*(alpha*(k(-1)/l)^psi+1-alpha)^((1-psi)/psi);
    uc-beta*uc(1)*(A(1)*fk(1)+1-delta)=0;
    -ul/uc-A*fl=0;
    %c+k-A*f-(1-delta)*k(-1)=0;
    A=exp(a);
    a=rho*a(-1)+e_t;
	end;
%----------------------------------------------------------------
% 4. Specify shocks (Std-error is in the model equations)
%----------------------------------------------------------------
	shocks;
	var e_t; stderr 1;
	end;
	
steady_state_model;
    A=A_ss;
    Y_K = (((1/beta)-1+delta)/(alpha*A^psi))^(1/(1-psi));
    C_K = Y_K - delta;
    L_K = (((Y_K)^psi-alpha)/(1-alpha))^(1/psi);
    Y_L = Y_K/L_K;
    C_L = C_K/L_K;
    l = 1/(1 + C_L/((theta*(1-alpha)*A^psi/(1-theta))*(Y_L^(1-psi))));
    c = C_L*l;
    k = l/L_K;
    y = Y_K*k;
	i = y-c;
	f=y/A;
	u=(c^theta*(1-l)^(1-theta))^(1-tau)/(1-tau);
	ul=-(1-theta)*(c^theta*(1-l)^(1-theta))^(1-tau)/(1-l);
    uc=theta*(c^theta*(1-l)^(1-theta))^(1-tau)/c;
    fk=alpha*(alpha+(1-alpha)*(l/k)^psi)^((1-psi)/psi);
    fl=(1-alpha)*(alpha*(k/l)^psi+1-alpha)^((1-psi)/psi);
end;
%----------------------------------------------------------------
% 6. Calculations
%----------------------------------------------------------------
	steady;check;
		
	stoch_simul(periods=10000,irf=0,order=1);
	save('artificial_sample.mat','y','c','l');
