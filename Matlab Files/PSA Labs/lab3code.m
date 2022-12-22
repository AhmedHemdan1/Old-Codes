clear;
clc;
        %element#     start     end       R             X             ysh/2
data=[  1             1         4         0.0000        0.0576        0.0000
        2             4         6         0.0170        0.0920        0.0790
        3             6         9         0.0390        0.1700        0.1790
        4             3         9         0.0000        0.0586        0.0000
        5             8         9         0.0119        0.1008        0.1045
        6             7         8         0.0085        0.0720        0.0745
        7             2         7         0.0000        0.0625        0.0000
        8             5         7         0.0320        0.1610        0.1530
        9             4         5         0.0100        0.0850        0.0880];

numBuses=max(max(data(:,[2 3])));
numElements=max(data(:,1));

ybus(numBuses,numBuses)=0;

for k=1:numElements
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

% Load_Flow
% Forming the Bus data matrix (based on the given data according to the type of bus)
% Bus Type Coding: 0:slack , 1:PQ , 2:PV

%       Bus#   |V|       Pg       Qg       Pload     Qload     Bus-Type
datab=[ 1      1.040     0.00     0.00     0.00      0.00      0
        2      1.025     1.63     0.00     0.00      0.00      2
        3      1.025     0.85     0.00     0.00      0.00      2
        4      0.000     0.00     0.00     0.00      0.00      1
        5      0.000     0.00     0.00     1.25      0.50      1
        6      0.000     0.00     0.00     0.90      0.30      1
        7      0.000     0.00     0.00     0.00      0.00      1
        8      0.000     0.00     0.00     1.00      0.35      1
        9      0.000     0.00     0.00     0.00      0.00      1];

% Reducing the size of datab matrix (injection=generation-load)
for k=1:9
   datab1(k,1)=datab(k,1);
   datab1(k,2)=datab(k,2);
   datab1(k,3)=datab(k,3)-datab(k,5); %Active Injected Power
   datab1(k,4)=datab(k,4)-datab(k,6); %Reactive Injected Power
   datab1(k,5)=datab(k,7);
end

% Flat Start
for k=1:9
   if datab1(k,2)~=0
      vbus(k,1)=datab1(k,2);
   else
      vbus(k,1)=1; 
   end
end

%%%%%%%%%%%%%%%%% Guass Seidel Method %%%%%%%%%%%%%%%%%%%%%
error=5;    % Any initial value Given to the error variable
it=0;       % Iteration Counter
while error>=0.00001 % Compare with the desired tolerance
    it=it+1;
    for k=2:9  % No iterations for the slack bus
        if datab1(k,5)==1 % PQ Bus
            current=(datab1(k,3)-1i*datab1(k,4))/conj(vbus(k,1));
            sum=0;
            for m=1:9
                if m~=k
                    sum=sum+ybus(k,m)*vbus(m,1); 
                end
            end
            vbus(k,1)=(current-sum)/ybus(k,k);
        else  % PV Bus
            Qsum=0;  
            for m=1:9
                Qsum=Qsum-abs(vbus(k,1)*vbus(m,1)*ybus(k,m))*sin(angle(vbus(m,1)*ybus(k,m)/vbus(k,1)));
            end
            current=(datab1(k,3)-1i*Qsum)/conj(vbus(k,1));
            sum=0;
            for m=1:9
                if m~=k
                    sum=sum+ybus(k,m)*vbus(m,1); 
                end
            end
            vbusresult=(current-sum)/ybus(k,k);
            vbus(k,1)=abs(vbus(k,1))*(cos(angle(vbusresult))+1i*sin(angle(vbusresult))); % Saving the angle only for PV Buses
        end
    end
    
    % Calculating the mismatch vector
    Ibus=ybus*vbus;
    Sbus=vbus.*conj(Ibus);
    for k=2:9
        dp(k,1)=abs(datab1(k,3)-real(Sbus(k,1))); % Mismatch Vector
    end
    error=max(dp); % Error = maximum mismatch value
end

% Calculating the net losses of the network
losses=0;
for k=1:9
    losses=losses+Sbus(k,1);
end

%Print result
disp('|V|:');
round(abs(vbus),3)
disp('angle:');
round(angle(vbus)*180/pi,3)