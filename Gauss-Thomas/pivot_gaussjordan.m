function [xn,h,Aa]= pivot_gaussjordan(A,B,n)
% Euressi lisis sistimatos me ti methodo Gauss Jordan xrisimopoiontas meriki
% odigisi

%Bima 2: Dimiourgia tou epauximenou pinaka A|B
a=[A B];


%Bima 3: Arxikopoiisi tou dianismatos h 
for i=1:n
    h(i)=i;
end
h=h';

%Bima 4
for r=1:n;
max=0;
p=0;

%Bima 4.1: Briskei ti megisti timi tis trexousas stilis kai epistrefei ti
%thesi tis grammis
for j=r:n
    if abs(a(h(j),r))>max
        max=abs(a(h(j),r));
        p=j;
    end
end
%Bima 4.2:
if a(h(p),r)==0
    disp('den iparxei monadiki lisi');
    return
end
%Bima 4.3: Pragmatopoiei tin antallagi grammon sto dianisma h
if h(r)~=h(p)
    q=h(r);
    h(r)=h(p);
    h(p)=q;
end

%Bima 4.4: Methodos apaloifis Gauss
%Bima 4.4.1
for i=1:n
    if i~=r
        m(h(i),r)=-a(h(i),r)/a(h(r),r);  
%Bima 4.4.2   
        a(h(i),:)=a(h(i),:)+m(h(i),r)*a(h(r),:);
    end
end
end

%Bima 5: Ypologismos lisis tou sistimatos
x=zeros(n,1);
for i=1:n
    if a(h(n),n)==0
        disp('den iparxei monadiki lisi');
        return
    end
    x(i)=a(h(i),n+1)/(a(h(i),i));
end

%Bima 6: Lisi tou sistimatos
xn=x
Aa=a