function plaza = create_plaza(B, L)
global plazalength;
topgap = 5;
bottomgap = 1;
plaza = zeros(plazalength,B+2);
plaza(1:plazalength,[1,2+B]) = -888;
if mod(B-L,2)==0 
    for col = 2:B/2 - L/2 + 1
        for row = 1:(plazalength-1)/2 - topgap * (col-1)
            plaza(row,[col, B+3-col]) = -888;
        end
        for row = (plazalength+3)/2 + bottomgap*(col-1):plazalength
            plaza(row,[col, B+3-col]) = -888;
        end
    end
else
    plaza(1:plazalength, B+3) = -888;
    for col = 2:(B+1)/2 - L/2 + 1
        for row = 1:(plazalength-1)/2 - topgap * (col-1)
            plaza(row, [col, B+4-col]) = -888;
        end
        for row = (plazalength+3)/2 + bottomgap*(col-1):plazalength
            plaza(row, [col, B+4-col]) = -888;
        end
    end
end