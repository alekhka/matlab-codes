% PROGRAM TO SHOW AUTOCORELATION OF A FUNCTION
%x=input('enter the sequence')  ...1
x=[1 2 3]; %....2 
%either the eq. 1 or 2 is used to enter the sequence
y=xcorr(x,x);
subplot(2,1,1);
plot(x);
ylabel('amplidude ---->');
xlabel('(q)n ---->');
title('AUTOCORELATION FUNCTION:')
grid on;
subplot(2,1,2)
plot(y);
ylabel('amplidude ---->');
xlabel('(q)n ---->');
title('AUTOCORELATION FUNCTION:')
grid on;