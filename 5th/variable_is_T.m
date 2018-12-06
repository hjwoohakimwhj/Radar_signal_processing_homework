clear;clc;  
prf=1e4;

T=0.05;
N=T/prf;%N=500
for n=1:1:500
    x(n) = 1*exp(i*2*pi*(2/3)*1e4*T*n/N);
end
subplot(3,1,1);
y = awgn(x,-5);
F=fft(y);
plot(abs(F));
title('T=0.05');
grid on;

T=0.1;
N=T/prf;%N=1000
for n=1:1:1000
    x(n) = 1*exp(i*2*pi*(2/3)*1e4*T*n/N);
end
subplot(3,1,2);
y = awgn(x,-5);
F=fft(y);
plot(abs(F));
title('T=0.1');
grid on;

T=0.5;
N=T/prf;%N=5000
for n=1:1:5000
    x(n) = 1*exp(i*2*pi*(2/3)*1e4*T*n/N);
end
subplot(3,1,3);
y = awgn(x,-5);
F=fft(y);
plot(abs(F));
title('T=0.5');
grid on;