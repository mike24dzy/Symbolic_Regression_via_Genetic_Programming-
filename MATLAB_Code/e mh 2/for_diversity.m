clear
f1 = load('GGA1.mat')
a = f1.datal;
f = zeros(1,1000000);
count = 0;
y = 1:1000000;
for i = 1:19
    for j = i:20
        x = abs(a(i,:)-a(j,:));
        f = f+x;
    end
end
%plot(y,f(y))

plot(log10(y),log10(f(y)),'.')
xlabel('evaluation(1000000times in log)')
ylabel('diversity value in log')
title('Diversity in GGA')
grid on