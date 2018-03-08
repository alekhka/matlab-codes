%modulation using QAM quadrature amplitude modulation
M=16;
k=log2(M);
n=3e4;
nsamp=1; % over sampling rate 
x=randint(n,1);
stem(x(1:40),'filled');
title('random bits');
xlabel('bit index');
ylabel('binary value');
grid on;
xsym=bi2de(reshape(x,k,length(x)/k).','left-msb');
figure;
stem(xsym(1:10));
title('random symbols')
xlabel('symbol indiex'); ylabel('integer value');
grid on;
y=modulate(modem.qammod(M),xsym);
ytx=y;
Ebno=10;%in dB
snr=EBno= 10*log10(k)- 10*log10(nsamp);
ynoisy=awgn(ytx,snr,'measured');% measured is heading
yrx=ynoisy;
%%scatter plot
%create scatter plot of noisy signal transmitted
%signal on same axis
h= scatterplot(yrx(1:nsamp*5e3),nsamp,0,'g-');
hold on;
scatterplot(ytx(1:5e3),1,0,'k-',h);
title('received signal';
legend('received signal','signal constellation');
axis([-5 5 -5 5]);
hold off;