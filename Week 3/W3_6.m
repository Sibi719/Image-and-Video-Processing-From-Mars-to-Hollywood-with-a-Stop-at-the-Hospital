clc;
clear all;
close all;
xyloObj = VideoReader('Story.mp4');
nFrames = xyloObj.NumberOfFrames;
vidHeight = xyloObj.Height;
vidWidth = xyloObj.Width; 
mov(1:nFrames) = struct('cdata', zeros(vidHeight, vidWidth, 3, 'uint8'), 'colormap', []);


for k = 1 : nFrames
  im = read(xyloObj, k);
  [R G B] =imsplit(im);
  R=histeq(R);
  G=histeq(G);
  B=histeq(B);
  im=cat(3,R,G,B);
  mov(k).cdata = im;
end

hf = figure;
set(hf, 'position', [150 150 vidWidth/2 vidHeight/2])
axis tight manual
ax = gca;
ax.NextPlot = 'replaceChildren';
movie(mov, 1, xyloObj.FrameRate);

