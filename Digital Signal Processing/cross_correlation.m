% PROGRAM TO SHOW CROSS CORRELATION FUNCTION
clc; clear all; close all;
%x=input('enter the sequence')....1
x=[1 2 3];   %....2
% either eq. 1 or 2 may be used to enter the value of sequence
y=[2 4 6];
z=xcorr(x,y);
figure;
subplot(3,1,1);
plot(x);
title('SEQUENCE 1:');
ylabel('amplitude ---->');
xlabel('(q)n  ---->');
grid on;
subplot(3,1,2);
plot(y);
title('SEQUENCE 2:');
ylabel('amplitude ---->');
xlabel('(r)n ---->');
grid on;
subplot(3,1,3);
plot(z);
ylabel('amplitude ---->');
xlabel('(o)n ---->');
title('CROSS CORRELATION FUNCTION:');
disp('the resultant signal is');
grid on;