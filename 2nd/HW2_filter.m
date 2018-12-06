B=1e8;  %扫频带宽100MHz
fs=1e9; %采样频率是带宽的10倍，过采样
T=1e-6; %没有指定脉宽，假设为1us
TB=B*T; %时频积,100
N=fs*T; %采样点数，1000
alpha=1/(2*100*TB);
n=1:N;
s=exp(j*2*pi*alpha*(n-N/2).^2);
h=conj(s(end:-1:1));%匹配滤波器函数
st=[ -N/2:N/2];
st(end)=[];
ht=st;
num_begin=st(1)+ht(1);%卷积的结果序列中，起始序号为两者起始序号相加，结束序号为两者结束序号相加，共有2N-1个点
num_end=st(length(s))+ht(length(h));
n=[ num_begin:num_end];
y=conv(s,h);
ty=(n/N)*T;%归一化为T
subplot(2,1,1);
plot(ty*1e6,abs(y));
xlabel('时间 \mus');
ylabel('信号幅值');
title('线性调频信号经过匹配滤波器 T=1\mus  B=100MHz');
grid on;
subplot(2,1,2);
yy=fft(y);%对信号进行FFT
yy=fftshift(yy);%让正半轴部分和负半轴部分的图像分别关于各自的中心对称
L=length(yy);%FFT的点数
i=[ -L/2: L/2]/L*fs;%fft下的频域周期为fs
i(end)=[];
plot(i/1e6,abs(yy));
xlabel('频率 MHz');
ylabel('幅值');
title('线性调频信号经过匹配滤波器频谱 T=1\mus B=100MHz');
grid on;