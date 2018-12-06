clear all;
clc;
T=1e-4;    %线性调频信号脉宽
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
d=0.15;
theta=0.005;
rt=zeros(200,6000);
t=linspace(-T/2,T/2,N);

%匹配滤波器
Ht=exp(-j*pi*K*t.^2);

for n=1:1:200
    R=R0-n*d*sin(theta)-n*PRT*c/2;
    tt=2*(R0-n*d*sin(theta))/c;
    St=exp(j*4*pi*R/lamda)*exp(j*pi*K*(t-tt).^2);
    s_out=ifft(fft(St).*fft(Ht));
    rt(n,:)=s_out;
end
figure(1);
[xx2,yy2]=meshgrid(1:6000,1:200);
h2=pcolor(xx2,yy2,abs(rt));
set(h2,'edgecolor','none');
colorbar;
figure(2);
rt2=zeros(200,6000);
for index=1:1:6000
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
[xx2,yy2]=meshgrid(1:6000,1:200);
h2=pcolor(xx2,yy2,abs(rt2));
set(h2,'edgecolor','none');
colorbar;
% subplot(2,1,1)
% plot(t*1e6,real(rt(5,:)));
% subplot(2,1,2);
% plot(t*1e6,real(rt(220,:)));
% subplot(2,1,1)
% plot(t*1e6,real(St));
% grid on;
% axis tight;
% subplot(2,1,2);
% freq=linspace(-Fs/2,Fs/2,N);
% plot(freq*1e-6,fftshift(abs(fft(St))));
% grid on;
% axis tight;
% s_out=ifft(fft(sr,512).*fft(h,512),512);