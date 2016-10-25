%%%%%%%Assignment 4
%%%CSCI 4830 Computer Vision
%Zhi Jie huang
%Instructor:Fleming
%%%%%Due date: Nov 2nd, 11:55 pm
%%%Main script:
%Task 1
str1 = char('HORSEBACK');
str2 = char('SNOWFLAKE');
m = length(str1);
n = length(str2);
mem = zeros(n,m);
directionTable = zeros(m,n);
%%%%Preallocate the empty char array
output = repmat(char(0),n,1);
for i = 1:m
    for j = 1:n
        if i==1 || j==1
            mem(i,j) = 0;
            directionTable(i,j) = 0;
        elseif i>1 && j>1 && str1(i) == str2(j)
            mem(i,j) = mem(i-1,j-1) + 1;
            directionTable(i,j) = 1; 
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
        %%implment the recursive function
%         [M,D] = LCS(i,j,str1,str2);
    end
end
x = ['The size of the longest subsequence is ', num2str(mem(n,m))];
disp(x);
% for i = n:-1:2
%     for j = m:-1:2
%         if directionTable(i,i) == 0
%             %%Do nothing
%             continue;
%         elseif directionTable(i,i) == 1
%             output(i) = mem(i-1,j-1);
%         elseif directionTable(i,i) == 2
%             output(i) = mem(i-1,j);
%         elseif directionTable(i,i) == 3
%             output(i) = mem(i,j-1);
%         end
%         disp(num2str(output(i)));
%     end
% end
%          dispChar(directionTable,n,m);
    
         
 %%%%% Task 2:Calculate stereo disparity using the DP
 %%%Part A
 occ = 0.1;
 
