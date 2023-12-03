function t = 

%%

ax1 = axes('Parent',gcf);
ax2 = axes('Parent',gcf);
set(ax1,'Visible','off');
set(ax2,'Visible','off');
bg = imread('ratstain.png');
fg = imread('cropped_canvas_2.png');
fg = imsharpen(fg,'Radius',2,'Amount',1);
%fg = rgb2gray(fg);
%fg = edge(fg, 'canny');
hi = imshow(fg,'Parent',ax2);
set(hi,'AlphaData',0.3);
imshow(bg,'Parent',ax1)