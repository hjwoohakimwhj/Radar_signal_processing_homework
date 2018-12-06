clear;clc;  
prf=1e4;
T=0.1;
N=T/prf;%N=1000
for n=1:1:1000
    x(n) = 1*exp(i*2*pi*(2/3)*1e4*T*n/N);
end
subplot(5,1,1);
y = awgn(x,-30);
F=fft(y);
plot(abs(F));
title('SNR=-30dB');
grid on;
subplot(5,1,2);
y2 = awgn(x,-20);
F2=fft(y2);
plot(abs(F2));
title('SNR=-20dB');
grid on;
subplot(5,1,3);
y = awgn(x,-15);
F=fft(y);
plot(abs(F));
title('SNR=-15dB');
grid on;
subplot(5,1,4);
y2 = awgn(x,-10);
F2=fft(y2);
plot(abs(F2));
title('SNR=-10dB');
grid on;
subplot(5,1,5);
y3 = awgn(x,-5);
F3=fft(y3);
plot(abs(F3));
title('SNR=-5dB');
grid on;