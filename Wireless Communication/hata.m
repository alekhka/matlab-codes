close all;
clc;
clear all;
f=input('Enter the frequency :');
hte=input('Enter the transmitter height :');
hre=input('Enter the receiver height :');
d=input('Enter the distance :');
c_h =0.8+(1.1*log10(f)-0.7)*hre-(1.56*log10(f));
L50=69.55+(26.16*log10(f))-(13.82*log10(hte))-c_h+(44.9-6.55*log10(hte))*log10(d);
if(f<300)
    ch=8.29*(log10(1.54*hre)).^2-1.1;
else
    ch=3.2*(log10(11.75*hre)).^2-4.97;
end
L_501=69.55+26.16*log10(f)-13.82*log10(hte)-ch+(44.9-6.55*log10(hte))*log10(d);
disp('path loss for large:');
disp(L_501);
disp('path loss for urban');
disp(L50);
disp('path loss for rural ');
L_50r=L50-4.78*((log10(f))^2)+18.33*log10(f)-40.98;          
disp(L_50r);
disp('path loss for suburbun');
L_50s=L50-2*((log10(f/28)).^2)-5.4;
disp(L_50s);

%wrt freq
ff=150:10:1500
c_h=0.8+(1.1*log10(f)-0.7).*hre-(1.56.*log10(ff));
L50=69.55+26.16.*log10(ff)-13.82*log10(hte)-c_h+(44.9-6.5*log10(hte))*log10(d);
if(ff<300)
    ch=8.29*(log10(1.54*hre)).^2-1.1;
else
    ch=3.2*(log10(11.75*hre)).^2-4.97;
end
L_501= 69.55+(26.16*log10(ff))-(13.82*log10(hte))-ch+(44.9-6.55*log10(hte))*log10(d);  
L_50r=L50-4.78*((log10(ff)).^2)+18.33*log10(ff)-40.98;
disp(L_50r);
disp('path loss for suburbun');
L_50s=L50-2*((log10(ff/28)).^2)-5.4;
disp(L_50s);
figure(1);
plot(ff,L_501,'r',ff,L50,'g',ff,L_50r,'b',ff,L_50s)
legend('large city','Urban','Rural','Suburban');
xlabel('freq in mhz');
ylabel('path loss in db');
title('hata model variation with frequency');

%wrt distance
dd=0:1:20
c_h=0.8+(1.1*log10(f)-0.7).*hre-(1.56.*log10(f));
L50=69.55+26.16.*log10(f)-13.82*log10(hte)-c_h+(44.9-6.5*log10(hte))*log10(dd);
if(f<300)
    ch=8.29*(log10(1.54*hre)).^2-1.1;
else
    ch=3.2*(log10(11.75*hre)).^2-4.97;
end
L_501= 69.55+(26.16*log10(f))-(13.82*log10(hte))-ch+(44.9-6.55*log10(hte))*log10(dd);  
L_50r=L50-4.78*((log10(f))^2)+18.33*log10(f)-40.98;
disp(L_50r);
disp('path loss for suburbun');
L_50s=L50-2*((log10(f/28)).^2)-5.4;
disp(L_50s);
figure(2);
plot(dd,L_501,'r',dd,L50,'b',dd,L_50r,'g',dd,L_50s)
legend('large city','Urban','Rural','Suburban');
xlabel('receiver antenna height');
ylabel('path loss in db');
title('hata model variation with distance');


%wrt hre
h_re=2:1:10
c_h=0.8+(1.1*log10(f)-0.7).*h_re-(1.56.*log10(f));
L50=69.55+26.16.*log10(f)-13.82*log10(hte)-c_h+(44.9-6.5*log10(hte))*log10(d);
if(f<300)
    ch=8.29*(log10(1.54*h_re)).^2-1.1;
else
    ch=3.2*(log10(11.75*h_re)).^2-4.97;
end
L_501= 69.55+(26.16*log10(f))-(13.82*log10(hte))-ch+(44.9-6.55*log10(hte))*log10(d);  
L_50r=L50-4.78*((log10(f))^2)+18.33*log10(f)-40.98;
disp(L_50r);
disp('path loss for suburbun');
L_50s=L50-2*((log10(f/28)).^2)-5.4;
disp(L_50s);
figure(3);
plot(h_re,L_501,'r',h_re,L50,'b',h_re,L_50r,'g',h_re,L_50s)
legend('large city','Urban','Rural','Suburban');
xlabel('receiver antenna height');
ylabel('path loss in db');
title('hata model variation with receiver antenna height');

%wrt hte
h_te=100:10:300
c_h=0.8+(1.1*log10(f)-0.7).*hre-(1.56.*log10(f));
L50=69.55+26.16.*log10(f)-13.82*log10(h_te)-c_h+(44.9-6.5*log10(h_te))*log10(d);
if(f<300)
    ch=8.29*(log10(1.54*hre)).^2-1.1;
else
    ch=3.2*(log10(11.75*hre)).^2-4.97;
end
L_501= 69.55+(26.16*log10(f))-(13.82*log10(h_te))-ch+(44.9-6.5*log10(h_te))*log10(d);  
L_50r=L50-4.78*((log10(f))^2)+18.33*log10(f)-40.98;
disp(L_50r);
disp('path loss for suburbun');
L_50s=L50-2*((log10(f/28)).^2)-5.4;
disp(L_50s);
figure(4);
plot(h_te,L_501,'r',h_te,L50,'b',h_te,L_50r,'g',h_te,L_50s)
legend('large city','Urban','Rural','Suburban');
xlabel('transmitting antenna height');
ylabel('path loss in db');
title('hata model variation with transmitting antenna height');
















