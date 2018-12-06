clear;
clc;
Fs=45e6;
PRT=300e-6;
tt=100e-6;
%N=Fs*PRT;%13500个点
% N = round(N);
N = 6600;
index=linspace(1,N,N);

%参考信号
imported_data = importdata('C:\Users\Administrator\Desktop\B组data\b1.dat');
x=imported_data(:,1)';
y=imported_data(:,2)';
N_total = length(x);%135000个点，所以发送了10个脉冲
for z=1:1:N
    signal(z)=x(z+8000)+1i*y(z+8000);%取第二个参考信号脉冲
end
figure(1);
subplot(3,2,1);
plot(abs(signal));
title('第二个参考脉冲信号');
axis tight;

%有角反射的回波信号
imported_data_with_reflect = importdata('C:\Users\Administrator\Desktop\B组data\b1_back2.dat');
x_reflect=imported_data_with_reflect(:,1);
y_reflect=imported_data_with_reflect(:,2);
for z=1:1:N
      signal_reflect(z)=x_reflect(z+15000)+1i*y_reflect(z+15000);%取第二个参考信号的回波信号脉冲
end

subplot(3,2,3);
plot(abs(signal_reflect));
title('第二个回波信号（有角反射器）');
axis tight;

imported_data_with_blank = importdata('C:\Users\Administrator\Desktop\B组data\b2_back2.dat');
x_blank=imported_data_with_blank(:,1);
y_blank=imported_data_with_blank(:,2);
for z=1:1:N
      signal_blank(z)=x_blank(z+14000)+1i*y_blank(z+14000);%取第二个参考信号的回波信号脉冲
end
subplot(3,2,5);
plot(abs(signal_blank));
title('第二个参考脉冲信号（无角反射器）');
axis tight;

signal_fft = fft(signal);
signal_reflect_fft = fft(signal_reflect);
signal_blank_fft = fft(signal_blank);
subplot(3,2,2);
plot(abs(signal_fft));
title('参考信号的频谱');
axis tight;

subplot(3,2,4);
plot(abs(signal_reflect_fft));
title('回波信号（有角反射器）的频谱');
axis tight;

subplot(3,2,6);
plot(abs(signal_blank_fft));
title('回波信号（无角反射器）的频谱');
axis tight;

figure(2);
t1 = ifft(conj(signal_fft).*signal_reflect_fft);
lnt1 = 10.*log10(abs(t1./max(t1)));
t2 = ifft(conj(signal_fft).*signal_blank_fft);
lnt2 = 10.*log10(abs(t2./max(t2)));


for m = 1:1:200
    result_refl(m) = lnt1(m+5698-1);
    result_blank(m) = lnt2(m+5105-1);
end
plot(result_refl,'r');
hold on;
% axis([2400 2600 -60 0]);

plot(result_blank,'b');
legend('有角反射器','无角反射器');
hold off;