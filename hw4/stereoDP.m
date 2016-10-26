function [D] = stereoDP(e1,e2,maxDisp,occ)
%%%%%%Part A
[y,x] = size(e1);
% [y1,x1] = size(e2);
D = zeros(y,x);
directionTable = zeros(y,x);
    for i = 1:y
        for j = 1:x-65
            if i == 1
                D(1,j) = j*occ;
            elseif j == 1 
                D(i,1) = i*occ;
            elseif i == j
                D(i,j) = (e1(i,j) - e2(i,j))^2;
            else
                    for d = 1 : maxDisp + 1
                        dij = (e1(i,j) - e2(i,j+d))^2;
                        D1 = D(i-1,j-1) + dij;
                        D2 = D(i-1,j) + occ;
                        D3 = D(i,j-1) + occ;
                        [M,I] = min(D1,D2,D3);
                        D(i,j) = M;
                        directionTable(i,j) = I;        
                    end
            end
        end
    end
end

