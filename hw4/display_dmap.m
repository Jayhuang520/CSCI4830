function [d_color] = display_dmap(d)
%%%%%%%Assignment 4
%%%CSCI 4830 Computer Vision
%Zhi Jie huang
%Instructor:Fleming
%%%%%Due date: Nov 2nd, 11:55 pm

% 1. Map disparity into the range [0,1]
% max_d = the maximum calculated value of disparity;
% min_d = the minimum calculated value of disparity;
% scale the disparity values by subtracting the minimum
% value min_d and dividing by the difference beween max_d
% and min_d
[y,x] = size(d);
d_color = zeros(y,x,3);
max_d = nanmax(nanmax(d));
min_d = nanmin(nanmin(d));

% 2. Colorize occluded pixels to be red
% dColor = color image where each RGB layer is equal to the
% scaled disparity matrix (values between 0 and 1)
% find the positions/indices where each of the 3 values of
% dColor is equal to NaN, and store them in a variable
% replace the values of these positions with:
% dColor(at position in R layer) = 1; 
% dColor(at position in G layer) = 0;
% dColor(at position in B layer) = 0;
% for zz = 1:3
%     d_color(1:y,1:x,:) = temp(1:y,1:x);
% end

for yy = 1:y
    for xx = 1:x
        if isnan(d(yy,xx))
            d_color(yy,xx,:) = [1,0,0];
        else
            d_color(yy,xx,:) = (d(yy,xx) - min_d)./(max_d-min_d);
        end
    end
end


% 3. Display dColor image using imshow

end

