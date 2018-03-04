clc;
clear all;
symbol=[1:5];
prob=[0.4 0.2 0.2 0.1 0.1];
[dict,avglen]=huffmandict(symbol,prob);
temp=dict;
Ltotal=0;
H=0;
Htotal=0;
for i=1:length(temp)
    m=temp{i,2}
    l=length(m)
    L=l*prob(i)
    Ltotal=Ltotal+L
    H=(-3.32)*(prob(i)*log10 (prob(i)))
    Htotal=Htotal+H
end