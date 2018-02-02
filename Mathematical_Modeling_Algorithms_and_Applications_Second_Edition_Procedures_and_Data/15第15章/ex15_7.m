clc, clear
M=600; N=420; p=200; q=2282;
eq=@(x) x^M-(1+q/p)*x^(M-N)+q/p;
x=fzero(eq,[1.0001,1.5]) 
