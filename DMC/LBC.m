% function [msg_block] = linear_block_encode(n,k,msg_orig)
clc;
clear all;
close all;
n=7;
k=4;
msg_orig = [1 0 1 0];
[h1,g]=hammgen(n-k);
msg_block1 = msg_orig*g;
msg_block = mod(msg_block1,2)

% function [r] = linear_block_decode(n,k,r)
n=7
k=4
r= [ 1     0     1     1     0     1     0];
[h1,g]=hammgen(n-k);
p = [g(:,1:n-k)];
h = [eye(n-k),transpose(p)];
% disp('Hammimg Code')
ht = transpose(h);
% disp('Syndrome of a Given Codeword is :')
s = rem(r*ht,2)
for i = 1:1:size(ht)
if(ht(i,1:size(p,2))==s)
r(i) = mod(r(i)+1,2)
 
break;
end
end