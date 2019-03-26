clear all
close all 
clc

a = 1:1000000;
f1 = load('GA1.mat');
x1 = f1.all_fitness;
n = 5;
x1 = sum(x1 < n)./20;
hold on 
grid on
p1 = plot(a,x1);
xlabel('Evaluation')
ylabel('Convergence')
title('Convergence (% for mae below 0.005) for GA Variation')