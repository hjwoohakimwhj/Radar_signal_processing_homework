clear all;
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
imported_data_with_reflect = importdata('C:\Users\Administrator\Desktop\B组data\b1_back2.dat');
x_reflect=imported_data_with_reflect(:,1);
y_reflect=imported_data_with_reflect(:,2);
imported_data_with_blank = importdata('C:\Users\Administrator\Desktop\B组data\b2_back2.dat');
x_blank=imported_data_with_blank(:,1);
y_blank=imported_data_with_blank(:,2);
signal_total=zeros(1,N);
signal_reflect_total=zeros(1,N);
signal_blank_total=zeros(1,N);
for TT=1:1:9
    T=TT-1;
    for z=1:1:N
        signal(z)=x(z+13500*T+8000+9*T)+1i*y(z+13500*T+8000+9*T);%取第二个参考信号脉冲
    end
    signal_total=signal_total+signal;
    for z=1:1:N
        signal_reflect(z)=x_reflect(z+13500*T+15000+9*T)+1i*y_reflect(z+13500*T+15000+9*T);%取第二个参考信号的回波信号脉冲
    end
    signal_reflect_total=signal_reflect+signal_reflect_total;
    for z=1:1:N
        signal_blank(z)=x_blank(z+13500*T+14000+9*T)+1i*y_blank(z+13500*T+14000+9*T);%取第二个参考信号的回波信号脉冲
    end
    signal_blank_total=signal_blank+signal_blank_total;
end
plot(abs(signal_total));
signal_fft = fft(signal_total);
signal_reflect_fft = fft(signal_reflect_total);
signal_blank_fft = fft(signal_blank_total);
t1 = ifft(conj(signal_fft).*signal_reflect_fft);
lnt1 = 10.*log10(abs(t1./max(t1)));
t2 = ifft(conj(signal_fft).*signal_blank_fft);
lnt2 = 10.*log10(abs(t2./max(t2)));

for m = 1:1:200
     result_refl(m) = lnt1(m+5697);
     result_blank(m) = lnt2(m+5104);
end
plot(result_refl,'r');
hold on;
plot(result_blank,'b');
hold off;