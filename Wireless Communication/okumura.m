clc;
clear all;
close all;


d = input('Enter the distance between Tx and Rx: ');
hre = input('Enter the height of the reciever antenna: ');
hte = input('Enter the height of the transmiotter antenna: ');
f = input('Enter the carrier frequency: ');
EIRP = input('Enter the EIRP: ');
EIRP=20*log10(EIRP);
c = 3 * (10^8);
lamda = c/(f*10^6);
Amu = input('Enter the amu: ');
Garea = input('Enter the area gain: ');
g = input('Enter the reciever gain: ');
Gr=10*log10(g);
Lf = -10 * log10((lamda^2)/(((4 * pi)^2) * (d^ 2)));
Ghte=20*log10(hte/200);
if(hre>3)
    Ghre=20*log10(hre/3);
else
    Ghre=10*log10(hre/3);
end

disp('The path loss is : ');
L50 = Lf + Amu -Ghte -Ghre - Garea;
disp('power received');
Pr=EIRP-L50+Gr;
%plot wrt distance
dd=0:1000:20000;
Lf = -10 * log10((lamda^2)/(((4 * pi)^2) * (d^ 2)));
Ghte=20*log10(hte/200);
if(hre>3)
    Ghre=20*log10(hre/3);
else
    Ghre=10*log10(hre/3);
end
L50 = Lf + Amu -Ghte -Ghre - Garea;
Pr=EIRP-L50+Gr;
figure(1);
subplot(2,1,1);
plot(dd,L50);
title('suburban area');
xlabel('distance');
ylabel('path loss');
subplot(2,1,2);
plot(dd,Pr);
title('suburban area');
xlabel('distance');
ylabel('power received');

%plot wrt hte

hte=100:10:300;
Lf = -10 * log10((lamda^2)/(((4 * pi)^2) * (d^ 2)));
Ghte=20*log10(hte/200);
if(hre>3)
    Ghre=20*log10(hre/3);
else
    Ghre=10*log10(hre/3);
end
L50 = Lf + Amu -Ghte -Ghre - Garea;
Pr=EIRP-L50+Gr;
figure(2);
subplot(2,1,1);
plot(hte,L50);
title('suburban area');
xlabel('tx height');
ylabel('path loss');
subplot(2,1,2);
plot(hte,Pr);
title('suburban area');
xlabel('tx height');
ylabel('power received');
%plot wrt hre
hre=2:1:10;
Lf = -10 * log10((lamda^2)/(((4 * pi)^2) * (d^ 2)));
Ghte=20*log10(hte/200);
if(hre>3)
    Ghre=20*log10(hre/3);
else
    Ghre=10*log10(hre/3);
end
L50 = Lf + Amu -Ghte -Ghre - Garea;
Pr=EIRP-L50+Gr;
figure(3);
subplot(2,1,1);
plot(hre,L50);
title('suburban area');
xlabel('rx height');
ylabel('path loss');
subplot(2,1,2);
plot(hre,Pr);
title('suburban area');
xlabel('rx height');
ylabel('power received');




