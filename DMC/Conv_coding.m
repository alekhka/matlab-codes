clear all;
clc;
g1=[1 0 1];
g2=[1 1 1];
d=[1 0 1 1 0];
v1=zeros(1, ((length(g1)+length(d))-1))
v2=zeros(1, ((length(g1)+length(d))-1))
m=length(d); 
n=length(g1); 
d=[d,zeros(1,n)]; 
g1=[g1,zeros(1,m)]; 
g2=[g2,zeros(1,m)];
for i=1:n+m-1 
C(i)=0; 
for j=1:m 
if(i-j+1>0) 
v1(i)=v1(i)+d(j)*g1(i-j+1);
v2(i)=v2(i)+d(j)*g2(i-j+1);
end 
end 
end
v1=mod(v1, 2)
v2=mod(v2, 2)
C=zeros(1, 14);
for i=1:2:14
    C(i)=v1((i+1)/2);
    C(i+1)=v2((i+1)/2);
end
disp(C);