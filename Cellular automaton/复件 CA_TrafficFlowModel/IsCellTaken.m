function istaken = IsCellTaken(CellSpace,laneid,startTag,endTag)
%从startTag开始到endTag结束的这些元胞是否都是空闲，有一个及以上被占用返回1
for i = startTag:1:endTag
    if GetCellTakenState(CellSpace,laneid,i) == 1
        istaken = 1;
        return;
    end;
end;

istaken = 0;%这些元胞全部空闲

end