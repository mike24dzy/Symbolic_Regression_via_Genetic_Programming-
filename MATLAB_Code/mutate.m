function treemutate = mutate(tree)
flag1 = 0;
flag2 = 0;
flag3 = 0;
treemutate = tree;
while flag1 == 0 || flag2 == 0 || flag3 == 0
    r1 = randi([1, 31]);
    r2 = randi([1, 31]);
    r3 = randi([4, 63]);
    r4 = randi([4, 63]);
    r5 = randi([4, 63]);
    r6 = randi([4, 63]);
    if tree(r3) < 1000 && tree(r4) < 1000 && flag1 == 0
        treemutate(r3) = rand(1)*20-10;
        treemutate(r4) = rand(1)*20-10;
        flag1 = 1;
%         disp('r3 is ')
%         disp(r3)
%         disp('r4 is ')
%         disp(r4)
    end
    if tree(r5) < 1000 && tree(r6) == 1000 && flag3 == 0
        treemutate([r5 r6]) = treemutate([r6 r5]);
        flag3 = 1;
%         disp('r5 is ')
%         disp(r5)
%         disp('r6 is ')
%         disp(r6)
    end
    if (tree(r1)-1000 == 1 || tree(r1)-1000 == 2 || tree(r1) == 3 || tree(r1)-1000 == 4 || tree(r1)-1000 == 5 || tree(r1)-1000 == 6) && flag2 == 0
        if tree(r2)-1000 == 1 || tree(r2)-1000 == 2 || tree(r2) == 3 || tree(r2)-1000 == 4 || tree(r2)-1000 == 5 || tree(r2)-1000 == 6
            treemutate([r1 r2]) = treemutate([r2 r1]);
            flag2 = 1;
%             disp('r1 is ')
%             disp(r1)
%             disp('r2 is ')
%             disp(r2)
        end
    end
end
end