%Program to find the linear convolution of two sequences
x1=input('Enter the first sequence x1(n) = ');
t1=input('Enter the starting time of first sequence t1 = ');
x2=input('Enter the second sequence x2(n) = ');
t2=input('Enter the starting time of second sequence t2 = ');
yn=conv(x1,x2);
grid on;
plot(yn);