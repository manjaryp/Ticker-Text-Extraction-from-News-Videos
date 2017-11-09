close all;
clear all;
clc;
delete('tickervalue.xls')
temp=[NaN,NaN,NaN];
xlswrite('tickervalue.xls',temp);

for k=1:1502
    image=imread(['C:\Users\user1\Desktop\pjct\FullFrames\i (' int2str(k) ').jpg']);
    img=rgb2gray(image);

    se=strel('square',5);
    c=imclose(img,se);
    o=imopen(img,se);
    dif=c-o;

%     bwimage=im2bw(dif);
%     imshow(bwimage)
    level = graythresh(dif);
    bwimage = im2bw(dif,level);
    se = strel('line',5,90);        
    bwimage = imerode(bwimage,se);
%     figure,imshow(bwimage)
    [m,n]=size(bwimage);

    h = fspecial('laplacian', 0.2);
    laplacimage = imfilter(bwimage,h,'replicate');
    imwrite(laplacimage,['C:\Users\user1\Desktop\pjct\laplacian\i (' int2str(k) ').jpg'],'jpg');
%     figure,imshow(laplacimage);
    
    for i=1:size(laplacimage,1)
        mgd(i,1)=max(laplacimage(i,:));
        mgd(i,2)=min(laplacimage(i,:));
        mgd(i,3)=mgd(i,1)-mgd(i,2);
    end
  
%     figure,subplot(1,2,1),imshow(bwimage);
%     subplot(1,2,2),stem(mgd(:,3));
%     saveas(gcf,['C:\Users\user1\Desktop\pjct\plot\i(' int2str(k) ' ).jpg'],'jpg');
    flag=0;i=1;
    for j=1:size(mgd,1)
        if ((mgd(j,3)==0) && (flag==0))
            flag=0;
        end
        if ((mgd(j,3)==1) && (flag==0))
            flag=1;
            index(i,1)=j;
        end
        if ((mgd(j,3)==0) && (flag==1))
            flag=0;
            index(i,2)=j-1;
%       index(i,3)=(index(i,2)+index(i,1))/2;
            i=i+1;
        end       
    end
    [s1,s2]=size(index);
    temp2=imcrop(index,[1,s1-2,s2,s1]);
    temp2(:,3)=k;
    temp1=xlsread('tickervalue.xls');
    temp=cat(1,temp1,temp2);
    xlswrite('tickervalue.xls',temp);
    clear temp1;clear temp2;clear temp;clear index;
end    
    
