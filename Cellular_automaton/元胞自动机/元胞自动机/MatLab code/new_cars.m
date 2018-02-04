function plaza = new_cars(plaza, entry)

if entry > 0 
    % Find the empty lanes of the entrance where a new car can be add.
    unoccupied = find( plaza(1,:) == 0 );
    n = length(unoccupied); % number of available lanes
    x = randperm(n);
    for i = 1:min(entry,n)
         plaza(1, unoccupied(x(i)) ) = 1;
    end
end