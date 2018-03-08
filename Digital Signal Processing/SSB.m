Fs = 100;
t = [0:2*Fs+1]'/Fs;
Fc = 10; 
x = sin(2*pi*t); 
figure; subplot(2,1,1);
plot(t,x); grid on;
title('original message signal');
xlabel('t-->');  
ylabel('x-->');
ysingle = ssbmod(x,Fc,Fs);
zsingle = fft(ysingle)
zsingle = abs(zsingle(1:length(zsingle)/2+1))
frqsingle = [0:length(zsingle)-1]*Fs/length(zsingle)/2;
subplot(2,1,2);
plot(frqsingle,zsingle);
xlabel('x-->'); ylabel('y-->');
title('Spectrum of single-sideband signal');
grid on;