clear
clc
x = 500:1000000;
y = 100000:100000:1000000;
z = 150000:100000:950000;
f1 = load('RDdata.mat');
x1 = f1.mean0;
s1 = f1.std0;
f2 = load('CLdata.mat');
x2 = f2.mean0;
s2 = f2.std0;
f3 = load('GAdata.mat');
x3 = f3.mean0;
s3 = f3.std0;
f4 = load('GGAdata.mat');
x4 = f4.mean0;
s4 = f4.std0;
xlabel('evaluation')
ylabel('best fitness')
title('LEARNING CURVE')
hold on
p1 = plot(x,x1(x))
p2 = plot(x,x2(x))
p3 = plot(x,x3(x))
p4 = plot(x,x4(x))
p5 = errorbar(y,x1(y),s1(y),'.k')
p6 = errorbar(z,x2(z),s2(z),'.k')
p7 = errorbar(y,x3(y),s3(y),'.k')
p8 = errorbar(z,x4(z),s4(z),'.k')
ylim = ([-0.01 0.25]);
grid on
legend([p1 p2 p3 p4],{'Random','Hillclimber','GA','GGA'})