function [k z] = take(a, k, z, tree)
k = k + 1;
z(k) = a;
n = tree(a) - 1000;
if n > 0 && n < 5
    [k z] = take(2*a, k, z, tree);
    [k z] = take(2*a+1, k, z, tree);
elseif n > 4 && n < 7
    [k z] = take(2*a, k, z, tree);
end 
end