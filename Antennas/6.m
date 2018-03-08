clc;
close all;
clear all;

theta = 0:0.01*pi:pi;
k = 1.88;
w = 4;
h = 0.1588;
a = (k*w)/2;
e = (sin(a*cos(theta))./(a*cos(theta))).*sin(theta);
polar(theta,abs(e)./max(e),'--r');
hold on
b = (k*h)/2;
c = (k*0.6)/2;
h = (sin(b*cos(theta))./(b*cos(theta))).*cos(c*cos(theta));
polar(theta,abs(h)./max(h),'--b');