% life.m - Conway's Game of Life
%
% A grid of dead and living cells is made.
% Cells are born to three adjacent parents,
% and die of overcrowding or loneliness.
%        Iain Haslam, December 2005
 
len=15; GRID=int8(rand(len,len));
up=[2:len 1]; down=[len 1:len-1]; %the world is round
%colormap(gray(2));
figure('position',[100,100, 400,400])
subplot('position',[0.05,0.05,0.9,0.9])
for i=1:50
    neighbours=GRID(up,:)+GRID(down,:)+GRID(:,up)+GRID(:,down)+...
        GRID(up,up)+GRID(up,down)+GRID(down,up)+GRID(down,down);
    GRID = neighbours==3 | GRID & neighbours==2;
    R=1-GRID;
    G=1-GRID;
    B=1-GRID;
    R(R==0)=0.3;
    G(G==0)=0.3;
    B(B==0)=0.3;
    
    image(cat(3,R,G, B)); 
    hold on
    for j = 0.5:15.5
    plot([0.5,15.5],[j,j],'k','linewidth',2);
    plot([j,j],[0.5,15.5],'k','linewidth',2);
    end
    axis image;
    axis off
    drawnow
end