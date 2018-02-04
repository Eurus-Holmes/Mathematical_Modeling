function plaza = move_forward(plaza)

[L, W] = size(plaza); %get its dimensions
prob = .7;
delay = 3;
%%DOWNSTREAM OF TOLL BOOTHS %%
for i = (L-1):-1:((L + 1)/2 + 1)
    for j = 1:W
        if plaza(i,j) == 1
            if plaza(i+1, j) ~= 0
                plaza(i,j) = -2;
            elseif prob >= rand
                plaza(i,j) = 0;
                plaza(i+1, j) = 1;
            end
        end
    end
end
%%AT TOLL BOOTHS %%
for i = (L+1)/2
    for j = 1:W
        if plaza(i,j) > 0
            if plaza(i,j) == delay
                plaza(i,j) = 0;
                plaza(i+1,j) = 1;
            else
                plaza(i,j) = plaza(i,j) + 1;
            end
        end
    end
end
%% UPSTREAM OF TOLL BOOTHS %%
for i = (L-1)/2:-1:1
    for j = 1:W
        if plaza(i,j) == 1
            if plaza(i+1, j) ~= 0
                plaza(i,j) = -2;
            elseif prob >= rand
                plaza(i,j) = 0;
                plaza(i+1, j) = 1;
            end
        end
    end
end