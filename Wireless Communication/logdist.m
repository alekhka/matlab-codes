clc;
close all;
clear all;
d0=30;
f=[914 914 1500 900 1900 1300 4000 1300 1300 900 4000 1300];
n=[2.2 1.8 3 2.4 2.6 2 2.1 1.8 1.6 3 2.1 3.3];
sigma=[8.7 5.2 7 9.6 14.1 3 7 6 5.8 7 9.7 6.8];
d=[0 1000 2000 3000 4000 5000 6000 7000 8000 9000 10000 11000 12000 13000 14000 15000 16000 17000 18000 19000 20000 21000 22000 23000 24000 25000];
for i=1:12
    y(i)=300/(f(i));
    PL0(i)=-20*log10(y(i)/(4*pi*d0));
    X(i)=sigma(i).*randn(size(PL0(i)));
end
for i=1:12
    for j=1:26
        pld(i,j)=PL0(i)+(10*n(i)*log10(d(j)/d0));
        plad(i,j)=PL0(i)+(10*n(i)*log10(d(j)/d0))+X(i);
    end
end
figure(1)
plot(d,pld);
xlabel('dist in m');
ylabel('path loss in db');
title('long distance path loss without shadowing ');
hold on;
legend('retail store','grocery store','office','hard partition','soft partition','office partition','textile/chemical','paper/curds','mental working','indoor street','textile/chemical','mental working');
figure(2)
plot(d,plad);
plot(d,plad);
xlabel('distance in m');
ylabel('path loss in dB');
title('log distance path loss with shadowing');
hold on;
legend('retail store','grocery store','office','hard partition','soft partition','office partition','textile/chemical','paper/curds','mental working','indoor street','textile/chemical','mental working');
for i=1:12
    j=26;
    disp('with shadow:');
    disp(plad(j));
    disp('with out shadow:');
    disp(pld(j));
end










