clear all;
clc;
fid = fopen('E:\数据交付版\SLC_data10.dat');
data = fread(fid,'float32');
fid2 = fopen('E:\数据交付版\SLC_data8.dat');
data2 = fread(fid2,'float32');
data_total = zeros(1000,2048);
for c = 1:1:1249
    N_start=(c-1)*8192+1;
    N_end=c*8192-4096;
    data1_tmp=data(N_start:2:N_end)+1j*data(N_start:2:N_end);
    data2_tmp=data2(N_start:2:N_end)+1j*data2(N_start:2:N_end);
    data_tmp=abs(data2_tmp)-abs(data1_tmp);
    data_total(c,:)=abs(data_tmp');
end
x = [1:2048];
y = [1:1249];
[xx,yy]=meshgrid(1:2048,1:1249);
h=pcolor(xx,yy,data_total);
set(h,'edgecolor','none');
colorbar;
