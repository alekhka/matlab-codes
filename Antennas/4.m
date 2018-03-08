clc;
close all;
clear all;

phi = 0: 0.01*pi:2*pi;
d = input('Enter d');
delta = input('Enter delta');
dr = 2*pi*d;
psi = dr*cos(phi) + delta;
e = cos(psi/2);
polar(phi,abs(e)/max(e));