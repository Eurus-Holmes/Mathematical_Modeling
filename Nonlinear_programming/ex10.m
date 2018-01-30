% .   P31    例3.14 .   利用梯度求解约束优化问题
options=optimset('GradObj','on','GradConstr','on');
[x,y]=fmincon(@fun10,rand(2,1),[],[],[],[],[],[],@fun11,options)