function [ Eye,Nose,Mouth] = FeatureDetection( input_img,i)
%------------- Create a detector object---------------
    [y,x,z] = size(input_img);
    eyeDetector = vision.CascadeObjectDetector('EyePairSmall');
    BBoxE = step(eyeDetector,input_img);
    Eye = insertObjectAnnotation(input_img,'rectangle',BBoxE,'Eye');
    
    
    noseDetector = vision.CascadeObjectDetector('Nose');
    noseDetector.MergeThreshold = 10;
    BBoxN = step(noseDetector,input_img);   
    Nose = insertObjectAnnotation(input_img,'rectangle',BBoxN,'Nose');
    
    
    %-------------Extract the image below the eyes and help detect the
    %mouth

    MouthImg = input_img((BBoxE(2)+BBoxE(4)):y,:,:);
    MouthDetector = vision.CascadeObjectDetector('Mouth');
    MouthDetector.MergeThreshold = 10;
    BBoxM = step(MouthDetector,MouthImg);
    Mouth = insertObjectAnnotation(MouthImg,'rectangle',BBoxM,'Mouth');
%     figure,imshow(Eye), title('Detected eye');
%     figure,imshow(Nose), title('Detected nose');
%     figure,imshow(Mouth),title('Detected mouth');

    Index = int2str(i);
    filenameE = strcat('Eye',Index,'.jpg');
    CropImageEye = imcrop(input_img,[BBoxE(1) BBoxE(2) BBoxE(3) BBoxE(4)]);
%     cd Eye
%     cd 'C:/Users/JayHuang/Documents/GitHub/CSCI4830/Final_Project/Eye';
    ChangeDirectory(1,i);
    imwrite(CropImageEye,filenameE);
    cd ..
    cd ..
    
    filenameN = strcat('Nose',Index,'.jpg');
    CropImageNose = imcrop(input_img,[BBoxN(1) BBoxN(2) BBoxN(3) BBoxN(4)]);
%     cd Nose
 %   cd 'C:/Users/JayHuang/Documents/GitHub/CSCI4830/Final_Project/Nose';
    ChangeDirectory(2,i);
    imwrite(CropImageNose,filenameN);
    cd ..
    cd ..
    
    filenameM = strcat('Mouth',Index,'.jpg');
    CropImageMouth = imcrop(input_img,[BBoxN(1) BBoxN(2) BBoxN(3) BBoxN(4)]);
%     cd Mouth
%     cd 'C:/Users/JayHuang/Documents/GitHub/CSCI4830/Final_Project/Mouth';
    ChangeDirectory(3,i);
    imwrite(CropImageMouth,filenameM);
    cd ..
    cd ..
end

