%Programe to find out the fourier transform of in time discrete form
x= sinc(2*pi*n/10) 
n=[0:29];
x= sinc(2*pi*n/10)  
n1=256;
x1=abs(fft(x,n1));
F1=[0: n1-1]/n1;  
stem(F1,x1,'-x'),title('n=256'), axis([0 1 0 20])
fourier(x)
grid on;