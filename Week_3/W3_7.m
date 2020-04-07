clc;
clear all;
close all;
xyloObj = VideoReader('Story.mp4');
nFrames = xyloObj.NumberOfFrames;
vidHeight = xyloObj.Height;
vidWidth = xyloObj.Width; 
N=1;
Com1=uint8(zeros(N.*vidHeight, vidWidth));
Com2=uint8(zeros(N.*vidHeight, vidWidth));
Com3=uint8(zeros(N.*vidHeight, vidWidth));

for k = 1 :N: nFrames
    ii=k;
    for(kk=ii:ii+N-1)
      im = read(xyloObj, kk);
      xx=((kk-1)*vidHeight)+1: kk*vidHeight;
      Com1(xx,:)=(im(:,:,1));
      Com2(xx, :)=im(:,:,2);
      Com3(xx, :)=im(:,:,3);
    end
     Com1=histeq(Com1);
     Com2=histeq(Com2);
     Com3=histeq(Com3);

%     for ch = 1 : 3
%     OO(:, :, ch) = histeq(Com(:, :, ch), 256);
%     end  %
end


