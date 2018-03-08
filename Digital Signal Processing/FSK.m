%program to display frequency shift keying modulation
freqsep = 8; nsamp = 8; Fs = 32;
x = randint(1000,1); 
figure;
subplot(2,1,1);
stem(x(1:10),'filled');
grid on;
title('random bits by ANKIT GARG AB35015');
xlabel('n-->');
y = fskmod(x,M,freqsep,nsamp,Fs); 
ly = length(y);
freq = [-Fs/2 : Fs/ly : Fs/2 - Fs/ly];
Syy = 10*log10(fftshift(abs(fft(y))));
subplot(2,1,2);
plot(freq,Syy);
grid on;
xlabel('f-->');