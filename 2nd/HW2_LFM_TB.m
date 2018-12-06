B=1e8;  %扫频带宽100MHz
fs=1.4e8; %采样频率是带宽的1.4倍，过采样
num=1;
for i=[0.1,0.5,1]
    subplot(3,2,num);
    T=i*1e-6; %没有指定脉宽，假设为1us
    TB=B*T; %时频积,100
    N=fs*T; %采样点数，1000
    alpha=1/(2*1.4*1.4*TB);
    n=1:N;
    s=exp(j*2*pi*alpha*(n-N/2).^2);
    h=conj(s(end:-1:1));%匹配滤波器函数
    h_out=fft(h); %产生输出信号
    h_out=fftshift(h_out);%对信号进行平移
    L=length(h_out);%FFT的点数
    i=[ -L/2: L/2]/L*fs;%fft下的频域周期为fs
    i(end)=[];
    plot(i/1e6,abs(h_out));
    xlabel('频率 MHz');
    ylabel('幅值');
    title(['匹配滤波器频谱 TBP=',num2str(TB)]);
    grid on;
    num=num+1;
    subplot(3,2,num);
    plot(i/1e6,unwrap(phase(h_out)));
    xlabel('频率 MHz');
    ylabel('弧度');
    title(['匹配滤波器相位 TBP=',num2str(TB)]);
    grid on;
    num=num+1;
end
