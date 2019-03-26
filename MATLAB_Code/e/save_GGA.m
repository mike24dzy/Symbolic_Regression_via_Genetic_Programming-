clear
clc
f1 = load('GGA1.mat');
x1 = f1.len0/1000;
f2 = load('GGA2.mat');
x2 = f2.len0/1000;
f3 = load('GGA3.mat');
x3 = f3.len0/1000;
f4 = load('GGA4.mat');
x4 = f4.len0/1000;
mean0 = mean([x1' x2' x3' x4'],2);
std0 = std([x1' x2' x3' x4'],0,2);
save('GGAdata.mat','mean0','std0')