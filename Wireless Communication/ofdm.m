clc; clear all; close all;
nfft=64;
ndsc=52;
nbpers=52;
nsym=10^4;
ebnodb=[0:10];
esnodb=ebnodb+10*log10(ndsc/nfft)+10*log10(64/80);
for ii=1:length(ebnodb)
    ipbit=rand(1,nbpers*nsym)>0.5;
    ipmod=2*ipbit-1;
    ipmod=reshape(ipmod,nbpers,nsym).';
    xf=[zeros(nsym,6) ipmod(:,[1:nbpers/2]) zeros(nsym,1) ipmod(:,[nbpers/2+1:nbpers]) zeros(nsym,5)];
    xt=(nfft/sqrt(ndsc))*ifft(fftshift(xf.')).';
    xt=[xt(:,[49:64]) xt];
    xt=reshape(xt.',1,nsym*80);
    nt=1/sqrt(2)*[randn(1,nsym*80)+j*randn(1,nsym*80)];
    yt=sqrt(80/64)*xt+10^(-esnodb(ii)/20)*nt;
    yt=reshape(yt.',80,nsym).';
    yt=yt(:,[17:80]);
    yf=(sqrt(ndsc)/nfft)*fftshift(fft(yt.')).';
    ymod=yf(:,[6+[1:nbpers/2] 7+[nbpers/2+1:nbpers]]);
    ipmodhat=2*floor(real(ymod/2))+1;
    ipmodhat(find(ipmodhat>1))=+1;
    ipmodhat(find(ipmodhat<-1))=-1;
    ipbithat=(ipmodhat+1)/2;
    ipbithat=reshape(ipbithat.',nbpers*nsym,1).';
    nerr(ii)=size(find(ipbithat-ipbit),2);
end
simBer=nerr/(nsym*nbpers);
theoryBer=(1/2)*erfc(sqrt(10.^(ebnodb/10)));
close all;
figure;
semilogy(ebnodb,theoryBer,'bs-','linewidth',2);
hold on
semilogy(ebnodb,simBer,'mx-','linewidth',2);
axis([0 10 10^-5 1]);
grid on;
legend('theory','simulation');
xlabel('eb/No in db');ylabel('BER');
title('BER error for BPSK using OFDM');

       