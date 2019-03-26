function s = find_solution(z, tree, x)
n = tree(z) - 1000;
if n == 0
    s = x;
elseif n == 1
    s = find_solution(2*z, tree, x) + find_solution(2*z+1, tree, x);
elseif n == 2
    s = find_solution(2*z, tree, x) - find_solution(2*z+1, tree, x);
elseif n == 3
    s = find_solution(2*z, tree, x) .* find_solution(2*z+1, tree, x); 
elseif n == 4 
    s = find_solution(2*z, tree, x) ./ find_solution(2*z+1, tree, x); 
elseif n == 5
    s = sin(find_solution(2*z, tree, x));
elseif n == 6
    s = cos(find_solution(2*z, tree, x));
else 
    s = tree(z)*ones(1,1000);
end 
end 