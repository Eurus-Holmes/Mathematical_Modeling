clear all;
W = 0;
for j = 6
    B = 6+j; %number booths
    L = 6; %number lanes in highway before and after plaza
    T = 24; % # hrs to simulate
    global plazalength;
    plazalength = 101;
    plaza = create_plaza(B,L);
    %====================================================
    h = show_plaza(plaza,B,NaN);                        %    
    %====================================================
    entry_vector = create_entry(T,L);
    waiting_time = 0;
    output = 0;
    for i = 1:T*1440
        plaza = move_forward(plaza); %move cars forward
        plaza = new_cars(plaza, entry_vector(i)); %allow new cars to enter
        plaza = switch_lanes(plaza); %allow lane changes
        %compute waiting time during timestep i
        waiting_time = waiting_time + compute_wait(plaza); 
        output = output + compute_output(plaza);
        %===============================================
        h = show_plaza(plaza,B,h);                     %
        drawnow 
        %===============================================
        plaza = clear_boundary(plaza);
    end
    show_plaza(plaza,B,h); 
    W(j+1) = waiting_time/output;
    xlabel({strcat('B = ',num2str(B)), ...
    strcat('mean cost time = ', num2str(round(W(j+1))))})
end
