function difference = find_diff(s, y)
difference = abs(s - y);
difference = sum(difference);
difference = min(difference, 1000000);
end