function t = overlay_atlas(transformed_atlas, stain, alphalevel)

%%

ax1 = axes('Parent',gcf);
ax2 = axes('Parent',gcf);
set(ax1,'Visible','off');
set(ax2,'Visible','off');
bg = stain;
fg = transformed_atlas;
fg = imsharpen(fg,'Radius',2,'Amount',1);
%fg = rgb2gray(fg);
%fg = edge(fg, 'canny');
hi = imshow(fg,'Parent',ax2);
set(hi,'AlphaData', alphalevel);
t = imshow(bg,'Parent',ax1);
