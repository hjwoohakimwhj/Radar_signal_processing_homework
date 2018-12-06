clear all;
clc;
T=10e-6;    %线性调频信号脉宽
B=30e6;     %线性调频信号带宽
K=B/T;      %调频率
Fs=2*B;     %采样率满足奈奎斯特定理
Ts=1/Fs;    %采样间隔
N=T/Ts;     %采样点数
t=linspace(-T/2,T/2,N);
St=exp(j*pi*K*t.^2);
G=1.6450;
counter=0;
counter2=0;
%噪声每次产生的值都不一样，我们进行1000次模拟
for i=1:1:1000
    x=wgn(1,N,0);
    dp = dot(St,x);%信噪比为1
    if abs(dp)<G
        counter=counter+1;
    end
    Rt=0.01*St+x;
    dp2 = dot(St,Rt);
    if abs(dp2)>G
        counter2=counter2+1;
    end
end
Pfa=counter/1000.0
Pd=counter2/1000.0
%plot(t,real(r));
%axis tight;