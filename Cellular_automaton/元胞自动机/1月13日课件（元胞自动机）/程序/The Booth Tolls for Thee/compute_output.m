function count = compute_output(plaza)
count = 0;
[a, b] = size(plaza);
for j = 1:b
count = count + (plaza(a,j) > 0);
end