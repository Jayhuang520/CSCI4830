function [L,S] = LCS(str1,str2)
%%%%This is a break down of finding the longest
%%%%Common subsequenct
m = length(str1);
n = length(str2);
mem = zeros(n,m);
directionTable = zeros(n,m);
%%%Preallocate the empty char array
output = repmat(char(0),n,1);

for i = 1:m
    for j = 1:n
        if i==1 || j==1
            mem(i,j) = 0;
        elseif i>1 && j>1 && str1(i) == str2(j)
            mem(i,j) = mem(i-1,j-1) + 1;
            directionTable(i,j) = 1; 
     %% D = 1 means come from top left
        elseif mem(i-1,j) > mem(i,j-1)
             mem(i,j) = mem(i-1,j);
             directionTable(i,j) = 3;
            %%%D = 2 means come from <-
        elseif mem(i-1,j) < mem(i,j-1)
                mem(i,j) = mem(i,j-1);
                directionTable(i,j) = 2;
                %%%%D = 3 means ^
                %               |
        end
    end
end
L = mem(m,n);
%%%%%%%%%%%Oupput the subsequence

for l = m:-1:2
    if directionTable(l,l) == 1
            output(l) = str1(l);
    elseif directionTable(l-1,l)==1
            output(l) = str1(l-1);
    elseif directionTable(l,l-1)==1
        output(l) = str1(l);
    end
end

% l = m;
% k = n;
% while l > 1 && k > 1
%     if directionTable(l,k) == 1
%             output(l) = str1(l);
%             l = l - 1;
%             k = k - 1;
%     elseif directionTable(l,k) == 2
%             l = l - 1;
%     elseif directionTable(l,k)== 3
%             k = k - 1;
%     end
% end
S = output;

end

