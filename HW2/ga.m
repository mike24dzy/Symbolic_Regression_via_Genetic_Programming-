% Symbloc Regression 
% Genetic Algorithm

clear all 
close all 
clc
tic
dataset = csvread('function1.csv');
x = dataset(:,1)';
y = dataset(:,2)';

% tree = store_tree();
% a = randi([1, 31]);
% j = 0;
% j = crossover(a,tree,j);
% z = zeros(1,j);
% k = 0;
% [k take_index] = take(a, k, z, tree);
% crosssection = tree(take_index);

% using deterministic crowding method to increase diversity
population = zeros(20, 63);
for i = 1:20
    population(i,:) = store_tree(); 
end 
best = zeros(1, 1000000);
all_fitness = zeros(20, 1000000);
for l = 1: 1000000
    total_fitness = zeros(1, 20);
    total_y = zeros(20,1000);
    for j = 1:10
        parent1 = population(2*j-1, :);
        parent2 = population(2*j, :);
        child1 = parent1;
        child2 = parent2;
        a = randi([1, 31]);
        r = randi([1, 63]);
        h = crossover(a, parent1, 0);
        z = zeros(1, h);
        [k take_index] = take(a, 0, z, parent1);
        child1(take_index) = parent2(take_index);
        child2(take_index) = parent1(take_index);
        child1 = mutation(r, child1);
        child2 = mutation(r, child2);
        pc = zeros(4, 63);
        pc(1,:) = parent1;
        pc(2,:) = parent2;
        pc(3,:) = child1;
        pc(4,:) = child2;
        fitness = zeros(4, 1);
        yplots = zeros(4, 1000);
        yp1 = find_solution(1, parent1, x);
        dp1 = find_diff(yp1, y);
        yp2 = find_solution(1, parent2, x);
        dp2 = find_diff(yp2, y);
        yc1 = find_solution(1, child1, x);
        dc1 = find_diff(yc1, y);
        yc2 = find_solution(1, child2, x);
        dc2 = find_diff(yc2, y);
        fitness(1,:) = dp1;
        fitness(2,:) = dp2;
        fitness(3,:) = dc1;
        fitness(4,:) = dc2;
        yplots(1,:) = yp1;
        yplots(2,:) = yp2;
        yplots(3,:) = yc1;
        yplots(4,:) = yc2;
        [fitness, I] = sort(fitness);
        pc = pc(I',:);
        yplots = yplots(I',:);
        new_parent1 = pc(1, :);
        new_parent2 = pc(2, :);
        total_fitness(1, 2*j-1) = fitness(1,1);
        total_fitness(1, 2*j) = fitness(2,1);
        total_y(2*j-1, :) = yplots(1, :);
        total_y(2*j, :) = yplots(2, :);
        population(2*j-1, :) = new_parent1;
        population(2*j, :) = new_parent2;
    end 
    all_fitness(:,l) = total_fitness';
    [total_fitness, I] = sort(total_fitness);
    total_y = total_y(I', :);
    best(1, l) = total_fitness(1,1);
end 
population = population(I', :);
final_function = population(1, :);
final_y = total_y(1, :);
best_mean = best/1000;
final_x = [1:1000000];

figure()
plot(final_x, -best_mean)
xlabel('evaluations')
ylabel('fitness')
title('GA Fitness vs. Evaluations')

figure()
plot(x,y,'r')
hold on
plot(x,final_y,'b')
xlabel('x')
ylabel('y')
title('Data Set vs. GA')
legend('Original', 'GA')

toc

% parent1 = store_tree();
% parent2 = store_tree();
% a = randi([1, 31]);
% j = crossover(a, parent1, 0);
% z = zeros(1, j);
% [k take_index] = take(a, 0, z, parent1);
% 
% child1 = parent1;
% child2 = parent2;
% branch1 = parent1(take_index);
% child2(take_index) = branch1;
% branch2 = parent2(take_index);
% child1(take_index) = branch2;
% yp1 = find_solution(1, parent1, x);
% dp1 = find_diff(yp1, y);
% yp2 = find_solution(1, parent2, x);
% dp2 = find_diff(yp2, y);
% yc1 = find_solution(1, child1, x);
% dc1 = find_diff(yc1, y);
% yc2 = find_solution(1, child2, x);
% dc2 = find_diff(yc2, y);
% bestpc = [dp1 dp2 dc1 dc2];
% bestpc1 = sort(bestpc);
% best1 = 
