function [ output] = eyeDetect( input_img )
%------------- Create a detector object---------------
    eyeDetector = vision.CascadeObjectDetector('EyePairSmall');
    BBox = step(eyeDetector,input_img);
    output = insertObjectAnnotation(input_img,'rectangle',BBox,'Eye');
    figure,imshow(output), title('Detected eye');
end

