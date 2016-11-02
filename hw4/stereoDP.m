function [disparity] = stereoDP(e1,e2,occ)

%%%%% Calculate the disparity, it is just the index difference between i
%%%%% and j.!!!!!!!!!!!!!!!!!
%%%So from the directionTable you get the from either right, it's
%%%occluded,if it's from the (i-1,j), you got a skipped pixels in Ir()a
%%%unit in disparity, selecting(i,j-1) is a uit decrease in disparity.

%%%%%%Part A
[~,x] = size(e1);
%%%e1 and e2 are epipolar scanline of the two image

disparity = zeros(1,x);
directionTable = zeros(x,x);
%%For directionTable, define North as 1
%%%%% West as 2, Northwest as 3
costTable = zeros(x,x);
directionTable(1,1) = 1;
costTable(1,1) = (e1(1) - e2(1))^2;
directionTable(1,1) = 3;
for ii = 2:x
    costTable(1,ii) = ii*occ;
    if costTable(1,ii) > costTable(1,ii-1)
       directionTable(1,ii) = directionTable(1,ii);
    else
        directionTable(1,ii) = directionTable(1,ii-1);
    end
    costTable(ii,1) = ii*occ;
    if costTable(ii,1) > costTable(ii-1,1)
       directionTable(ii,1) = directionTable(ii-1,1);
    else
        directionTable(ii,1) = directionTable(ii-1,1);
    end
end


for i = 2:x %Left epipolar line
    for j = 2:x %Right epipolar line
            dij = (e1(i) - e2(j))^2;
            D1 = costTable(i,j-1) + occ;
            D2 = costTable(i-1,j) + occ;
            D3 = costTable(i-1,j-1) + dij;
            
            if D3 < D2 && D3 < D1
                costTable(i,j) = D3;
                directionTable(i,j) = 3;
            elseif D1 < D2
                  costTable(i,j) = D1;
                directionTable(i,j) = 1;
            else
                costTable(i,j) = D2;
                directionTable(i,j) = 2;
%             if D1 < D2 && D1 < D3
%                 costTable(i,j) = D1;
%                 directionTable(i,j) = 1;
%             elseif D2 < D1 && D2 < D3
%                 costTable(i,j) = D2;
%                 directionTable(i,j) = 2;
%             else
%                 costTable(i,j) = D3;
%                 directionTable(i,j) = 3;
%             end
%             A = [D1,D2,D3];
%             [~,direction] = min(A);
%             directionTable(i,j) = direction;
            %%%%%Since matlab start with index 1,for my funtion
            %%%Go to index 3
            %1 for Northwest, 2 for West and 3 for North
            end
    end
end

%%%%%%%%%%%%%%Part B
%%%%%%%%%%%%Backtracking
row = x;
col = x;

     while row > 0 && col > 0 
            if directionTable(row,col) == 1
                disparity(1,col) = NaN;
                col = col - 1;
                %%%Corresponds to skipping a pixel in Il(a unit decrease in disparity)
            elseif directionTable(row,col) == 2
                row = row - 1;
                %%%%Corresponds to skipping a pixel in Ir(a unit decrease in disparity)
            else
                %%%%%%%Matches pixels, leave the disparity unchanged
                disparity(1,col) = abs(row - col);
                row = row - 1;
                col = col - 1;
            end
    end
end
