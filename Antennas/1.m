clc;
close all;
clear all;

o = 0:0.01*pi:2*pi;
e = cos( ((pi) * cos(o))  )
polar(o,abs(e)/max(e));
title('Radiation pattern of an antenna');
figure();
plot(o.*180/pi,abs(e));
xlabel('angle(in degrees)');
ylabel('absolute gain');
grid on;