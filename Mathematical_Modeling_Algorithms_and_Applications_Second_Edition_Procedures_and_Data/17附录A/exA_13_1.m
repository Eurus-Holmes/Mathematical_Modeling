syms x
dy=diff(log((x+2)/(1-x)),3);
dy=simplify(dy)  %对符号函数进行化简
pretty(dy)     %分数线居中显示
