function [p2] = apply_homography(p1, H)
    p1 = [p1 1]';
    p2 = H*p1;
    w = p2(3);

    p2 = p2'/w;
    p2 = p2(1:2);

end