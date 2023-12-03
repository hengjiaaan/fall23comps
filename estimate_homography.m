function H = estimate_homography(PA, PB)
A = [];
len = height(PA);

%PA = [x y]
%PB = [x' y']


% Calulate A
% 
for i=1:1:len
    new_set = [-PA(i, 1) -PA(i,2) -1 0 0 0 PA(i,1)*PB(i,1) PA(i,2)*PB(i,1) PB(i,1);...
        0 0 0 -PA(i, 1) -PA(i,2) -1 PA(i,1)*PB(i,2) PA(i,2)*PB(i,2) PB(i,2)];
    A = [A; new_set];
end


%{
B = [];


for i=1:1:len
    x_i = PA(i,1);
    y_i = PA(i,2);
    x_p = PB(i,1);
    y_p = PB(i,2);

    new_set = [x_i y_i 1 0 0 0 -x_p*x_i -x_p*y_i;
               0 0 0 x_i y_i 1 -y_p*x_i -y_p*y_i];
    B = [B; new_set];
end
[~, ~, V] = svd(B);
h = V(:, end);
%}
[~, ~, V] = svd(A);
h = V(:, end);
H = reshape(h, 3, 3)';



