function varargout = Assignment_1_Complete_GUI(varargin)
% ASSIGNMENT_1_COMPLETE_GUI MATLAB code for Assignment_1_Complete_GUI.fig
%      ASSIGNMENT_1_COMPLETE_GUI, by itself, creates a new ASSIGNMENT_1_COMPLETE_GUI or raises the existing
%      singleton*.
%
%      H = ASSIGNMENT_1_COMPLETE_GUI returns the handle to a new ASSIGNMENT_1_COMPLETE_GUI or the handle to
%      the existing singleton*.
%
%      ASSIGNMENT_1_COMPLETE_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ASSIGNMENT_1_COMPLETE_GUI.M with the given input arguments.
%
%      ASSIGNMENT_1_COMPLETE_GUI('Property','Value',...) creates a new ASSIGNMENT_1_COMPLETE_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Assignment_1_Complete_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Assignment_1_Complete_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Assignment_1_Complete_GUI

% Last Modified by GUIDE v2.5 13-Dec-2020 02:40:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Assignment_1_Complete_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Assignment_1_Complete_GUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Assignment_1_Complete_GUI is made visible.
function Assignment_1_Complete_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Assignment_1_Complete_GUI (see VARARGIN)

% Choose default command line output for Assignment_1_Complete_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Assignment_1_Complete_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Assignment_1_Complete_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
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
    Overcurrent(1,NoSamples)=0;
    
    if get(handles.radiobutton1,'value')==1
        for k=2:NoSamples %counter for calculation
            %calculating magnitude and angle of i & v & z
            Irms(k)=sqrt(Ik(k)^2+(((Fs*(Ik(k)-Ik(k-1)))^2)/((2*pi*Fp)^2)))/sqrt(2);
            Vrms(k)=sqrt(Vk(k)^2+(((Fs*(Vk(k)-Vk(k-1)))^2)/((2*pi*Fp)^2)))/sqrt(2);
            Z(k)=Vrms(k)/Irms(k);
            theta_i(k)=atan((2*pi*Ik(k))/(Fs)*(Ik(k)-Ik(k-1)));
            theta_v(k)=atan((2*pi*Vk(k))/(Fs)*(Vk(k)-Vk(k-1)));
            theta_z(k)=theta_v(k)-theta_i(k);
            error(k)=Irms(k)-Ireal;
            if Ireal>(120/100)*Irms(k)
                Overcurrent(k)=1;
            elseif Ireal<=(120/100)*Irms(k)
                Overcurrent(k)=0;
            end
        end
        
    elseif get(handles.radiobutton2,'value')==1
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
            if Ireal>(120/100)*Irms(k)
                Overcurrent(k)=1;
            elseif Ireal<=(120/100)*Irms(k)
                Overcurrent(k)=0;
            end
        end
        
    elseif get(handles.radiobutton3,'value')==1
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
            if Ireal>(120/100)*Irms(k)
                Overcurrent(k)=1;
            elseif Ireal<=(120/100)*Irms(k)
                Overcurrent(k)=0;
            end
        end
    end
    
    %plotting the magnitude of rms current signal at all samples
    axes(handles.axes1)
    bar(1:NoSamples,Irms);
    line(xlim,[Ireal,Ireal],'Color','r','LineWidth',1);
    
    %plotting the angle of rms current signal at all samples
    axes(handles.axes2)
    bar(1:NoSamples,theta_i);
    
    %plotting the magnitude of rms voltage signal at all samples
    axes(handles.axes3)
    bar(1:NoSamples,Vrms);
    
    %plotting the angle of rms voltage signal at all samples
    axes(handles.axes4)
    bar(1:NoSamples,theta_v);
    
    %plotting the magnitude of rms impedance signal at all samples
    axes(handles.axes5)
    bar(1:NoSamples,Z);
    
    %plotting the angles of rms impedance signal at all samples
    axes(handles.axes6)
    bar(1:NoSamples,theta_z);
    
    %plotting the error at all samples
    axes(handles.axes7)
    bar(1:NoSamples,error);
    
end
