function j = crossover(a,tree,j)
j = j + 1;
n = tree(a) - 1000;
if n>0 && n<5
    j = crossover(2*a,tree,j);
    j = crossover(2*a+1,tree,j);
elseif n>4 && n<7
    j = crossover(2*a,tree,j);
end
end
