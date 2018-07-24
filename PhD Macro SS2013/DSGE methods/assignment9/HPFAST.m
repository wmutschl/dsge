% ---------------------------------------------------------------------%
%  SUBROUTINE HPFILT:                                                  %
%  Kalman smoothing routine for HP filter written by E Prescott.       %
%   y=data series, d=deviations from trend, t=trend, n=no. obs,        %
%   s=smoothing parameter (eg, 1600 for std HP).                       %
%   Array v is scratch area and must have dimension at least 3n.       %
%   If IOPT=1 and n and s are the same as for the previous call,       %
%   the numbers in v are not recomputed.  This reduces execution       %
%   time by about 30 percent.  Note that if this option is exercised,  %
%   v cannot be used for other purposes between calls.                 %
% ---------------------------------------------------------------------%
%    subroutine hpfilt(y,t,d,v,n,s,iopt)                               %
%      dimension y(n),t(n),v(n,3),d(n)                                 %
%     dou                                                              %
%     data ss,nn/0.0,0/                                                %
%     compute sequences of covariance matrix for f(x(t),x(t-1) | y(<t))%
%                                                                      %
function [d,t]=hpfast(y,s)

iopt = 0;
[n1,n2]=size(y);
if n2 > n1
    y=y';
end
n = length(y);
d1=zeros(n,1);
t=zeros(n,1);
%s = 1600;
v = zeros(3*n,6);
      if iopt ~= 1,
        ss=s;
        nn=n;
        v11=1;
        v22=1;
        v12=0;
i=3;
        while i <= n,
        x=v11;
        z=v12;
        v11=1/s + 4*(x-z) + v22;
        v12=2*x - z;
        v22=x;
        det1=v11*v22-v12*v12;
        v(i,1)=v22/det1;
        v(i,3)=v11/det1;
        v(i,2)=-v12/det1;
        x=v11+1;
        z=v11;
        v11=v11-v11*v11/x;
        v22=v22-v12*v12/x;
        v12=v12-z*v12/x;
i=i+1;
end;
end;
m1=zeros(1,1);
m2=zeros(1,1);
%c                                                %
%c     this is the forward pass                   %
%c                                                %
m1=y(2,1);
m2=y(1,1);
 i=3;
   while i <= n,
        x=m1;
        m1=2*m1-m2;
        m2=x;
        t(i-1,1)= v(i,1)*m1 + v(i,2)*m2;
        d1(i-1,1)=v(i,2)*m1+v(i,3)*m2;
        det1=v(i,1)*v(i,3)-v(i,2)*v(i,2);
        v11=v(i,3)/det1;
        v12=-v(i,2)/det1;
        z=(y(i,1)-m1)/(v11+1);
i=i+1;
        m1=m1+v11*z;
        m2=m2+v12*z;
end
t(n,1)=m1;
t(n-1,1)=m2;
%c                                           %
%c       this is the backward pass           %
%                                            %
         m1=y(n-1,1);
         m2=y(n,1);
i=n-2;
   while i >= 1 ;
           i1=i+1;
           ib=n-i+1;
         x=m1;
         m1=2*m1 - m2;
         m2=x;
%c                                                              %
%c           combine info for y(.lt.i) with info for y(.ge.i)   %
%c                                                              %
if i > 2;
           e1=v(ib,3)*m2+v(ib,2)*m1+t(i,1);
           e2=v(ib,2)*m2+v(ib,1)*m1+d1(i,1);
           b11=v(ib,3)+v(i1,1);
           b12=v(ib,2)+v(i1,2);
           b22=v(ib,1)+v(i1,3);
           det1=b11*b22-b12*b12;
           t(i,1)=(-b12*e1+b11*e2)/det1;
end
%                                                        %
%           end of combining                             %
%                                                        %
        det1=v(ib,1)*v(ib,3)-v(ib,2)*v(ib,2);
        v11=v(ib,3)/det1;
        v12=-v(ib,2)/det1;
        z=(y(i,1)-m1)/(v11+1);
         m1=m1+v11*z;
         m2=m2+v12*z;
i=i-1;
end
       t(1,1)=m1;
       t(2,1)=m2;
       d=y-t;
return;

