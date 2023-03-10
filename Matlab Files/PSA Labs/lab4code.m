clear
clc
%element#      start      end            R              X           ysh/2    
data=[  1        1         4             0           0.0576          0;
        2        4         6           0.017         0.092         0.079;
        3        6         9           0.039         0.17          0.179;
        4        3         9             0           0.0586          0;
        5        8         9           0.0119        0.1008        0.1045;
        6        7         8           0.0085        0.072         0.0745;
        7        2         7             0           0.0625          0;
        8        5         7           0.032         0.161         0.153;
        9        4         5           0.01          0.085         0.088];

    ybus(9,9)=0;                   % initialization
    % Y-Bus Folmulation
    % First Method: Direct Method
    for k=1:9
        %off-diagonal elements
        ybus(data(k,2),data(k,3))=-1/(data(k,4)+1i*data(k,5));
        ybus(data(k,3),data(k,2))=ybus(data(k,2),data(k,3));
        %diagonal elements
        ybus(data(k,2),data(k,2))=ybus(data(k,2),data(k,2))+1/(data(k,4)+1i*data(k,5))+1i*data(k,6);
        ybus(data(k,3),data(k,3))=ybus(data(k,3),data(k,3))+1/(data(k,4)+1i*data(k,5))+1i*data(k,6);
    end
    
    % Second Method: Network Topology
    % Forming a modified element matrix for all elements including (ysh/2) as an element at start & end buses 
    c=0;
    for k=1:9    % Adding the old elements
       c=c+1;
       data1(c,1)=c;
       data1(c,2)=data(k,2);
       data1(c,3)=data(k,3);
       data1(c,4)=1/(data(k,4)+1i*data(k,5));
       
       if data(k,6)~=0 % Check if the old element number k has (ysh/2) or not
       c=c+1;   % Adding the element (ysh/2) at start bus 
       data1(c,1)=c;
       data1(c,2)=data(k,2);
       data1(c,3)=0;
       data1(c,4)=1i*data(k,6);
          
       c=c+1;   % Adding the element (ysh/2) at end bus 
       data1(c,1)=c;
       data1(c,2)=data(k,3);
       data1(c,3)=0;
       data1(c,4)=1i*data(k,6);
       end
    end
    
    % Forming the self admittance matrix (Yprimitive)
    for k=1:c
    ypr(k,k)=data1(k,4);
    end
    
    % Forming the element busbar incidence matrix (A)
    for k=1:c
        A(k,data1(k,2))=1;
        if data1(k,3)~=0
        A(k,data1(k,3))=-1;
        end
    end
    ybus1=A'*ypr*A;
   
  % Load_Flow
  % Forming the Bus_data matrix (based on the given data according to the type of bus)
  % Bus Type Coding: 0:slack , 1:PQ , 2:PV   
  
  %    Bus#   |V|      Pg       Qg       Pload     Qload        Bus-Type
datab=[ 1    1.04       0       0          0         0              0;
        2    1.025     1.63     0          0         0              2;
        3    1.025     0.85     0          0         0              2;
        4      0        0       0          0         0              1;   
        5      0        0       0         1.25      0.5             1;      
        6      0        0       0         0.9       0.3             1;
        7      0        0       0          0         0              1;     
        8      0        0       0          1        0.35            1;
        9      0        0       0          0         0              1];
   
   % Reducing the size of datab matrix (injection=generation-load)
   for k=1:9
      datab1(k,1)=datab(k,1);
      datab1(k,2)=datab(k,2);
      datab1(k,3)=datab(k,3)-datab(k,5);
      datab1(k,4)=datab(k,4)-datab(k,6);
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

   %%%%%%%%%%%%%%%%% Guass Seidel Method(Accelerated) %%%%%%%%%%%%%%%%%%%%%
   alfa=1.7;  % Set the value of the acceleration coefficient
   error=5;    % Any initial value Given to the error variable
   it=0;       % Iteration Counter
   while error>=0.000000001 % Compare with the desired tolerance
       it=it+1;
   
   for k=2:9  % No iterations for the slack bus
       
       if datab1(k,5)==1 % PQ Bus
          vbusold=vbus(k,1); % Save the previous iteration value of the bus voltage 
          current=(datab1(k,3)-1i*datab1(k,4))/conj(vbus(k,1));
          sum=0;
          for m=1:9
              if m~=k
                 sum=sum+ybus(k,m)*vbus(m,1); 
              end    
          end
          vbus(k,1)=(current-sum)/ybus(k,k);
          vbus(k,1)=vbusold+alfa*(vbus(k,1)-vbusold); % Accelerated Gauss Seidel
       
       else  % PV Bus
           vbusold=vbus(k,1); % Save the previous iteration value of the bus voltage
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
           vbusresult=vbusold+alfa*(vbus(k,1)-vbusold);     % Accelerated Gauss Seidel
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