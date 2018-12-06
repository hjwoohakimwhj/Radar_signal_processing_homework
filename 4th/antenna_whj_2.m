Pt=4e4;%4KW
lamda=0.15;%s波段
Ae=7.3*1.52;
F=10^(0.13)%噪声系数1.3dB
SNR_min=10^(1.3);%最小可接受信噪比
B=1e5;%带宽100KHz
k=1.38e-23;
G=4*pi*Ae/(lamda^2);
T=300;%23度
LS=10^(1.5);%15dB损耗
SNR_min_none=SNR_min*LS;
SNR_100=SNR_min_none/100;
SNR_1000=SNR_min_none/1000;
for i=1:1:8
    theta(i)=i;
    R(i)=(Pt*G*G*lamda*lamda*theta(i)/(SNR_min_none*(4*pi)^3*F*k*T*B))^(0.25)/1000;%取公里
    R100(i)=(Pt*G*G*lamda*lamda*theta(i)/(SNR_100*(4*pi)^3*F*k*T*B))^(0.25)/1000;%取公里
    R1000(i)=(Pt*G*G*lamda*lamda*theta(i)/(SNR_1000*(4*pi)^3*F*k*T*B))^(0.25)/1000;%取公里
end
plot(theta,R,'r','LineWidth',2);
hold on;
plot(theta,R100,'b','LineWidth',2);
hold on;
plot(theta,R1000,'g','LineWidth',2);
hold on;
legend('无脉冲积累','采样率10kHz','采样率100kHz');
%加网格
grid on;
xlabel('RCS (m^2)');
ylabel('Rmax km');