c=[1 2 0 0];
A=[-1 1 1 0;1 1 0 1];
b=[1;2];
%no of constraint & variable
m=size(A,1);           % no of constraint 
n=size(A,2);           % no of variable
if n>=m
nv=nchoosek(n,m);
t=nchoosek(1:n,m);     % it forms pairs according to the value of m 
sol=[];                % it will store the solution
for i=1:nv
    y=zeros(n,1);      
    B=A(:,t(i,:));     % matrix B will take all the rows and columns will be according to pairs and value of "i"
    x=B\b;
    if all(x>=0 & x~=inf & x~=-inf ) % values will only be copied if non negativity constraints exist and x is not infinity or minus infinity
        y(t(i,:))=x;
    end
    sol=[sol y]; % at last answer is copied in the solution array
end
end
Z=c*sol;
[Zmax,Zind] = max(Z);
BFS = sol(:,Zind);    
disp(sol);
disp(BFS);
