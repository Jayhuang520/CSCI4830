function [ output ] = ChangeDirectory(Type,Index)
    switch Type
        case 1
            %If it's type 1,it's Eye
            cd Eye
%                n = int2str(Index);
%                mkdir(strcat('Person',n))
        case 2
            %%If it's type 2,it's Nose
            cd Nose
        case 3
            %If it's type 3,it's Mouth
            cd Mouth
    end
        n = int2str(Index);
        mkdir(strcat('Person',n));
        file = strcat('Person',n);
        cd(file)
        output = 0;
end

