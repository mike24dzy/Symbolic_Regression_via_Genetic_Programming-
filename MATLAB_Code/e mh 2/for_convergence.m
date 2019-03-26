clear
a = 1:1000000;
b = 100000:200000:900000;
c = 150000:200000:950000;
f1 = load('GA1.mat');
x1 = f1.datal;
f2 = load('GA2.mat');
x2 = f2.datal;
n = 5
x1 = sum(x1 < n)./20;
x2 = sum(x2 < n)./20;
hold on 
p1 = plot(a,mean1(a));
p2 = plot(a,mean2(a),'r');
p3 = errorbar(b,mean1(b),std1(b),'.k')
p4 = errorbar(c,mean2(c),std2(c),'.k')
xlabel('evaluations')
ylabel('convergence(%)')
title('Convergence plot(set 0.01 as standard)')
legend([p1 p2],{'GA','GGA'})