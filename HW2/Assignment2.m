% MECS 4510 Assignment 2
% Symbolic Regression 
% Random Search
close all
clear
clc

dataset = csvread('function1.csv');
x = dataset(:,1)';
y = dataset(:,2)';
% tree1 = store_tree();
% % func = find_func(1, tree1)
% s1 = find_solution(1, tree1, x);
% difference1 = find_diff(s1, y);

% random search
new_tree = zeros(1, 63);
evals = zeros(1, 1000000);
d = zeros(1, 1000000);
difference1 = 1000000;
for i = 1:1000000
    evals(i) = i;
    tree = store_tree();
    s = find_solution(1, tree, x);
    difference = find_diff(s, y);
    if difference < difference1
        new_tree = tree;
        difference1 = difference;
        sf = s;
    end
    d(i) = difference1;
end
d_mean = d./1000;
% [M, I] = min(best_diff);
% final_tree = best_trees(I);
% sf = find_solution(1, final_tree, x)
% finalfunc = find_func(1, final_tree)
e = evals(200:1000000);
di = d_mean(200:1000000);
figure()
plot(e, di)
title('fitness vs evaluations')
xlabel('evaluations')
ylabel('fitness')
figure()
plot(x, sf,'b')
hold on
plot(x, y, 'r')
title('data vs rsbest')
xlabel('x')
ylabel('y')
legend('randomsearch', 'original')

