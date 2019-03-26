% MECS 4510 Assignment 2
% Symbolic Regression
% Hill Climbing

clear all 
close all 
clc

dataset = csvread('function1.csv');
x = dataset(:,1)';
y = dataset(:,2)';

tree = store_tree();
solution = find_solution(1, tree, x);
difference1 = find_diff(solution, y);
evals = zeros(1, 1000000);
d = zeros(1, 1000000);

for i = 1:1000000
    evals(i) = i;
    random = randi([1, 63]);
    tree_mut = mutation(random, tree);
    treemutate = mutate(tree_mut);
    s = find_solution(1, treemutate, x);
    difference = find_diff(s, y);
    if difference < difference1
        tree = treemutate;
        difference1 = difference;
        sf = s;
    end
    d(i) = difference1;
end
d_mean = d./1000;
e = evals(200:1000000);
di = d_mean(200:1000000);
figure()
plot(e, di)
xlabel('evaluations')
ylabel('fitness')
title('fitness vs evaluations')

figure()
plot(x,y)
hold on
plot(x,sf)
xlabel('x')
ylabel('y')
title('muatation')
legend('original', 'mutation')

