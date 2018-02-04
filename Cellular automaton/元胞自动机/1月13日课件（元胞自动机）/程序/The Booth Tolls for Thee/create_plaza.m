function plaza = create_plaza(B, L)
global plazalength;
topgap = 5;
bottomgap = 1;
plaza = zeros(plazalength,B+2);
if mod(B-L,2)==0
for row = 1:plazalength
plaza(row,1) = -888;
plaza(row,2+B) = -888;
end
for col = 2:B/2 - L/2 + 1
for row = 1:(plazalength-1)/2 - topgap * (col-1)
plaza(row,col) = -888;
plaza(row,B+3-col) = -888;
end
end
for col = 2:B/2 - L/2 + 1
for row = (plazalength+3)/2 + bottomgap*(col-1):plazalength
plaza(row,col) = -888;
plaza(row,B+3-col) = -888;
end
end
else
for row = 1:plazalength
plaza(row,1) = -888;
plaza(row,3+B) = -888;
end
for col = 2:(B+1)/2 - L/2 + 1
for row = 1:(plazalength-1)/2 - topgap * (col-1)
plaza(row,col) = -888;
plaza(row,B+4-col) = -888;
end
end
for col = 2:(B+1)/2 - L/2 + 1
for row = (plazalength+3)/2 + bottomgap*(col-1):plazalength
plaza(row,col) = -888;
plaza(row,B+4-col) = -888;
end
end
for row = 1:plazalength
plaza(row,2+B) = -888;
end
end