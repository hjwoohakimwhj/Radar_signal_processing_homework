R0dB=50;%副瓣的增益是相对于主瓣-50dB
d=0.5;%阵元之间的间隔为半波长
n__=6;%对第六个零点控制
N=19;%共有19个阵元
x=2:1:178;%角度
r0=10^(R0dB/20); %副瓣电平要求20lgR0=20dB
A=(1/pi).*acosh(r0); 
n_=ceil(2*A^2+1/2);
if n_<n__;
n_=n__;
end

%求泰勒方向图函数各个根Xn
for n=1:1:n_-1;
Xn(n) = n_*sqrt((A^2+(n-1/2)^2)/(A^2+(n_-1/2)^2));
end
Xu=N*d*cos(x.*pi/180);
for n=1:1:n_-1;
Sx0(:,n)=1-((Xu.^2)./(Xn(n).^2));
end
Sx0_p=prod(Sx0');
for n=1:1:n_-1;
Sx1(:,n)=1-((Xu.^2)./(n.^2));
end
Sx1_p=prod(Sx1');
Sx=cosh(pi*A).*(((sin(pi*Xu).*Sx0_p)./((pi*Xu).*Sx1_p)));
Sx_max=max(Sx);
SxdB=20*log10((abs(Sx))/Sx_max);%归一化方向图
plot(x,SxdB);