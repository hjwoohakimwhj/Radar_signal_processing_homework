clear;
T=10e-6;    %线性调频信号脉宽
B=30e6;     %线性调频信号带宽
K=B/T;      %调频率
Fs=2*B;     %采样率满足奈奎斯特定理
Ts=1/Fs;    %采样间隔
N=T/Ts;     %采样点数
t=linspace(-T/2,T/2,N);
St=exp(j*pi*K*t.^2);
Ht=exp(-j*pi*K*t.^2);
s_out=ifftshift(ifft(fft(St,N).*fft(Ht,N),N));
ii=1;
for delta_t=[0.5,1,2,5]
delta_t=delta_t/B;
n=delta_t/Ts;%两个点
t2=linspace(-T/2+delta_t,T/2+delta_t,N);
St2=exp(j*pi*K*(t2-delta_t).^2);
Ht2=exp(-j*pi*K*(delta_t-t2).^2);
s_out2=ifftshift(ifft(fft(St2,N).*fft(Ht2,N),N));
NN=N+n;
for i=1:1:NN
    if i<= n
        s(i)=real(s_out(i));
    else
        if i>N
            s(i)=real(s_out2(i-n));
        else
            s(i)=real(s_out(i))+real(s_out2(i-n));
        end
    end
end
i=linspace(1,NN,NN);
switch ii
    case 1
        subplot(4,1,1);
        title('两个脉冲幅值相等，时延差为0.5*1/B');
        hold on;
    case 2
        subplot(4,1,2);
        title('两个脉冲幅值相等，时延差为1.0*1/B');
        hold on;
    case 3
        subplot(4,1,3);
        title('两个脉冲幅值相等，时延差为2.0*1/B');
        hold on;
    otherwise
        subplot(4,1,4);
        title('两个脉冲幅值相等，时延差为5.0*1/B');
        hold on;
end
ii=ii+1;
plot(i,s);
grid on;
axis([1,NN,-300,1000]);
xlabel('时间');
ylabel('幅值');
end