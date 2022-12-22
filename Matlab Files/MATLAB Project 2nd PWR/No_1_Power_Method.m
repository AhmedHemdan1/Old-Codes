%Power Method is used to evaluate an approximation for the maximum eigen
%value of a matrix.
%This Function handles the square 2X2 matrix.
%File created by Ahmed M. Hemdan and it's allowable to be edited
function [lamda] = No_1_Power_Method(A,n) % Open the function
X=[1;0]; % Suppose the eigenvector X0
for i=1:n % Define the loop
    X=A*X; % Multiply matrix A by matrix X
    lamda=X(1); % Obtain eigenvalue
    X=X/X(1); % Prepare for the next X
end % Evaluate Xn
end % Close the function