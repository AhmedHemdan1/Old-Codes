clc; clear;
Z=[6-13i,0,0;0,4+2i,0;0,0,6-12.5i];
c2=110*exp(-120i*pi/180);
c3=110*exp(120i*pi/180);
V=[110;c2;c3];
I = Z\V;
Van=(5+12i)*I(1);
Vbn=(3+4i)*I(2);
Vcn=(5-12i)*I(3);
Van_abs=abs(Van);
Van_ang=angle(Van)*180/pi;
Vbn_abs=abs(Vbn);
Vbn_ang=angle(Vbn)*180/pi;
Vcn_abs=abs(Vcn);
Vcn_ang=angle(Vcn)*180/pi;
fprintf('Phasor Voltage Van >> magnitude = %f , Angle in degrees : %f \n', Van_abs, Van_ang);
fprintf('Phasor Voltage Vbn >> magnitude = %f , Angle in degrees : %f \n', Vbn_abs, Vbn_ang);
fprintf('Phasor Voltage Vcn >> magnitude = %f , Aangle in degrees : %f \n', Vcn_abs, Vcn_ang)
