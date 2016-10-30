function [Disparity] = stereoDP(e1,e2,occ)

%%%%% Calculate the disparity, it is just the index difference between i
%%%%% and j.!!!!!!!!!!!!!!!!!
%%%So from the directionTable you get the from either right, it's
%%%occluded,if it's from the (i-1,j), you got a skipped pixels in Ir()a
%%%unit in disparity, selecting(i,j-1) is a uit decrease in disparity.


%%%%%%Part A
[~,x] = size(e1);
[~,~] = size(e2);
%%%e1 and e2 are epipolar scanline of the two image
Nl = x+1;
Nr = x+1;
directionTable = zeros(Nl,Nr);
%%For directionTable, define North as 1
%%%%% West as 2, Northwest as 3
DPTable = zeros(Nl,Nr);
Disparity = zeros(1,Nl);
for i = 1:x %Left epipolar line
    for j = 1:x %Right epipolar line
        if i == 1
            DPTable(i,j) = j*occ;
        elseif j == 1
            DPTable(i,j) = i*occ;
        elseif i == j
            dij = (e1(i) - e2(j))^2;
        else
            D1 = DPTable(i-1,j-1) + dij;
            D2 = DPTable(i-1,j) + occ;
            D3 = DPTable(i,j-1) + occ;
            A = [D1,D2,D3];
            [D,direction] = min(A);
            DPTable(i,j) = D;
            directionTable(i,j) = direction;
            %%%%%Since matlab start with index 1,for my funtion
            %%%Go to index 3
            %1 for Northwest, 2 for West and 3 for North
        end
    end
end

%%%%%%%%----------------Part B Backtracking-------------
%%%%%Finding the optimal alignment (The disparity) by
%%%%%%backtracking
for l = x:-1:1
    for k = x:-1:1
        switch directionTable(l,k)
            case 1
                Disparity(l,k) = abs(l-k);
            case 2
                Disparity(l,k) = abs(l-k) - 1;
            case 3
                Disparity(l,k) = abs(l-k) + 1;
        end
    end
end
