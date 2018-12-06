clear all;
clc;
sita= -pi/2:0.001:pi/2;
N=8;

lamda=[0.2,0.24];
d=[0.1,0.15];
degree=[0,pi/6,pi/3];

%阵元间距为0.1m,波长为0.2m,每一列都是一个图形
for c=1:1:3
    beta_degree(:,c)=2*pi*d(1)*(sin(sita)-sin(degree(c)))/lamda(1);
end
z1_degree=N/2*beta_degree;
z2_degree=1/2*beta_degree;
f_degree=sin(z1_degree)./(N*sin(z2_degree));

%阵元间距为0.1m,角度为30度
for c=1:1:2
    beta_lamda(:,c)=2*pi*d(1)*(sin(sita)-sin(degree(2)))/lamda(c);
end
z1_lamda=N/2*beta_lamda;
z2_lamda=1/2*beta_lamda;
f_lamda=sin(z1_lamda)./(N*sin(z2_lamda));

%阵元间距为0.1m,角度为30度
for c=1:1:2
    beta_d(:,c)=2*pi*d(c)*(sin(sita)-sin(degree(2)))/lamda(1);
end
z1_d=N/2*beta_d;
z2_d=1/2*beta_d;
f_d=sin(z1_d)./(N*sin(z2_d));

figure(1);
% polar(sita,10*log10(abs(f1)),'--r',sita,10*log10(abs(f1)),'--g');
plot(sita/pi*180,10*log10(abs(f_degree(:,1)')),'r','Linewidth',1.5);
hold on;
plot(sita/pi*180,10*log10(abs(f_degree(:,2)')),'y','Linewidth',1.5);
hold on;
plot(sita/pi*180,10*log10(abs(f_degree(:,3)')),'b','Linewidth',1.5);
axis tight;
title('阵列天线方向图 d=0.1m lamda=0.2m');
xlabel('theta °');
ylabel('amplitude (dB)');
legend('degree=0°','degree=30°','degree=60°');

figure(2);
% polar(sita,10*log10(abs(f1)),'--r',sita,10*log10(abs(f1)),'--g');
plot(sita/pi*180,10*log10(abs(f_lamda(:,1)')),'r','Linewidth',1.5);
hold on;
plot(sita/pi*180,10*log10(abs(f_lamda(:,2)')),'b','Linewidth',1.5);
axis tight;
title('阵列天线方向图 degree=30°d=0.1m');
xlabel('theta °');
ylabel('amplitude (dB)');
legend('lamda=0.2m','lamda=0.24m');

figure(3);
% polar(sita,10*log10(abs(f1)),'--r',sita,10*log10(abs(f1)),'--g');
plot(sita/pi*180,10*log10(abs(f_d(:,1)')),'r','Linewidth',1.5);
hold on;
plot(sita/pi*180,10*log10(abs(f_d(:,2)')),'b','Linewidth',1.5);
axis tight;
title('阵列天线方向图 degree=30°lamda=0.2m');
xlabel('theta °');
ylabel('amplitude (dB)');
legend('d=0.1m','d=0.15m');