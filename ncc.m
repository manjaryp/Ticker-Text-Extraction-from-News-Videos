close all;
clear all;
clc;

pos=xlsread('position.xls');

for pos_index=1:size(pos,1)
   if pos_index<=size(pos,1)
    frame_num=pos(pos_index,3);
    i1=imread(['C:\Users\user1\Desktop\pjct\FullFrames\i (' int2str(frame_num) ').jpg']);
    [s1 s2]=size(i1);
    s=[pos(pos_index,5),pos(pos_index,1),pos(pos_index,4),pos(pos_index,2)-pos(pos_index,1)];
    template=rgb2gray(imcrop(i1,s));
%     figure,imshow(template),title(pos_index);
    for j=pos_index:size(pos,1)
        if pos(j,3)~=frame_num
            image_num=pos(j,3);
            i2=rgb2gray(imread(['C:\Users\user1\Desktop\pjct\FullFrames\i (' int2str(image_num) ').jpg']));
            [t1 t2]=size(i2);
            t=[pos(j,5),pos(j,1),pos(j,4),pos(j,2)-pos(j,1)];
            i3=imcrop(i2,t);
            i4=padarray(i3,[pos(j,1)-1,pos(j,5)-1],'pre');
            I=padarray(i4,[t1-size(i4,1),t2-size(i4,2)],'post');          
            
            c = normxcorr2(template,I);
            [ypeak, xpeak]=find(c==max(c(:)));
            yoffset=ypeak-size(template,1);
            xoffset=xpeak-size(template,2);
            pos(j,7)=c(ypeak, xpeak);
        else
            pos(j,7)=0;
        end
        del(j)=pos(j,7);
    end
    pos((find(del>0.5)),:)=[];
    clear del;
   end
end
xlswrite('final_ticker.xls',pos);

for q=1:size(pos,1)
      image_num=pos(q,3);
      im=rgb2gray(imread(['C:\Users\user1\Desktop\pjct\FullFrames\i (' int2str(image_num) ').jpg']));
      t=[pos(q,5),pos(q,1),pos(q,4),pos(q,2)-pos(q,1)];
      im1=imcrop(im,t);
      imwrite(im1,['C:\Users\user1\Desktop\pjct\final_ticker\i (' int2str(q) ').jpg'],'jpg');
end
