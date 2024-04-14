%%
%ask 1.1.

%orismos pinaka A
A = [ 10 -2 -1 2 3 1 -4 7;
      5 11 3 10 -3 3 3 -4;
      7 12 1 5 3 -12 2 3;
      8 7 -2 1 3 2 2 4;
      2 -13 -1 1 4 -1 8 3;
      4 2 9 1 12 -1 4 1;
      -1 4 -7 -1 1 1 -1 -3;
      -1 3 4 1 3 -4 7 6];

[n,n] = size(A);

%orismos dianismatos x
x = [-1; 1; -1; 1; -1; 1; -1; 1];

%ypologismos tou b=Ax
b1 = A*x;

%jordan
[xn,h,Aa]= pivot_gaussjordan(A,b1,n);
%%
%ask1.2.

n = 8;

%orismos pinaka A
A2 =  zeros(n);      %dimiourgia midenikou pinaka n x n

%dimiourgia tou kainourgiou pinaka A
for i = 1:n
    for j = 1:n
        A2(i,j) = 1/(i+j-1);
    end
end

%ypologismos tou b=Ax
b2 = A2*x;

%jordan
[xn2,h2,Aa2]= pivot_gaussjordan(A2,b2,n);
%%
%ask1.3.1. (sfalma)

%ypologismos normas infinity tou x
norm_inf_x = norm(x, 'inf');

%ypologismos delta x
deltax = x - xn;

%ypologismos normas infinity tou delta x
norm_inf_deltax = norm(deltax, 'inf');

%ypologismos sfalmatos
sfalma1 = norm_inf_deltax/norm_inf_x;

%----------------------------------------

%ypologismos delta x2
deltax2 = x - xn2;

%ypologismos normas infinity tou delta x2
norm_inf_deltax2 = norm(deltax2, 'inf');

%ypologismos sfalmatos
sfalma2 = norm_inf_deltax2/norm_inf_x;
%%
%ask.1.3.2. (ypoloipo)

%ypologismos delta r
deltar = b1 - (A*xn);

%ypologismos normas infinity tou delta r
norm_inf_deltar = norm(deltar, 'inf');

%ypologismos ypoloipou
ypoloipo1 = norm_inf_deltar/norm_inf_x;

%----------------------------------------

%ypologismos delta r2
deltar2 = b2 - (A2*xn2);

%ypologismos normas infinity tou delta r2
norm_inf_deltar2 = norm(deltar2, 'inf');

%ypologismos ypoloipou
ypoloipo2 = norm_inf_deltar2/norm_inf_x;
%%
%ask1.3.3. (ypologismos k(A) kai k(A2))

%ypologismos tou antistrofou pinaka A
A_inv = inv(A);

%ypologismos normas infinity tou A
norm_inf_A = norm(A, 'inf');

%ypologismos normas infinity tou antistrofou tou A
norm_inf_A_inv = norm(A_inv, 'inf');

%ypologismos arithmou sinthikis K(A)
KA = norm_inf_A * norm_inf_A_inv;

%-------------------------------------------------

%ypologismos tou antistrofou pinaka A2
A2_inv = inv(A2);

%ypologismos normas infinity tou A2
norm_inf_A2 = norm(A2, 'inf');

%ypologismos normas infinity tou antistrofou tou A2
norm_inf_A2_inv = norm(A2_inv, 'inf');

%ypologismos arithmou sinthikis K(A2)
KA2 = norm_inf_A2 * norm_inf_A2_inv;
