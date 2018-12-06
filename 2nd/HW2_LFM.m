B=1e8;  %扫频带宽100MHz
fs=1e9; %采样频率是带宽的10倍，过采样
T=1e-6; %没有指定脉宽，假设为1us
TB=B*T; %时频积,100
N=fs*T; %采样点数，1000
alpha=1/(2*100*TB);
n=1:N;
s=exp(j*2*pi*alpha*(n-N/2).^2);
subplot(3,1,1);
t=[-T/2:1/fs:T/2];
t(end)=[];
plot(t*1e6,real(s));
xlabel('时间 \mus');
ylabel('调频信号的实部');
title('线性调频信号（T=1\mus B=100MHz）');
grid on;
subplot(3,1,2);
y=fft(s);%对信号进行FFT
y=fftshift(y);%让正半轴部分和负半轴部分的图像分别关于各自的中心对称
L=length(y);%FFT的点数
i=[ -L/2: L/2]/L*fs;%fft下的频域周期为fs
i(end)=[];
plot(i/1e6,abs(y));
grid on;
xlabel('频率 MHz');
ylabel('幅值');
title('线性调频信号频谱');
subplot(3,1,3);
plot(i/1e6,unwrap(phase(y)));
xlabel('频率 MHz');
ylabel('相位');
title('线性调频信号相位特性');

