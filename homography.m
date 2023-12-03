function a = homography(ratlas, ratlas_pts, stain, stain_pts)

H = estimate_homography(ratlas_pts, stain_pts);


%% Making canvas
nr = size(stain, 1);
nc = size(stain, 2);
canvas = uint8(zeros(3*nr, 3*nc, 3));
canvas(nr:2*nr-1, nc:2*nc-1, :) = stain;

%keble pixel shift
%row =+ nr;
%col =+ nc;


int = 0;
cy = 0;
cx = 0;

% iterating all pixels in stain
for y=1:1:height(ratlas)
    cy = cy + 1;
    for x=1:1:width(ratlas)
        cx = cx + 1;

        p2_pass = 'false';
        %p1 input must always be [x y], so p2 is [x y]
        p2 = apply_homography([x y],H);
        p2_pass = 'pass';

        p2_row = p2(2);
        p2_col = p2(1);


        %keble pixel shift
        p2_row = p2_row + nr;
        p2_col = p2_col + nc;

        a_1 = 0;
        a_2 = 0;
        a_3 = 0;
        a_4 = 0;
        
        %'splashing technique'          
        canvas(floor(p2_row), floor(p2_col),:) = ratlas(y,x,:);
        a_1 = 1;
        canvas(floor(p2_row), ceil(p2_col),:) = ratlas(y,x,:);
        a_2 = 1;
        canvas(ceil(p2_row), floor(p2_col),:) = ratlas(y,x,:);
        a_3 = 1;
        canvas(ceil(p2_row), ceil(p2_col),:) = ratlas(y,x,:);
        a_4 = 1;
    end
end
imshow(canvas)

%% crop canvas
a = imcrop(canvas, [nc nr nc nr]);