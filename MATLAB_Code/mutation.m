function tree = mutation(i, tree)
tree(i) = new_branch(i);
if i < 32
    tree = mutation(2*i, tree);
    tree = mutation(2*i+1, tree);
end 
end

    