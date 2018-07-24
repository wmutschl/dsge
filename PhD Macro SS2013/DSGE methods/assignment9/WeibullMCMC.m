clear all
%parameter in the jump distribution:
k=4;
%M here is nsim...
nsim=100000;
%parameters of the Weibull distribution
a=10;
b=20;

xx=7:.001:11.5;
Y = wblpdf(xx,a,b);
[maxY,i]=max(Y);
mode=xx(i);

%Get the second derivative about the mode of the Weibull distribution, 
%for the purpose of obtaining the jump distribution for the MCMC algorithm.
%The second derivative can be approximated numerically as the first derivative
%of the first derivative. A numerical approximation of the function f around
%the point, x, is (f(x+eps)-f(x-eps))/(2*eps), so the approximation of
%the second derivative is (eps1=eps):
%fpp=(f(x+eps+eps1)-f(x-eps+eps1)-(f(x+eps-eps1)-f(x-eps-eps1)))/(2*eps*2*eps1);

eps=.000001;
x=mode;
f1=wblpdf(x+2*eps,a,b);
f2=wblpdf(x-2*eps,a,b);
fpp=(f1-2*maxY+f2)/(2*eps*2*eps);
sV=sqrt(-1/fpp);

%get the variance required for the Laplace approximation:
lf1=log(wblpdf(x+2*eps,a,b));
lf2=log(wblpdf(x-2*eps,a,b));
lfpp=(lf1-2*log(maxY)+lf2)/(2*eps*2*eps);
sVN=sqrt(-1/lfpp);

randn('seed',0);
thet(1)=mode;
ix=0;

for ii = 2:nsim
    rr=randn*sV;
    u=rand;
    x=thet(ii-1)+k*rr;
    x0=thet(ii-1);
    if x <= 0
        thet(ii)=thet(ii-1);%the Weibull random variable is non-negative, so a negative candidate has density zero.
    else
        fn=wblpdf(x,a,b);
        fd=wblpdf(x0,a,b);
        lam=fn/fd;
        if u < lam
            thet(ii)=x;
            ix=ix+1;
        else
            thet(ii)=thet(ii-1);
        end
    end
end

ia=min([1000,round(.01*nsim)]);
[N,X]=hist(thet([ia:nsim]),150);
b1=max(diff(X));
b2=min(diff(X));
if abs(b1-b2) > .1e-10
    error('(gammaMCMC) something went wrong')
end
bb=b1;

%Next, scale N so that the Riemann integral over the histogram is unity.
%Here is the logic....
%The Riemann integral is the sum of the area of rectangles under the
%integral. In the case of a histogram, it is the sum of the width of
%the rectangles times their heigth. The hist command provides a height, N(i),
%associated with each of a set of 150 bins of width b, and these have to be
%scaled by a constant independent of i, to ensure that the Riemann integral
%is unity. The scaled height is n(i). The selected constant is a.
%(It can be verified numerically that a similar adjustment before graphing
%a pdf function is redundant, i.e., a is approximately unity.)

aa=bb*sum(N);
n=N/aa;
I=find(X<max(xx)&X>min(xx));
s2=max(I);
s1=min(I);

aa=['MCMC, k = ',num2str(k),', % acceptance = ',num2str(100*ix/nsim)];
II=[s1:s2];
plot(xx,Y,X(II),normpdf(X(II),mode,sVN),'x-',X(II),n(II))
legend('Weibull','Laplace approximation',aa)
ff=['Weibull distribution, mode = ',num2str(mode),', a = ',num2str(a),', b = ',num2str(b),', number of MCMC simulations = ',num2str(nsim-ia)];
title(ff,'FontSize',24)
axis tight
