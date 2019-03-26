% Symbloc Regression 
% Genetic Algorithm with variation

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
population = zeros(40, 63);
for i = 1:20
    population(i,:) = store_tree(); 
end 
best = zeros(1, 1000000);
for l = 1: 1000000
    total_fitness = zeros(1, 40);
    total_y = zeros(40,1000);
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
        population(19+2*j, :) = child1;
        population(20+2*j, :) = child2;
        yp1 = find_solution(1, parent1, x);
        dp1 = find_diff(yp1, y);
        yp2 = find_solution(1, parent2, x);
        dp2 = find_diff(yp2, y);
        yc1 = find_solution(1, child1, x);
        dc1 = find_diff(yc1, y);
        yc2 = find_solution(1, child2, x);
        dc2 = find_diff(yc2, y);
        total_fitness(1, 2*j-1) = dp1;
        total_fitness(1, 2*j) = dp2;
        total_fitness(1, 19+2*j) = dc1;
        total_fitness(1, 20+2*j) = dc2;
        total_y(2*j-1, :) = yp1;
        total_y(2*j, :) = yp2;
        total_y(19+2*j, :) = yc1;
        total_y(20+2*j, :) = yc2;
    end 
    [total_fitness, I] = sort(total_fitness);
    total_y = total_y(I', :);
    population = population(I', :);
    best(1, l) = total_fitness(1,1);
end 
final_function = population(1, :);
final_y = total_y(1, :);
best_mean = best/1000;
final_x = [1:1000000];

figure()
plot(final_x, -best_mean)
xlabel('evaluations')
ylabel('fitness')
title('GA varation Fitness vs. Evaluations')

figure()
plot(x,y,'r')
hold on
plot(x,final_y,'b')
xlabel('x')
ylabel('y')
title('Data Set vs. GA varaition')
legend('Original', 'GA variation')

toc
