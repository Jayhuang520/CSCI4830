clc;clear all;close all;
%basepath = 'C:/Users/JayHuang/Documents/GitHub/CSCI4830/Final_Project';
%Read the image

% -----------------Using a specific image-------------
Jay = imread('IMG_0967.JPG');
Jay = imresize(Jay,0.25);
Jay = rot90(Jay,2);
% Cas = imread('Carssandra.jpg');
%Get the FaceDetector Object

FaceDetector = vision.CascadeObjectDetector();

%--------------Set a threshold for the face
% Use faceDector on us and get the faces
BBox = step(FaceDetector,Jay);

%-----------It return a roi as 4-element vector,
% [x y width height]
% Annotate these faces on the top of the image

B = insertObjectAnnotation(Jay,'rectangle',BBox,'Face');
imshow(B),title('Detected Face');
%------------Using a specific image------------------

%-------------using video frame----------------------
% Create a cascade detector object.
% faceDetector = vision.CascadeObjectDetector();
% 
% % Read a video frame and run the detector.
% videoFileReader = vision.VideoFileReader('visionface.avi');
% videoFrame      = step(videoFileReader);
% BBox            = step(faceDetector, videoFrame);
% 
% % Draw the returned bounding box around the detected face.
% videoOut = insertObjectAnnotation(videoFrame,'rectangle',BBox,'Face');
% figure, imshow(videoOut), title('Detected face');
%----------------using video frame------------------
mkdir Eye
mkdir Nose
mkdir Mouth
for i = 1:size(BBox,1)
    w = int2str(i);
    filename = strcat('img',w,'.jpg');
    CropImage = imcrop(Jay,[BBox(i,1) BBox(i,2) BBox(i,3) BBox(i,4)]);
    imwrite(CropImage,filename);
    [Eye,Nose,Mouth] = FeatureDetection(CropImage,i);
end
% 
% I = imread('img1.jpg');
% [Eye,Nose,Mouth] = FeatureDetection(I);
% nose = Nose(I);
%-------Since we know that for a human being, mouth is always below the
%eye,we can get the index from the eyes and search only below the eye.


