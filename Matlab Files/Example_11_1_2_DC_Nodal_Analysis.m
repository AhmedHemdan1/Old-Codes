clc;
clear;
Y=[0.15,-0.1,-0.05;-0.1,0.145,-0.025;-0.05,-0.025,0.075];
I=[5;0;2];
V=Y\I;
fprintf('Nodal Voltages are : \n V1 = %f Volts \n V2 = %f Volts \n V3 = %f Volts \n',V(1),V(2),V(3));