function tree = construct_tree() % define a function to assign random elements forming a tree
p1 = 0.5; % probability of assigning a operator
p2 = 0.7; % probability of assigning a variable x
operators = [1001 1002 1003 1004 1005 1006]; % all operators is assigned by a number
tree = zeros(1,63);  % 6 layers tree that has 63 elements 
for i = 1:63
    if i == 1 || i == 2 || i == 3  % make sure first 3 nodes are operators 
        random1 = randi([1, 6]);
        tree(i) = operators(random1);
    elseif rand(1) > p1 && i < 32
        random2 = randi([1, 6]);
        tree(i) = operators(random2);
    else 
        if rand(1) > p2
            tree(i) = 1000; % set x is represented by 1000
        else
            tree(i) = rand(1)*20-10;  % assign random numbers from -10 to 10 except 0 into the tree
        end 
    end
end
end