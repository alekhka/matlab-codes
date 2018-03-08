clc;
close all;
clear all;

phi = 0:0.01*pi:2*pi;
n = input('Enter the number of point sources');
d = input('Enter the distance between 2 elements');
psi = (2*pi*d*cos(phi)) - (2*pi*d);
e = (1/n) * abs(sin(n*psi/2)./sin(psi/2));
subplot(1,2,1);
polar(phi,e);
title('Radiation Pattern');
subplot(1,2,2);
plot(phi*180/pi,e);
xlabel('angle(in degrees)');
ylabel('absolute gain');
grid on;