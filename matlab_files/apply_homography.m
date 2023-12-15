function [p2] = apply_homography(p1, H)

% p' = Hp
% p1 is p
% p2 is p'

    p1 = [p1 1]';
    p2 = H*p1;
    w = p2(3);

    % removing the third value w because it is not needed
    % when reassigning pixel coordinates in a 2D Plane
    p2 = p2'/w;
    p2 = p2(1:2);

end
