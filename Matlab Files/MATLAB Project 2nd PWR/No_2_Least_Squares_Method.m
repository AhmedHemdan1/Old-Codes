%Least Squares Method 'or Linear Least Squares Regression' is used to fit
%a dependent variable 'y for example' equal to some functions of the
%independent variables'x & u & v for example'.
%the functions are : y1=a0+a1*x1+a2*u1+a3*v1
%                    y2=a0+a1*x2+a2*u2+a3*v2
%                    y3=a0+a1*x3+a2*u2+a3*v3
%                    .......................
%                    yn=a0+a1*xn+a2*un+a3*vn
%in matrix form :
%X = [1,x1,u1,v1 ; 1,x2,u2,v2 ; ..... ; 1,xn,un,vn]
%a = [a0 ; a1 ; a2 ; a3]
%Y = [y1 ; y2 ; ..... ; yn]
%This Function fits y equal to a function of x only to obtain a line
%equation that has two constants (a0 & a1) in the 'a' matrix that can be
%evaluated by the equation : a = inv(X'*X)*X'*Y
%File created by Ahmed M. Hemdan and it's allowable to be edited
function [a0,a1]=No_2_Least_Squares_Method(x,y)
X = [ones(length(x),1) x]; %first column treated as all ones since x_1=1
Y = y; %column vector for proper dimension during multiplication
a = inv(X'*X)*X'*Y;  % Least Squares Estimator - equivalent code X\y
plot ( x , y , '*'); % original data
a0=a(1);%intersection of the line
a1=a(2);%slope of the line
hold on;
plot( x , a0+a1*x , 'r-' ); %Fitted line
legend('Data',['y=' num2str(a0) '+' num2str(a1) 'x'])
xlabel('X values');
ylabel('Y values');
end