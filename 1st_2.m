clear all;
clc;
Fs=45e6;
PRT=300e-6;
tt=100e-6;
N=Fs*PRT;%13500个点
index=linspace(1,N,N);

%参考信号
imported_data = importdata('C:\Users\Administrator\Desktop\B组data\b1.dat');
x=imported_data(:,1)';
y=imported_data(:,2)';
N_total = length(x);%135000个点，所以发送了10个脉冲
for z=1:1:N_total
    signal(z)=x(z)+1i*y(z);%取第二个参考信号脉冲
end
subplot(3,1,1);
plot(abs(signal));

imported_data_with_reflect = importdata('C:\Users\Administrator\Desktop\B组data\b1_back2.dat');
x_reflect=imported_data_with_reflect(:,1);
y_reflect=imported_data_with_reflect(:,2);
for z=1:1:N_total
      signal_reflect(z)=x_reflect(z)+1i*y_reflect(z);%取第二个参考信号的回波信号脉冲
end
subplot(3,1,2);
plot(abs(signal_reflect));

%有角反射的回波信号
imported_data_with_reflect_2 = importdata('C:\Users\Administrator\Desktop\B组data\b2_back2.dat');
x_reflect_2=imported_data_with_reflect_2(:,1);
y_reflect_2=imported_data_with_reflect_2(:,2);
for z=1:1:N_total
      signal_reflect_2(z)=x_reflect_2(z)+1i*y_reflect_2(z);%取第二个参考信号的回波信号脉冲
end
subplot(3,1,3);
plot(abs(signal_reflect_2));