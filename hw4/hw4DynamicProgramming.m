%%%%%%%Assignment 4
%%%CSCI 4830 Computer Vision
%Zhi Jie huang
%Instructor:Fleming
%%%%%Due date: Nov 2nd, 11:55 pm
%%%Main script:
%Task 1
str1 = 'ABCDEF';
str2 = 'ABCDEF';
%implment the recursive function
[L,S] = LCS(str1,str2);

x = ['The size of the longest subsequence is ', num2str(L)];
disp(x);
fprintf('The actual subsequence is %s\n',S);
         

 
