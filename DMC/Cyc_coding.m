%%Encoding
 
n=input('Enter codeword length:');
k=input('Enter message length:');
m=input('Enter the message:');
g=cyclpoly(n,k,'max');
m_flip=fliplr(m);
reg=zeros(1,n-k);
for i=1:k;
    if(xor(reg(n-k),m_flip(i)))
        for j=0:(n-k)-2;
            reg(((n-k)-j))=xor(reg(((n-k)-j)-1),g(((n-k)-j)));
        end
        reg(1)=g(1);
    else
        for j=0:(n-k)-2;
            reg(((n-k)-j))=reg(((n-k)-1));
        end
        reg(1)=0;
    end
    reg;
end
msg_block=[m,reg];
disp('Emcoded Message:');
disp(msg_block);

%%Decoding
 
n=7;
k=4;
r1=[1 0 0 1 0 1 1];
g=cyclpoly(n,k,'max');
m1_flip=fliplr(r1);
reg=zeros(1,n-k);
for i=1:n
    if (reg(n-k));
        p=reg(n-k);
        for j=0:(n-k)-2
            reg(((n-k)-j))=xor(reg(((n-k)-j)-1),g(((n-k)-j)));
        end
        reg(1)=xor(m1_flip(i),p);
    else
        for j=0:(n-k)-2;
            reg(((n-k)-j))=reg(((n-k)-j)-1);
        end
        reg(1)=m1_flip(i);
    end
    reg;
end
if(reg==zeros(1,n-k))
    r1=r1;
else
    reg1=reg;
    shift=0;
    for i=1:n
        if(reg1(n-k))
            p=reg1(n-k);
            for j=0:(n-k)-2;
                reg1(((n-k)-j))=xor(reg1(((n-k)-j)-1),g(((n-k)-j)));
            end
            reg1(1)=xor(0,p);
        else
            for j=0:(n-k)-2;
                reg1(((n-k)-j))=reg1(((n-k)-j)-1);
            end
            reg1(1)=0;
        end
        reg1;
        shift=shift+1;
        if(reg1==[1 zeros(1,n-k-1)])
            break;
        end
    end
    r1(shift)=~r1(shift);
    r1;
end
rec_msg=[];
if (ans == 0)
    fprintf('No error\n');
    for i=1:k
        rec_msg(i)=r1(i);
    end
    disp('Received Message:');
    disp(rec_msg);
else
    fprintf('Error at bit location: %d\n',n-shift+1);
end