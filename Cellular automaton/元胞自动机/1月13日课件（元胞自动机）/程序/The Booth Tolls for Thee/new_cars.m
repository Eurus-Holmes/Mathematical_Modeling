function new = new_cars(B, L, old, entry)
new = old;
if entry > 0
if entry <= L
x = randperm(L);
y = ceil((B-L)/2+1);
for i = 1:entry
new(1, (y + x(i))) = 1;
end
end
if entry > L
y = ceil((B-L)/2+1);
for i = 1:L
new(1,(y + i)) = 1;
end
end
end