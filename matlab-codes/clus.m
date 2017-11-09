close all;
clear all;
clc;

t=xlsread('tickervalue.xls');

pos=t;

c = clusterdata(pos(:,1:2),'maxclust',2); 
pos((find(c==1)),:)=[];

clear c;

for i=1:size(pos,1)
    x_first=99999;
    frame_num=pos(i,3);
    l_image=imread(['C:\Users\user1\Desktop\pjct\laplacian\i (' int2str(frame_num) ').jpg']);
    for k=1:size(l_image,2)
        for j=pos(i,1):pos(i,2)
            if l_image(j,k)==1 && k<x_first
              x_first=k;
              break;
            end
        end
    end
x_last=0;
    for j=pos(i,1):pos(i,2)
        for k=(size(l_image,2)):-1:1        
            if l_image(j,k)==1 && k>x_last
              x_last=k;
              break;
            end
        end
    end
    
    ticker_dist=x_last-x_first;
    if ticker_dist>0.7*size(l_image,2)
        pos(i,4)=ticker_dist;
        pos(i,5)=x_first;
        pos(i,6)=x_last;
        c(i)=1;
    else
        c(i)=0;
    end
end
pos((find(c==0)),:)=[];
xlswrite('position.xls',pos);

