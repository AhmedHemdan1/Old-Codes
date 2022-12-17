function varargout = SliderTest2(varargin)
% SLIDERTEST2 MATLAB code for SliderTest2.fig
%      SLIDERTEST2, by itself, creates a new SLIDERTEST2 or raises the existing
%      singleton*.
%
%      H = SLIDERTEST2 returns the handle to a new SLIDERTEST2 or the handle to
%      the existing singleton*.
%
%      SLIDERTEST2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SLIDERTEST2.M with the given input arguments.
%
%      SLIDERTEST2('Property','Value',...) creates a new SLIDERTEST2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SliderTest2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SliderTest2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SliderTest2

% Last Modified by GUIDE v2.5 30-Jul-2018 08:43:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SliderTest2_OpeningFcn, ...
                   'gui_OutputFcn',  @SliderTest2_OutputFcn, ...
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


% --- Executes just before SliderTest2 is made visible.
function SliderTest2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SliderTest2 (see VARARGIN)

% Choose default command line output for SliderTest2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SliderTest2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SliderTest2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



% --- Executes on slider movement.
function Red_Callback(hObject, eventdata, handles)
% hObject    handle to Red (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
Red = get(handles.Red,'value');
Green = get(handles.Green,'value');
Blue = get(handles.Blue,'value');
color = [Red,Green,Blue];
set([handles.text_red handles.text_green handles.text_blue],'string',color);
set(handles.figure1,'color',color);


% --- Executes during object creation, after setting all properties.
function Red_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Red (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function Green_Callback(hObject, eventdata, handles)
% hObject    handle to Green (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
Red = get(handles.Red,'value');
Green = get(handles.Green,'value');
Blue = get(handles.Blue,'value');
color = [Red,Green,Blue];
set([handles.text_red handles.text_green handles.text_blue],'string',color);
set(handles.figure1,'color',color);


% --- Executes during object creation, after setting all properties.
function Green_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Green (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function Blue_Callback(hObject, eventdata, handles)
% hObject    handle to Blue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
Red = get(handles.Red,'value');
Green = get(handles.Green,'value');
Blue = get(handles.Blue,'value');
color = [Red,Green,Blue];
set([handles.text_red handles.text_green handles.text_blue],'string',color);
set(handles.figure1,'color',color);


% --- Executes during object creation, after setting all properties.
function Blue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Blue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
