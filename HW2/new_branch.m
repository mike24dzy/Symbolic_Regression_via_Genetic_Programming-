function branch = new_branch(i)
operators = [1001:1006];
p1 = 0.5;
p2 = 0.5;
if i == 1 
    random1 = randi([1,6]);
    branch = operators(random1);
elseif rand(1) > p1 && i < 32
    random2 = randi([1,6]);
    branch = operators(random2);
else
    if rand(1) > p2
        branch = 1000;
    else 
        branch = rand(1)*20-10;
    end
end
end
    
