clear;
clc;

%element %start %end %R   %X   %Ysh/2
data = [1	 1	2    0.1  0.2  5;
        2	 1	0    0    0.3  0];
c=0; %number of elements

for k=1:size(data,1) %adding the old elements
    c=c+1;
    data1(c,1)=c;
    data1(c,2)=data(k,2);
    data1(c,3)=data(k,3);
    data1(c,4)=1/(data(k,4)+1i*data(k,5));
    if data(k,6)~=0 %check if the old element number k has ysh/2 or not
        %adding ysh/2 at start bus
        c=c+1;
        data1(c,1)=c;
        data1(c,2)=data(k,2);
        data1(c,3)=0;
        data1(c,4)=1i*data(k,6);
        
        %adding ysh/2 at start bus
        c=c+1;
        data1(c,1)=c;
        data1(c,2)=data(k,3);
        data1(c,3)=0;
        data1(c,4)=1i*data(k,6);
    end
end

for k=1:c
    ypr(k,k)=data1(k,4);
end


for k=1:c
    A(k,data1(k,2))=1;
    if data1(k,3)~=0
        A(k,data1(k,3))=-1;
    end
end

ybus=A'*ypr*A;