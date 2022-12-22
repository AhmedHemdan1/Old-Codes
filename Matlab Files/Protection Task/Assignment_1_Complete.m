clc;
clear;
Ireal=400/sqrt(2); %rms normal current
Fs=10^4; %sampling frequency
Fp=50; %power frequency
Ik=[118.21 155.77 191.77 225.86 257.7 286.94]; %current samples
Vk=[2933.6 3190.17 3414.94 3605.64 3760.4 3877.65]; %voltage samples
NoSamples=6; %number of samples

if NoSamples==length(Ik) && NoSamples==length(Vk) %number of current and voltage samples must be equal
    %constructing the general matrices
    Irms(1,NoSamples)=0;
    Vrms(1,NoSamples)=0;
    Z(1,NoSamples)=0;
    theta_i(1,NoSamples)=0;
    theta_v(1,NoSamples)=0;
    theta_z(1,NoSamples)=0;
    error(1,NoSamples)=0;
    Overcurrent(1,NoSamples)=false;
    
    x=input('Enter The Number of Method >> ');
    
    switch x
        case 1 %method 1
            for k=2:NoSamples %counter for calculation
                %calculating magnitude and angle of i & v & z
                Irms(k)=sqrt(Ik(k)^2+(((Fs*(Ik(k)-Ik(k-1)))^2)/((2*pi*Fp)^2)))/sqrt(2);
                Vrms(k)=sqrt(Vk(k)^2+(((Fs*(Vk(k)-Vk(k-1)))^2)/((2*pi*Fp)^2)))/sqrt(2);
                Z(k)=Vrms(k)/Irms(k);
                theta_i(k)=atan((2*pi*Ik(k))/(Fs)*(Ik(k)-Ik(k-1)));
                theta_v(k)=atan((2*pi*Vk(k))/(Fs)*(Vk(k)-Vk(k-1)));
                theta_z(k)=theta_v(k)-theta_i(k);
                error(k)=Irms(k)-Ireal;
                Overcurrent(k)=logical((120/100)*Irms(k));
            end
            
        case 2 %method 2
            %constructing the matrices for this method only
            Vd1(1,NoSamples)=0;
            Vd2(1,NoSamples)=0;
            Id1(1,NoSamples)=0;
            Id2(1,NoSamples)=0;
            
            for k=2:NoSamples-1
                %calculating magnitude and angle of i & v & z
                Id1(k)=(Fs/2)*(Ik(k+1)-Ik(k-1));
                Vd1(k)=(Fs/2)*(Vk(k+1)-Vk(k-1));
                Id2(k)=(Fs^2)*(Ik(k+1)-2*Ik(k)+Ik(k-1));
                Vd2(k)=(Fs^2)*(Vk(k+1)-2*Vk(k)+Vk(k-1));
                Irms(k)=sqrt(((1/(2*pi*Fp))^2)*((Id1(k))^2+(Id2(k)/(2*pi*Fp))^2))/sqrt(2);
                Vrms(k)=sqrt(((1/(2*pi*Fp))^2)*((Vd1(k))^2+(Vd2(k)/(2*pi*Fp))^2))/sqrt(2);
                Z(k)=Vrms(k)/Irms(k);
                theta_i(k)=-atan(Id2(k)/(2*pi*Fp*Id1(k)));
                theta_v(k)=-atan(Vd2(k)/(2*pi*Fp*Vd1(k)));
                theta_z(k)=theta_v(k)-theta_i(k);
                error(k)= Irms(k)-Ireal;
                Overcurrent(k)=logical((120/100)*Irms(k));
            end
            
        case 3 %method 3
            %constructing the matrices for this method only
            theta(1,NoSamples)=0;
            
            for k=1:NoSamples-1
                %calculating magnitude and angle of i & v & z
                Irms(k)=(sqrt(((Ik(1,k)^2+Ik(1,k+1)^2-2*Ik(1,k)*Ik(1,k+1)*cos(2*pi*Fp/Fs)))/(sin(2*pi*Fp/Fs))^2))/sqrt(2);
                Vrms(k)=(sqrt(((Vk(1,k)^2+Vk(1,k+1)^2-2*Vk(1,k)*Vk(1,k+1)*cos(2*pi*50/Fs)))/(sin(2*pi*Fp/Fs))^2))/sqrt(2);
                Z(k)=Vrms(k)/Irms(k);
                theta(k)=acos((Vk(1,k)*Ik(1,k)+Vk(1,k+1)*Ik(1,k+1)-(Vk(1,k)*Ik(1,k+1)+Vk(1,k+1)*Ik(1,k))*cos(2*pi*Fp/Fs))/(Vrms(1,k)*Irms(1,k)*2*sin(2*pi*Fp/Fs)^2));
                theta_i(k)=theta(k);
                theta_z(k)=-theta(k);
                error(k)=Irms(k)-Ireal;
                Overcurrent(k)=logical((120/100)*Irms(k));
            end
            
        otherwise
            msgbox('Invalid Number of Method', 'Error','error'); %showing an error message box
    end
    
    T=table((1:NoSamples)',Irms',theta_i',Vrms',theta_v',Z',theta_z',error',Overcurrent'); %construct a table for results
    T.Properties.VariableNames={'Sample','Irms','theta_i','Vrms','theta_v','Z','theta_z','error','Overcurrent'} %row names of the table
    
    subplot(2,4,1) %plotting the magnitude of rms current signal at all samples
    bar(1:NoSamples,Irms);
    line(xlim,[Ireal,Ireal],'Color','r','LineWidth',1);
    xlabel('No. of Samples');
    ylabel('Estimated Magnitude of rms Current');
    
    subplot(2,4,5) %plotting the angle of rms current signal at all samples
    bar(1:NoSamples,theta_i);
    xlabel('No. of Samples');
    ylabel('Estimated Angle of rms Current');
    
    subplot(2,4,2) %plotting the magnitude of rms voltage signal at all samples
    bar(1:NoSamples,Vrms);
    xlabel('No. of Samples');
    ylabel('Estimated Magnitude of rms Voltage');
    
    subplot(2,4,6) %plotting the angle of rms voltage signal at all samples
    bar(1:NoSamples,theta_v);
    xlabel('No. of Samples');
    ylabel('Estimated Angle of rms Voltage');
    
    subplot(2,4,3) %plotting the magnitude of rms impedance signal at all samples
    bar(1:NoSamples,Z);
    xlabel('No. of Samples');
    ylabel('Estimated Magnitude of rms Impedance');
    
    subplot(2,4,7) %plotting the angles of rms impedance signal at all samples
    bar(1:NoSamples,theta_z);
    xlabel('No. of Samples');
    ylabel('Estimated Angle of rms Impedance');
    
    subplot(2,4,[4 8]) %plotting the error at all samples
    bar(1:NoSamples,error);
    xlabel('No. of Samples');
    ylabel('Error');
    
else
    msgbox('Invalid Symmetry for Samples', 'Error','error'); %showing an error message box
    
end