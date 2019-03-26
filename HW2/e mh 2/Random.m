clear
clc
tic
times = 1000000;
m = 1000;
data = csvread('function1.csv');
x0 = data(:,1)';
y0 = data(:,2)';
lenf = 10000000;
genef = zeros(1,63);
len0 = zeros(1,times);
dist0 = zeros(1,times);
for j = 1:times
    gene = make_gene();
    y = get_plot(1,gene,x0);
    len = get_fit(y,y0);
    dist0(j) = len;
    if len < lenf
        genef = gene;
        lenf = len
        yf = y;
    end
    len0(j) = lenf;
end

str = get_str(1,genef)
lenf
figure()
plot(x0,yf,'r-')
title('result plot')
hold on
plot(x0,y0,'b-')
figure()
plot(1:times,-len0)
xlabel('evaluation')
ylabel('fitness')
title('learning curve')
save('RD5.mat','len0','dist0','yf','genef','str')
toc

function gene = make_gene()
gene = zeros(1,63);
mark = [101 102 103 104 105 106];
prob1 = 0.5;
prob2 = 0.5;
for i = 1:63
    if i ==1 || i == 2 || i ==3
        r1 = randi([1,6]);
        gene(i) = mark(r1);
    elseif rand(1) > prob1 && i < 32
        r1 = randi([1,6]);
        gene(i) = mark(r1);
    else
        if rand(1) < prob2
            gene(i) = 100;
        else
            r2 = 0;
            while r2 ==0
                r2 = rand(1)*20-10;
            end
            gene(i) = r2;
        end
    end
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
elseif a == 5
    y = sin(get_plot(2*i,gene,x0));
elseif a == 6
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
