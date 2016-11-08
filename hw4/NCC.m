function [ output ] = NCC( Wsize,LeftImg,RightImg )
%%%Assignment 3,Due Monday 10/17/2016
%%Student: Zhi Jie Huang
%CSCI 4830 Computer Vision
%This is normalized cross correlation matching algorithm
   [y,x] = size(LeftImg);
   output = zeros(y,x);
   Windowsize = 2*Wsize+1;
   N = Windowsize^2;
   for yy = Wsize+1:y-Wsize 
       for xx = Wsize+1:x-Wsize-65
           Limg = LeftImg(yy-Wsize:yy+Wsize,xx-Wsize:xx+Wsize);
           Lmean = mean2(Limg);
           Lsigma = std2(Limg);
           for i = 1:65
               diff = zeros(1,65);
               Rimg = RightImg(yy-Wsize:yy+Wsize,xx-Wsize+i-1:xx+Wsize+i-1);
               Rmean = mean2(Rimg);
               Rsigma = std2(Rimg);
               diff(i) = 1/N*sum(sum(((Limg-Lmean).*(Rimg-Rmean))/(Lsigma*Rsigma)));
               [~,I] = max(diff);
               output(yy,xx) = I - 1;
           end
       end
   end
   
   
   
   
   %%Need to pad both image with zeros first
%    LTemp = zeros(y+2*Wsize,x+2*Wsize,z);
%    RTemp = zeros(y1+2*Wsize,x1+2*Wsize,z1);
%    LTemp(Wsize+1:y+Wsize,Wsize+1:x+Wsize,:) = LImg(:,:,:);
%    RTemp(Wsize+1:y+Wsize,Wsize+1:x+Wsize,:) = RImg(:,:,:);
%    N = Wsize^2;
%    for yy = Wsize+1:y+Wsize
%        for xx = Wsize+1:x+Wsize
%            Lmean = mean2(LTemp(y-Mid:y+Mid,x-Mid:x+Mid,1));
%            Rmean = mean2(RTemp(y-Mid:y+Mid,x-Mid:x+Mid,1));
%            Lsigma = std2(LTemp(y-Mid:y+Mid,x-Mid:x+Mid,1));
%            Rsigma = std2(RTemp(y-Mid:y+Mid,x-Mid:x+Mid,1));
%            output(yy-Wsize,xx-Wsize,:) = 1/N.*((LTemp(yy,xx,:)-Lmean).*(RTemp(yy,xx,:)-Rmean))/(Lsigma*Rsigma);
%        end%End of big loop column
%    end%End of big loop row
end

