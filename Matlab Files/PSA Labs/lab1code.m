clear;
clc;

%element %start %end %R   %X   %Ysh/2
data = [1	 1	2    0.1  0.2  5;
        2	 1	0    0    0.3  0];
numbuses=2;
numelements=2;
ybus(numbuses,numbuses)=0;

for k=1:numelements
	if(data(k,2)~=0 && data(k,3)~=0)			%if element is between bus and bus
		%off-diagonal
		ybus(data(k,2),data(k,3)) = -1/(data(k,4)+1i*data(k,5));
		ybus(data(k,3),data(k,2)) = -1/(data(k,4)+1i*data(k,5));
		%diagonal
		ybus(data(k,2),data(k,2)) = ybus(data(k,2),data(k,2)) + 1/(data(k,4)+1i*data(k,5)) + 1i*data(k,6);
		ybus(data(k,3),data(k,3)) = ybus(data(k,3),data(k,3)) + 1/(data(k,4)+1i*data(k,5)) + 1i*data(k,6);
	else			%if element is between bus and ground
		if(data(k,2)~=0)
			bnum=data(k,2);				%start is bus and end is ground
		else
			bnum=data(k,3);				%start is ground and end is bus
		end
	ybus(bnum,bnum) = ybus(bnum,bnum) + 1/(data(k,4)+1i*data(k,5));
	end
end