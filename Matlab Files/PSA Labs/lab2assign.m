clear;
clc;
%% Constructing The Data of Elements:
        %element  %start  %end   %R        %X       %Ysh/2
data = [1	      1	      4      0.0000    0.0576   0.0000;  %TL1
        2	      4	      6      0.0170    0.0920   0.0790;  %TL2
        3	      6	      9      0.0390    0.1700   0.1790;  %TL3
        4	      9       3      0.0000    0.0586   0.0000;  %TL4
        5	      9	      8      0.0119    0.1008   0.1045;  %TL5
        6	      8	      7      0.0085    0.0720   0.0745;  %TL6
        7	      7	      2      0.0000    0.0625   0.0000;  %TL7
        8	      7	      5      0.0320    0.1610   0.1530;  %TL8
        9	      5	      4      0.0100    0.0850   0.0880]; %TL9
c=0; %counter for number of elements

%% Constructing a New Data of Elements Replacing their R , X with their admittances and adding Every Ysh/2 as New Elements:
for k=1:size(data,1)                      % "for" Loop for Elements in the "data" Matrix
    %for old elements with only its R & X
    c=c+1;                                % Generating The Counter for Elements Having Their R & X
    data1(c,1)=c;                         % The 1st Column in The New Data is number of elements
    data1(c,2)=data(k,2);                 % The 2nd Column in The New Data is the start bus
    data1(c,3)=data(k,3);                 % The 3rd Column in The New Data is the end bus
    data1(c,4)=1/(data(k,4)+1i*data(k,5));% The 4th Column in The New Data is the admittance (Y=1/(R+1i*X))
    %check if the old element number k has Ysh/2 or not
    if data(k,6)~=0
        %adding ysh/2 at start bus
        c=c+1;                                % Generating The Counter for Elements Having Only Ysh/2
        data1(c,1)=c;                         % The 1st Column in The New Data is number of elements
        data1(c,2)=data(k,2);                 % The 2nd Column in The New Data is the start bus
        data1(c,3)=0;                         % The 3rd Column in The New Data is ground
        data1(c,4)=1i*data(k,6);              % The 4th Co;umn in The New Data is admittance (Y=Ysh/2)
        
        %adding ysh/2 at end bus
        c=c+1;                                % Generating The Counter for Elements Having Only Ysh/2
        data1(c,1)=c;                         % The 1st Column in The New Data is number of elements
        data1(c,2)=data(k,3);                 % The 2nd Column in The New Data is the end bus
        data1(c,3)=0;                         % The 3rd Column in The New Data is ground
        data1(c,4)=1i*data(k,6);              % The 4th Co;umn in The New Data is admittance (Y=Ysh/2)
    end %"end" for "if" Condition for Ysh/2
end  %"end" for "for" Loop for Condtructing The New Data "data1"

%% Constructing The Primittive Network Matrix "Yp(# Elements * # Elements)":
for k=1:c %"for" Loop for Yp
    ypr(k,k)=data1(k,4); %Taking The Admittances from The New Data and Putting it on Diagonals of Yprimittive
end %"end" for "for" Loop for Constructing Yprimmitive

%% Condtructing The Element Bus Incidence Matrix "A(# Elements * # Busbars)":
for k=1:c %"for" Loop for A
    %If the element is connecting between the start bus and the end bus
    A(k,data1(k,2))=1; %but 1 in the row of this element and the column of its start bus
    if data1(k,3)~=0 %"if" Condition for The Non-Zero End Bus
        A(k,data1(k,3))=-1; %but -1 in the row of this element and the column of its end bus
    end %"end" for "if" Condition for The Element Bus Incidence Matrix "A"
end  %"end" for "for" Loop for Condtructing The Element Bus Incidence Matrix "A"

%% Evaluating The Bus Admittance Matrix "Ybus":
ybus=A'*ypr*A;
%Note: All Results is in Per Unit Values