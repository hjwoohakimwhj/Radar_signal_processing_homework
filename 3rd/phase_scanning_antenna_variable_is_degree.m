%使屏幕最大化，避免天线方向图过小，看不清楚
scrsz = get(0,'ScreenSize');
set(gcf,'Position',scrsz);

%边射天线，偏移角为60度
a=linspace(0,2*pi);  
f1=sin((cos(a)-0.5)*(10/2)*4/3*pi)./(sin((cos(a)-0.5)*(pi/2)*4/3)*10);
subplot(4,2,1);
polar(a,abs(f1)); 
title('10元端射式天线H面，d=波长*2/3,扫描角60°');
grid on;
subplot(4,2,2);
plot(180.*a/pi,abs(f1));
axis([0 360 0 1]);
grid on;



a=linspace(0,2*pi);  
f1=sin((cos(a)-cosd(45))*(10/2)*pi*4/3)./(sin((cos(a)-cosd(45))*(pi/2)*4/3)*10);
subplot(4,2,3);
polar(a,abs(f1)); 
title('10元端射式天线H面，d=波长*2/3，扫描角45°');
grid on;
subplot(4,2,4);
plot(180.*a/pi,abs(f1));
axis([0 360 0 1]);
grid on;

a=linspace(0,2*pi);  
f1=sin((cos(a)-cosd(30))*(10/2)*pi*4/3)./(sin((cos(a)-cosd(30))*(pi/2)*4/3)*10);
subplot(4,2,5);
polar(a,abs(f1)); 
title('10元端射式天线H面，d=波长*2/3，扫描角30°');
grid on;
subplot(4,2,6);
plot(180.*a/pi,abs(f1));
axis([0 360 0 1]);
grid on;

a=linspace(0,2*pi);  
f1=sin((cos(a)-cosd(15))*(10/2)*pi*4/3)./(sin((cos(a)-cosd(15))*(pi/2)*4/3)*10);
subplot(4,2,7);
polar(a,abs(f1)); 
title('10元端射式天线H面，d=波长*2/3，扫描角15°');
grid on;
subplot(4,2,8);
plot(180.*a/pi,abs(f1));
axis([0 360 0 1]);
grid on;