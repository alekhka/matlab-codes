clear all
s=round(rand(1,25));
signal=[];
carrier=[];
t=[0:2*pi/119:2*pi];
for k=1:25
     if s(1,k)==0
         sig=-ones(1,120);
     else 
         sig=ones(1,120);
     end
     c=cos(t);
     carrier=[carrier c];
     signal=[signal sig];
end
subplot(4,1,1);
plot(signal);
axis([-100 3100 -1.5 1.5]);
title('\bf\it original bit sequence');
bpsk_sig=signal.*carrier;
subplot(4,1,2);
plot(bpsk_sig)
axis([-100 3100 -1.5 1.5]);
title('\bf\it BPSK bit sequence');
t1=[0:2*pi/9:2*pi];
t2=[0:2*pi/19:2*pi];
t3=[0:2*pi/29:2*pi];
t4=[0:2*pi/39:2*pi];
t5=[0:2*pi/59:2*pi];
t6=[0:2*pi/119:2*pi];
c1=cos(t1);
c1=[c1 c1 c1 c1 c1 c1 c1 c1 c1 c1 c1 c1];
c2=cos(t2);
c2=[c2 c2 c2 c2 c2 c2];
c3=cos(t3);
c3=[c3 c3 c3 c3];
c4=cos(t4);
c4=[c4 c4 c4];
c5=cos(t5);
c5=[c5 c5];
c6=cos(t6);
spread_signal=[];
for n=1:25
    c=randint(1,1,[1 6]);
    switch(c)
        case(1)
            spread_signal=[spread_signal c1];
        case(2)
             spread_signal=[spread_signal c2]; 
        case(3)
             spread_signal=[spread_signal c3]; 
        case(4)
             spread_signal=[spread_signal c4];
        case(5)
             spread_signal=[spread_signal c5];
        case(6)
             spread_signal=[spread_signal c6];
    end
end
subplot(4,1,3)
plot([1:3000],spread_signal);
axis([-100 3100 -1.5 1.5]);
title('\bf\it spread signal with 6 frequencies');
freq_hopped_sig=bpsk_sig.*spread_signal;
subplot(4,1,4)
plot([1:3000],freq_hopped_sig);
axis([-100 3100 -1.5 1.5]);
title('\bf\it frequnency hopped spread spectrum signal');
figure,subplot(2,1,1)
plot([1:3000],freq_hopped_sig);
axis([-100 3100 -1.5 1.5]);
title('\bf\it frequnency hopped spread spectrum signal and its FFT');
subplot(2,1,2);
plot([1:3000],abs(fft(freq_hopped_sig)));