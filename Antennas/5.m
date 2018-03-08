clc;
close all;
clear all;

phi = 0:0.01*pi:2*pi;
l = input('Enter length');
cs = pi*l;
e = abs((cos(cs*cos(phi))-cos(cs))./sin(phi));
polar(phi,e);
title('Radiation Pattern');