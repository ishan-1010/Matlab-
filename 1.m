d=[3,2];
a=[2,4;3,5];
b=[8 15];
x=-1:1:max(b)+2;
plot(x,((b(1)-a(1,1)*x)/a(1,2)),x,((b(2)-a(2,1)*x)/a(2,2)),x,0*x,0*x,x);
a=[2,4;3,5;1,0;0,1];
b=[8 ;15; 0; 0];
c=zeros(length(b)*(length(b)-1)/2,2);
k=1;
for i=1:4
    for j=1+i:4
        A=[a(i,1),a(i,2);a(j,1),a(j,2)];
        B=[b(i);b(j)];
        e=A\B; 
        c(k,1)=e(1);
        c(k,2)=e(2);
        k=k+1;
    end
end
i=1;
while i<length(c)
    eq1=2*c(i,1)+4*c(i,2)-8;
    eq2=3*c(i,1)+5*c(i,2)-15;
    if (c(i,1)<0 && c(i,1)==-0)||(c(i,2)<0&&c(i,2)==-0)||(eq1>0)||(eq2>0)
        c(i,:)=[];
    else
        i=i+1;
    end
end
sol=[];
max1=0;
for i=1:length(c)
    eq3=3*c(i,1)+2*c(i,2);
    if max1<eq3
        max1=eq3;
        sol=c(i,:);
    end
end
disp(sol)
