%program to show amplitude modulation;
fs=8000; fc=300;
t=[0:.1*fs]'/fs;
x=sin(20*pi*t);
y=ammod(x,fc,fs);
figure;
subplot(2,1,1);
plot(t,x);
grid on;
xlabel('t'); ylabel('x');
title('modulating signal');
subplot(2,1,2);
plot(t,y);
grid on;
xlabel('t');  ylabel('y');   title('modulated signal');