clc;
clear;
R=[40,-10,-30;-10,30,-5;-30,-5,65];
V=[10;0;0];
I=R\V;
fprintf('Mesh Currents are : \n I1 = %f Amperes \n I2 = %f Amperes \n I3 = %f Amperes \n',I(1),I(2),I(3));