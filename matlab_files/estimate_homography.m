function H = estimate_homography(PA, PB)
A = [];
len = height(PA);

%PA = [x y]
%PB = [x' y']


% Build Matrix A
% Iterate through each pair and concatonate the new two rows onto Matrix A
for i=1:1:len
    new_set = [-PA(i, 1) -PA(i,2) -1 0 0 0 PA(i,1)*PB(i,1) PA(i,2)*PB(i,1) PB(i,1);...
        0 0 0 -PA(i, 1) -PA(i,2) -1 PA(i,1)*PB(i,2) PA(i,2)*PB(i,2) PB(i,2)];
    A = [A; new_set];
end


% Perform Singular-Value Decomposition on Matrix A
% and get Right Singular Vector V
[~, ~, V] = svd(B);
h = V(:, end);
%}
[~, ~, V] = svd(A);
h = V(:, end);
H = reshape(h, 3, 3)';



