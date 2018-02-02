clc,clear
ob=VideoReader('test.avi')     %读取视频文件对象
get(ob) %获取视频对象的参数
n=ob.NumberOfFrame;  %获取视频的总帧数
for i=1:n
    a=read(ob,i); %读取视频对象的第i帧
    imshow(a)  %显示第i帧图像
    str=['source\',int2str(i),'.jpg']; %构造文件名的字符串，目录source要提前建好
    imwrite(a,str); %把第i帧保存到jpg文件
end
