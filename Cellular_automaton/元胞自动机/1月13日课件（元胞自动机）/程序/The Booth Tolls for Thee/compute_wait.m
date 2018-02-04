function time = compute_wait(plaza)
[a,b] = size(plaza);
time = 0;
for i = 1:a
for j = 1:b
time = time + (plaza(i,j) > 0);
end
end