clear all;
clc;
T=1e-5;    %线性调频信号脉宽
PRT=0.001;
B=30e6;     %线性调频信号带宽
K=B/T;      %调频率
Fs=2*B;     %采样率满足奈奎斯特定理
Ts=1/Fs;    %采样间隔
N=T/Ts;     %采样点数
f0=10e9;
c=3.0e8;
lamda=c/f0;
R0=10e3;
R0_1=10e3;
R0_2=10.04e3;
d=0.75;
theta=0.007;
theta_1=0.003;
theta_2=0.003;
rt=zeros(2000,600);
t=linspace(-T/2,T/2,N);

%匹配滤波器
Ht=exp(-j*pi*K*t.^2);

for n=1:1:2000
    R=R0-n*d*sin(theta);
    tt=2*R/c;
    R_1=R0_1-n*d*sin(theta_1);
    tt_1=2*(R0_1-n*d*sin(theta_1))/c;
    R_2=R0_2-n*d*sin(theta_2);
    tt_2=2*(R0_2-n*d*sin(theta_2))/c;

    
     St1(n,:)=exp(-j*4*pi*R/lamda)*exp(j*pi*K*(t-tt).^2);
     St1_1(n,:)=exp(-j*4*pi*R_1/lamda)*exp(j*pi*K*(t-tt_1).^2);
     St1_2(n,:)=exp(-j*4*pi*R_2/lamda)*exp(j*pi*K*(t-tt_2).^2);
    
    St=St1(n,:)+St1_1(n,:)+St1_2(n,:);
    s_out=ifft(fft(St).*fft(Ht));
    rt(n,:)=s_out;
    %rt(n,:)=St1;
end
figure(1);
[xx1,yy1]=meshgrid(1:600,1:2000);
h1=pcolor(xx1,yy1,abs(rt));
set(h1,'edgecolor','none');
colorbar;
figure(2);
for index=1:1:600
%     n=index-113;
%     R=R0-n*d*sin(theta);
%     R1=2*R/c;
%     R2=2*R0/c;
%     St=exp(j*4*pi*R/lamda)*exp(j*pi*K*(t-R2).^2);
%     s_out=fftshift(ifft(fft(St).*fft(Ht)));
%     rt(index,:)=s_out;
%     
    St=rt(:,index);
    s_out=fft(St');
    rt2(:,index)=s_out;
end
[xx2,yy2]=meshgrid(1:600,1:2000);
h2=pcolor(xx2,yy2,abs(rt2));
set(h2,'edgecolor','none');
colorbar;