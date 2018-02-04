function plaza = switch_lanes(plaza)
prob = 0.8;
[L,W] = size(plaza);
for i = (L-1):-1:1
    for j = 2:(W-1)
        if plaza(i,j) == -2
            if rand < prob %chance turn will be made
                if rand > 0.5 %will attempt left
                    if plaza(i, j-1) == 0 
                        plaza(i, j-1) = 1;
                        plaza(i, j) = 0;
                    elseif plaza(i, j+1) == 0
                        plaza(i, j+1) = 1;
                        plaza(i,j) = 0;
                    else
                        plaza(i,j) = 1;
                    end
                else %will attempt right
                    if plaza(i, j+1) == 0
                        plaza(i,j+1) = 1;
                        plaza(i,j) = 0;
                    elseif plaza(i, j-1) == 0
                        plaza(i, j-1) = 1;
                        plaza(i,j) = 0;
                    else
                        plaza(i,j) = 1;
                    end
                end
            else
                plaza(i,j) = 1;
            end
        end
    end
end