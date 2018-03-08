clc;
close all;
clear all;
N=10^6;
ip=floor(rand(1,N)*2);
s=2*ip-1;
ebno=[-3:35];

for ii=1:length(ebno)
    n=1/sqrt(2)*[rand(1,N)+j*rand(1,N)];
    h=1/sqrt(2)*[rand(1,N)+j*rand(1,N)];
    y=h.*s+10^(-ebno(ii)/20)*n;
    ymod=y./h;
    ipmod=real(ymod)>0;
    nerror(ii)=size(find([ip-ipmod]),2);
end
simber=nerror/N;
thberawgn=0.5*erfc(sqrt(10.^(ebno/10)));
ebnoin=10.^(ebno/10);
thber=0.5*(1-sqrt(ebnoin/(ebnoin+1)));
close all
figure
semilogy(ebno,thberawgn,'cd-','Linewidth',2)
hold on;
semilogy(ebno,thber,'bp-','Linewidth',2)
semilogy(ebno,simber,'mx-','Linewidth',2)
axis([-3 35 10^-5 .5])
grid on;
legend('awgn','th','simu');
xlabel('ebno');
ylabel('ber');
title('modn for ofdm');