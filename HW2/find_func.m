function func = find_func(h, tree)
g = tree(h) - 1000;
if g == 0 
    func = string('x');
elseif g == 1
    func = join([string('(') find_func(2*h, tree) string(')+(') find_func(2*h+1, tree) string(')')]);
elseif g == 2
    func = join([string('(') find_func(2*h, tree) string(')-(') find_func(2*h+1, tree) string(')')]);
elseif g == 3
    func = join([string('(') find_func(2*h, tree) string(')*(') find_func(2*h+1, tree) string(')')]);
elseif g == 4
    func = join([string('(') find_func(2*h, tree) string(')/(') find_func(2*h+1, tree) string(')')]);
elseif g == 5
    func = join([string('sin(') find_func(2*h, tree) string(')')]);
elseif g == 6
    func = join([string('cos(') find_func(2*h, tree) string(')')]);
else
    func = string(tree(h));
end 
end