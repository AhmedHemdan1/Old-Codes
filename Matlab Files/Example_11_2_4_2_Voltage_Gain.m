clear; clc;
num=[4 6 0]; den=[6 25 30 9];
z=roots(num); p=roots(den);
fprintf('Zeros >> [\t');
for i=1:length(z)
    fprintf('%f\t',z(i));
end
fprintf(']\n');
fprintf('Poles >> [\t');
for i=1:length(p)
    fprintf('%f\t',p(i));
end
fprintf(']\n');
s1=-3+2i;
n1=polyval(num,s1);
d1=polyval(den,s1);
Vo=10*exp(40i*pi/180)*n1/d1;
Vo_abs=abs(Vo);
Vo_ang=angle(Vo)*180/pi;
fprintf('Phasor Voltage Vo >> Magnitude : %f , Angle in degrees : %f \n' , Vo_abs, Vo_ang);