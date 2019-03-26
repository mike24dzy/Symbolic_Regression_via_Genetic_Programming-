clear
clc
tic
times = 50000;
group = 20;
data = csvread('function1.csv');
x0 = data(:,1)';
y0 = data(:,2)';
gene = zeros(group,64);
len0 = zeros(1,times);
for i = 1:group
    gene(i,1:63) = make_gene();
    y = get_plot(1,gene(i,1:63),x0);
    gene(i,64) = get_fit(y,y0);
end
for i = 1:times
    i
    for j = 1:group/2
        r1 = 2*j-1;
        r2 = 2*j;
        r = randi([1,63]);
        [p1 p2] = crossover(gene(r1,:),gene(r2,:),r);
        r = randi([1,63]);
        c1 = zeros(1,64);
        c2 = c1;
        c1(1:63)= mutation(p1(1:63),r);
        y1 = get_plot(1,c1(1:63),x0);
        c1(1,64) = get_fit(y1,y0);
        r = randi([1,63]);
        c2(1:63)= mutation(p2(1:63),r);
        y2 = get_plot(1,c2(1:63),x0);
        c2(1,64) = get_fit(y2,y0);
        [best1 best2] = tournament(c1,c2,gene(r1,:),gene(r2,:));
        gene(r1,:) = best1;
        gene(r2,:) = best2;
    end
    [gene,argsort0] = sortrows(gene,64,'ascend');
    genef = gene(1,1:63);
    lenf = gene(1,64);
    len0(i) = lenf;
end
size(gene)
str = get_str(1,genef)
yf = get_plot(1,genef,x0);
lenf
figure()
plot(x0,yf,'r-')
hold on
plot(x0,y0,'b-')
title('plot')
figure()
plot(1:times,-len0)
xlabel('evaluation')
ylabel('fitness')
title('learning curve')
toc
function [best1 best2] = tournament(c1,c2,p1,p2)
league = [c1;c2;p1;p2];
[league,argsort0] = sortrows(league,64,'ascend');
best1 = league(1,:);
best2 = league(2,:);
end

function gene = make_gene()
gene = zeros(1,63);
mark = [101 102 103 104 105 106 107 108];
prob1 = 0.5;
prob2 = 0.5;
for i = 1:63
    gene(i) = change(gene,i);
end
end

function y = get_plot(i,gene,x0)
m = 1000;
a = gene(i)-100;
if a == 0
    y = x0;
elseif a == 1
    y = get_plot(2*i,gene,x0) + get_plot(2*i+1,gene,x0);
elseif a == 2
    y = get_plot(2*i,gene,x0) - get_plot(2*i+1,gene,x0);
elseif a == 3
    y = get_plot(2*i,gene,x0) .* get_plot(2*i+1,gene,x0);
elseif a == 4
    y = get_plot(2*i,gene,x0) ./ get_plot(2*i+1,gene,x0);
elseif a == 5 || a == 7
    y = sin(get_plot(2*i,gene,x0));
elseif a == 6 || a == 8
    y = cos(get_plot(2*i,gene,x0));
else
    y = gene(i)*ones(1,m);
end
end

function str = get_str(i,gene)
a = gene(i)-100;
if a == 0
    str = "X";
elseif a == 1
    str = join(["(" get_str(2*i,gene) ")+(" get_str(2*i+1,gene) ")"]);
elseif a == 2
    str = join(["(" get_str(2*i,gene) ")-(" get_str(2*i+1,gene) ")"]);
elseif a == 3
    str = join(["(" get_str(2*i,gene) ")*(" get_str(2*i+1,gene) ")"]);
elseif a == 4
    str = join(["(" get_str(2*i,gene) ")/(" get_str(2*i+1,gene) ")"]);
elseif a == 5
    str = join(["sin(" get_str(2*i,gene) ")"]);
elseif a == 6
    str = join(["cos(" get_str(2*i,gene) ")"]);
else
    str = string(gene(i));
end
end

function len = get_fit(y,y0) 
len = abs(y-y0);
len = sum(len);
len = min(len,1000000);
end
function [g1 g2] = crossover(g1,g2,i)
[g1 g2] = exchange(g1,g2,i);
if i < 32
    [g1 g2] = crossover(g1,g2,2*i);
    [g1 g2] = crossover(g1,g2,2*i+1);
end
end
function gene = mutation(gene,i)
gene(i) = change(gene,i);
if i < 32
    gene = mutation(gene, 2*i);
    gene = mutation(gene, 2*i+1);
end
end

function a = change(gene,i)
if i ==1
    r1 = randi([1,8]);
    a = randi([101,106]);
elseif rand(1) > 0.5 && i < 32
     r1 = randi([1,8]);
     a = randi([101,106]);
else
     if rand(1) < 0.5
         a = 100;
     else
         r2 = 0;
         while r2 ==0
             r2 = rand(1)*20-10;
         end
         a = r2;
     end
end
end
function [g1 g2] = exchange(g1,g2,i)
b = g1(i);
g1(i) = g2(i);
g2(i) = b;
end