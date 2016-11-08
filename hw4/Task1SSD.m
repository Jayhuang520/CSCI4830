function [output] = Task1SSD(Winput,LeftImg,RightImg)
%%%Assignment 4
%%Student: Zhi Jie Huang
%CSCI 4830 Computer Vision
[y,x] = size(LeftImg);
output = zeros(y,x); 
diff = zeros(1,65);
    for xx = Winput+1:x-Winput-65
        for i = 1:65
            Rimg = RightImg(xx+i-Winput-1:xx+i+Winput-1);
            diff(i) = sum(sum((Limg - Rimg).^2));
            [M,I] = min(diff);
            output(yy,xx) = I - 1;
        end
    end
end
