M = 2; % Number of points in constellation
intg = [0:M-1].; % Vector of integers between 0 and M-1
pt = pskmod(intg,M); % Vector of all points in constellation
scatterplot(pt);
% Include text annotations that number the points.
text(real(pt)+0.1,imag(pt),dec2bin(intg));
axis([-2 2 -2 2]); % Change axis so all labels fit in plot.
grid on;
title('BPSK signal constellation');