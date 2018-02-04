function h = show_plaza(plaza, B, h)
[L, W] = size(plaza); %get its dimensions
temp = plaza;
temp(temp==1) = 0;

PLAZA(:,:,1) = plaza;
PLAZA(:,:,2) = plaza;
PLAZA(:,:,3) = temp;

PLAZA = 1-PLAZA;
PLAZA(PLAZA>=888)=0.3;

for i = (L+1)/2
    for j = ceil(W/2)-ceil(B/2)+1:ceil(W/2)+floor(B/2)
        if plaza(i,j) == 0;
            PLAZA(i,j,1) =0;
            PLAZA(i,j,2) =1;
            PLAZA(i,j,3) =0;
        else
            PLAZA(i,j,1) =1;
            PLAZA(i,j,2) =0;
            PLAZA(i,j,3) =0;
        end
    end
end

if ishandle(h)
    set(h,'CData',PLAZA)
else
    figure('position',[20,50,200,700])
    h = imagesc(PLAZA);    
    hold on
    plot([[0:W]',[0:W]']+0.5,[0,L]+0.5,'k')
    plot([0,W]+0.5,[[0:L]',[0:L]']+0.5,'k')
    axis image
    set(gca,'xtick',[]);
    set(gca,'ytick',[]);
end