B=1e8;  %扫频带宽100MHz
fs=1e9; %采样频率是带宽的10倍，过采样
T=1e-6; %没有指定脉宽，假设为1us
TB=B*T; %时频积,100
N=fs*T; %采样点数，1000
alpha=1/(2*100*TB);
n=1:N;
s=exp(j*2*pi*alpha*(n-N/2).^2);
h=conj(s(end:-1:1));%匹配滤波器函数
s_out=ifft(fft(s).*fft(h)); %产生输出信号
s_out=ifftshift(s_out);%对信号进行平移
L=length(s_out);%IFFT的点数
i=[ 0: L-1]/L*T;%fft下的时域周期为T
plot(i*1e6,abs(s_out));
xlabel('时间 \mus');
ylabel('信号幅值');
title('线性调频信号经过匹配滤波器 T=1\mus  B=100MHz');