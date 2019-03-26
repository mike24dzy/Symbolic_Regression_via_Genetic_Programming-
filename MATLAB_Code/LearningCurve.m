clear
clc
x = 1000:1000000;
y = 100000:100000:1000000;
z = 150000:100000:950000;
f1 = load('RS.mat');
x1 = f1.d_mean;
f2 = load('HC.mat');
x2 = f2.d_mean;
f3 = load('GA2.mat');
x3 = f3.best_mean;
f4 = load('GGGGGGGGGG.mat');
x4 = f4.best_mean;

std = load('this_is_std.mat');
s1 = std.a;
s2 = std.b;
s3 = std.c;
s4 = std.d;
xlabel('Evaluation')
ylabel('Fitness(MAE)')
title('Learning Curve for Symbolic Regression')
hold on
p1 = plot(x,x1(x))
p2 = plot(x,x2(x))
p3 = plot(x,x3(x))
p4 = plot(x,x4(x))
p5 = errorbar(y,x1(y),s1,'.b')
p6 = errorbar(y,x2(y),s2,'.r')
p7 = errorbar(y,x3(y),s3,'.k')
p8 = errorbar(y,x4(y),s4,'.g')
ylim = ([-0.01 0.25]);
grid on
legend([p1 p2 p3 p4],{'Random Search','Hillclimber','GA','GA with Variation'})

%% 
dot = load('GA1.mat');
x = 3000:1000000;
y = dot.all_fitness;
plot(x, y(:,x)./1000, '.')
xlabel('Evaluations')
ylabel('Fitness')
title('Dot Plot for GA Variation')

%% 
p = load('GA1.mat');
x = p.x;
y = p.y;
yp = p.final_y;
figure()
plot(x,y,'r')
hold on
plot(x,yp,'.')
xlabel('x')
ylabel('y')
title('Original Data vs. Best Fitted Found via GA Variation')
legend('Original','GA with Variation')

%%
clear
a = 1:1000000;
b = 100000:200000:900000;
c = 150000:200000:950000;
f1 = load('GA2.mat');
x1 = f1.all_fitness;
f2 = load('GA1.mat');
x2 = f2.all_fitness;
n = 5
x1 = sum(x1 < n)./20;
x2 = sum(x2 < n)./20;
hold on 
p1 = plot(a,x1);
p2 = plot(a,x2);
xlabel('Evaluation')
ylabel('convergence')
title('Convergence (for mae below 0.005)')
legend([p1 p2],{'GA','GA with Variation'})

%%
f = load('RS.mat');
x = f.x;
y = f.sf;
