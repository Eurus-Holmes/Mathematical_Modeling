function result = svmTest(svm, Xt, Yt, kertype)
temp = (svm.a'.*svm.Ysv)*kernel(svm.Xsv,svm.Xsv,kertype);
total_b = svm.Ysv-temp;
b = mean(total_b);
w = (svm.a'.*svm.Ysv)*kernel(svm.Xsv,Xt,kertype);
result.score = w + b;
Y = sign(w+b);
result.Y = Y;
result.accuracy = size(find(Y==Yt))/size(Yt);