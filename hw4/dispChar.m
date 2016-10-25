function [i,j] = dispChar(DirecTable,i,j)
    switch DirecTable(i,j)
        case 1
            i = i-1;
            j = j-1;
            disp(num2str(DirecTable(i,j)));
            dispChar(DirecTable,i,j);
        case 2
            i = i-1;
            disp(num2str(DirecTable(i,j)));
            dispChar(DirecTable,i,j);
        case 3
            j = j-1;
            disp(num2str(DirecTable(i,j)));
            dispChar(DirecTable,i,j);
    end
end

