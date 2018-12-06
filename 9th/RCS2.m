clear all;
clc;
fid = fopen('E:\数据交付版\SLC_data10.dat');
data = fread(fid,'float32');
fid2 = fopen('E:\数据交付版\SLC_data8.dat');
data2 = fread(fid2,'float32');
data2 = data2(1:2:end)+1i*data2(2:2:end);
data = data(1:2:end)+1i*data(2:2:end);
data = abs(data);
data2 = abs(data2);
for c = 1:1:1248  
    N_end=(c-1)*4096+323;
    data_tmp2=abs(data(N_end))-abs(data2(N_end));
    data_total_2(c) = abs(data_tmp2);
end
% 
% fid2 = fopen('E:\数据交付版\SLC_data3.dat');
% data2 = fread(fid2,'float32');
% data2 = data2(1:2:end)+1i*data2(2:2:end);
% data2 = abs(data2);
% for c = 1:1:1248  
%     N_start=(c-1)*4096+209;
%     N_end=(c-1)*4096+241;
%     data_tmp=data2(N_start);
%     data_tmp2=data2(N_end);
%     data_total_(c) = abs(data_tmp);
%     data_total_2_(c) = abs(data_tmp2);
% end
data_total_2 = 10*log10(data_total_2/max(data_total_2));

c=1:1:1248;
c=(c./2000.0)*200;
plot(c,data_total_2,'b');
axis tight;
%plot(c,data_total_2,'b');