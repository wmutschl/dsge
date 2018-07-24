function [G1,C,impact,q,a,b,z,eu]=gensysct(g0,g1,c,psi,pi,div)
%function [G1,C,impact,q,a,b,z,eu]=gensysct(g0,g1,c,psi,pi,div)
%System given as
%        g0*Dy(t)=g1*y(t)+c+psi*epsilon(t)+pi*eta(t),
%with epsilon an exogenous variable process and eta being endogenously determined
%white noise expectational errors.  Returned system is
%       Dy(t)=G1*y(t)+C+impact*epsilon(t).
% epsilon(t) is assumed to be white noise.  
% If div is omitted from argument list, a div>0 is calculated.
% Also returned is the qz decomposition, q'az'=g0, q'bz'=g1, with a and b
% upper triangular and the system ordered so that all zeros on the diagonal of b are in
% the lower right corner, all cases where the real part of bii/aii is greater than or 
% equal to div appear in the next block above the zeros, and the remaining bii/aii's 
% all have bii/aii<div .  These elements can be used to construct the full backward and 
% forward solution.  See the paper "Solving Linear Rational Expectations Models", 
% http://eco-072399b.princeton.edu/yftp/gensys .  Note that if one simply wants the backward
% and forward projection of y on epsilon, ignoring existence and uniqueness questions, the
% projection can be computed by Fourier methods.
% eu(1)=(existence); eu(2)=(uniqueness). Else eu=[-2,2]  => indeterminacy via singularity
% in the equation system.  Else eu(1)=-1 => existence only for white noise epsilon.
% realsmall=sqrt(eps)*10;
realsmall=sqrt(eps)*10;
%realsmall=1e-3;
eu=[0;0];
fixdiv=(nargin==6)
n=size(g0,1);
[a b q z v]=qz(g0,g1);
if ~fixdiv, div=.001; end
nunstab=0;
nzero=0;
zxz=0;
for i=1:n
   %------------------div calc------------
   if ~fixdiv
      if abs(a(i,i)) > realsmall
         divhat=real(b(i,i)/a(i,i));
         if realsmall<divhat & divhat<div
            div=.5*divhat;
         end
      end
   end
   %----------------------------------------
   if abs(a(i,i))<realsmall
      nzero=nzero+1;
      nunstab=nunstab+1;
      if abs(b(i,i))<realsmall
         zxz=1;
      end
   else
      nunstab=nunstab+ (real(b(i,i)/a(i,i))>div);
   end
end
div
nunstab
nzero
% Note that qzdivct first puts all singularities in a in lower right, then puts unstable
% roots on top of those.
[a b q z]=qzdivct(div,a,b,q,z);
gev=[diag(a) diag(b)];
if zxz
   %disp('Coincident zeros.  Indeterminacy and/or nonexistence.')
   eu=[-2;-2];
   return
end
q1=q(1:n-nunstab,:);
q2=q(n-nunstab+1:n,:);
z1=z(:,1:n-nunstab)';
z2=z(:,n-nunstab+1:n)';
a2=a(n-nunstab+1:n,n-nunstab+1:n);
b2=b(n-nunstab+1:n,n-nunstab+1:n);
etawt=q2*pi;
zwt=q2*psi;
[ueta,deta,veta]=svd(etawt);
md=min(size(deta));
bigev=find(diag(deta(1:md,1:md))>realsmall);
ueta=ueta(:,bigev);
veta=veta(:,bigev);
deta=deta(bigev,bigev);
[uz,dz,vz]=svd(zwt);
md=min(size(dz));
bigev=find(diag(dz(1:md,1:md))>realsmall);
uz=uz(:,bigev);
vz=vz(:,bigev);
dz=dz(bigev,bigev);
if isempty(bigev)
    exist=1;
else
    exist=norm(uz-ueta*ueta'*uz,'fro') < realsmall*n;
end
if ~isempty(bigev)
    zwtx0=b2\zwt;
    zwtx=zwtx0;
    M=b2\a2;
    M=M/norm(M);
    for i=2:nunstab
        zwtx=[M*zwtx zwtx0];
    end
    zwtx=b2*zwtx;
    [ux,dx,vx]=svd(zwtx);
    md=min(size(dx));
    bigev=find(diag(dx(1:md,1:md))>realsmall);
    ux=ux(:,bigev);
    vx=vx(:,bigev);
    dx=dx(bigev,bigev);
    existx=norm(ux-ueta*ueta'*ux,'fro') < realsmall*n;
else
    existx=1;
end
%----------------------------------------------------
% Note that existence and uniqueness are not just matters of comparing
% numbers of roots and numbers of endogenous errors.  These counts are
% reported below because usually they point to the source of the problem.
%------------------------------------------------------
[ueta1,deta1,veta1]=svd(q1*pi);
md=min(size(deta1));
bigev=find(diag(deta1(1:md,1:md))>realsmall);
ueta1=ueta1(:,bigev);
veta1=veta1(:,bigev);
deta1=deta1(bigev,bigev);
if existx | nunstab==0
   %disp('solution exists');
   eu(1)=1;
else
    if exist
        %disp('solution exists for unforecastable z only');
        eu(1)=-1;
    %else
        %fprintf(1,'No solution.  %d unstable roots. %d endog errors.\n',nunstab,size(ueta1,2));
    end
    %disp('Generalized eigenvalues')
   %disp(gev);
   %md=abs(diag(a))>realsmall;
   %ev=diag(md.*diag(a)+(1-md).*diag(b))\ev;
   %disp(ev)
%   return;
end
%disp('Generalized eigenvalues')
%disp(gev);
%md=abs(diag(a))>realsmall;
%ev=diag(md.*diag(a)+(1-md).*diag(b))\ev;
%disp(ev)
%   return;
if isempty(veta1)
    unique=1;
else
    unique=norm(veta1-veta*veta'*veta1,'fro')<realsmall*n;
end
if unique
   %disp('solution unique');
   eu(2)=1;
%else
   %fprintf(1,'Indeterminacy.  %d loose endog errors.\n',size(veta1,2)-size(veta,2));
   %disp('Generalized eigenvalues')
   %disp(gev);
   %disp(ev)
%   return;
end
tmat = [eye(n-nunstab) -ueta1*deta1*veta1'*veta*(deta\ueta')];
G0= [tmat*a; zeros(nunstab,n-nunstab) eye(nunstab)];
G1= [tmat*b; zeros(nunstab,n)];
%----------------------
% G0 is always non-singular because by construction there are no zeros on
% the diagonal of a(1:n-nunstab,1:n-nunstab), which forms G0's ul corner.
%-----------------------
G0I=inv(G0);
G1=G0I*G1;
usix=n-nunstab+1:n;
C=G0I*[tmat*q*c;(a(usix,usix)-b(usix,usix))\q2*c];
impact=G0I*[tmat*q*psi;zeros(nunstab,size(psi,2))];
%-------------------- above are output for system in terms of z'y -------
G1=z*G1*z';
if max(max(abs(imag(G1))))>100*realsmall
    disp('Inaccuracy in G1:')
    s1=svd(G1);
    s2=svd(real(G1));
    disp(max((s1-s2)./(1/12+s1))) % this is reasonable scaling for monthly time unit
end
G1=real(G1);
C=real(z*C);
impact=real(z*impact);
