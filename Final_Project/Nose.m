function [ output ] = Nose( input_img )
%------------- Create a detector object---------------
    noseDetector = vision.CascadeObjectDetector('Nose');
    noseDetector.MergeThreshold = 10;
    BBox = step(noseDetector,input_img);
    output = insertObjectAnnotation(input_img,'rectangle',BBox,'Nose');
    figure,imshow(output), title('Detected nose');
end

