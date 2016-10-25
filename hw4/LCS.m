function [mem,directionTable] = LCS(i,j,str1,str2)
%%%%This is a break down of finding the longest
%%%%Common subsequenct
     if i==1 || j==1
            M = 0;
            D = 0;
        elseif i>1 && j>1 && str1(i) == str2(j)
            M = LCS(i-1,j-1,str1,str2) + 1;
            D = 1; 
     %% D = 1 means come from top left
         elseif i>1 && j>1 && str1(i) ~= str2(j)
            if mem(i-1,j) > mem(i,j-1)
             mem(i,j) = mem(i-1,j);
             directionTable(i,j) = 2;
            %%%D = 2 means come from <-
            elseif mem(i-1,j) < mem(i,j-1)
                mem(i,j) = mem(i,j-1);
                directionTable(i,j) = 3;
                %%%%D = 3 means ^
                %               |
            end
        end
end

