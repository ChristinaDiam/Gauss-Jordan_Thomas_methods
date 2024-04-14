%%
%ask2. (k=2)

k=2;
n = 10^k; %megethos pinaka 

%dimiourgia tridiagwniou pinaka A
A1 = 4 * eye(n); %kiria diagwnios isa me 4
A1 = A1 + diag(-1 * ones(n-1, 1), -1); %katw ypodiagwnios isa me -1
A1 = A1 + diag(-3 * ones(n-1, 1), 1);  %panw ypodiagwnios isa me -3clear

%orismos dianismatos x
x1 = ones(n, 1);

%ypologismos tou b
b1 = A1 * x1;

%metrisi xronou Thomas
tic
%epilysi tou Ax=b me Thomas
x_calc1 = thomas(A1, b1);
toc

%metrisi xronou Gauss
tic
%epilisi tou Ax=b me Gauss
x_gauss1 = gauss(A1,b1,n);
toc
%%
%ask.2 (k=3)

k=3;
n = 10^k; %megethos pinaka 

%dimiourgia tridiagwniou pinaka A
A2 = 4 * eye(n); %kiria diagwnios isa me 4
A2 = A2 + diag(-1 * ones(n-1, 1), -1); %katw ypodiagwnios isa me -1
A2 = A2 + diag(-3 * ones(n-1, 1), 1);  %panw ypodiagwnios isa me -3clear

%orismos dianismatos x
x2 = ones(n, 1);

%ypologismos tou b
b2 = A2 * x2;

%metrisi xronou Thomas
tic
%epilysi tou Ax=b me Thomas
x_calc2 = thomas(A2, b2);
toc

%metrisi xronou Gauss
tic
%epilisi tou Ax=b me Gauss
x_gauss2 = gauss(A2,b2,n);
toc
%%
%sinartisi Thomas
function x = thomas(A, b)
    n = length(b);
    
    %aposinthesi LU
    for k = 2:n
        factor = A(k, k-1) / A(k-1, k-1);
        A(k, k-1) = 0;
        A(k, k) = A(k, k) - factor * A(k-1, k);
        b(k) = b(k) - factor * b(k-1);
    end
    
    %opisthodromiki ypostiriksi
    x(n) = b(n) / A(n, n);
    for k = n-1:-1:1
        x(k) = (b(k) - A(k, k+1) * x(k+1)) / A(k, k);
    end
end
%%
%sinartisi gauss xoris odigisi
function x = gauss(A,b,n)

    % O epauximenos pinakas
    a = [A b];
    
    d=det(A); % Ypologismos tis orizousas tou A
    if d==0 
        disp('Afou i orizousa einai 0 to sistima den exei monadiki lisi');return;
    end
    
    % Methodos Gauss Elimination
    for r=1:n-1
        for q=r+1:n
            % Bima 3.2 Ektelesi odigisis          
            if a(r,r)==0
                disp('Afou to odigo stoixeio einai 0 ginetai antallagi grammon');
                bq=a(r,:);
                a(r,:)=a(q,:);
                a(q,:)=bq;
            end
        end
        
        % Bima 3.3
        for i=r+1:n
    
            m=-(a(i,r)/a(r,r));     % o pollaplasiastis pou ipologizetai ek neou se kathe epanalipsi
            a(i,:)=a(i,:)+a(r,:)*m; % Exagogi olokliris grammis  
        end
    end
   
     x=zeros(1,n);
     x(n)=a(n,n+1)/a(n,n);
     
    for i=n-1:-1:1
        c=0;
        for j=i+1:n
            c=c+a(i,j)*x(j);
        end
        x(i)=(a(i,n+1)-c)/a(i,i);
    end
end
