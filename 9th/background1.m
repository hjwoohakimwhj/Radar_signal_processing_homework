clear all;
clc;
fid = fopen('E:\Êý¾Ý½»¸¶°æ\SLC_data1.dat');
data = fread(fid,'float32');
data_total = zeros(1249,4096);
for c = 1:1:1249
    N_start=(c-1)*8192+1;
    N_end=c*8192;
    data1_tmp=data(N_start:2:N_end)+1j*data(N_start:2:N_end);
    data_total(c,:)=abs(data1_tmp');
end
x = [1:4096];
y = [1:1249];
[xx,yy]=meshgrid(1:4096,1:1249);
h=pcolor(xx,yy,data_total);
set(h,'edgecolor','none');
colorbar;
