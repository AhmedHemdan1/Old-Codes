function varargout = PopupmenuTest(varargin)
% POPUPMENUTEST MATLAB code for PopupmenuTest.fig
%      POPUPMENUTEST, by itself, creates a new POPUPMENUTEST or raises the existing
%      singleton*.
%
%      H = POPUPMENUTEST returns the handle to a new POPUPMENUTEST or the handle to
%      the existing singleton*.
%
%      POPUPMENUTEST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in POPUPMENUTEST.M with the given input arguments.
%
%      POPUPMENUTEST('Property','Value',...) creates a new POPUPMENUTEST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before PopupmenuTest_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to PopupmenuTest_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help PopupmenuTest

% Last Modified by GUIDE v2.5 25-Jul-2018 14:09:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @PopupmenuTest_OpeningFcn, ...
                   'gui_OutputFcn',  @PopupmenuTest_OutputFcn, ...
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


% --- Executes just before PopupmenuTest is made visible.
function PopupmenuTest_OpeningFcn(hObject, ~, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to PopupmenuTest (see VARARGIN)

% Choose default command line output for PopupmenuTest
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes PopupmenuTest wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = PopupmenuTest_OutputFcn(~, ~, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu.
function popupmenu_Callback(~, ~, handles)
% hObject    handle to popupmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu
contents = get(handles.popupmenu,'String');
value = get(handles.popupmenu,'value');
z = contents(value);
switch cell2mat(z)
    case 'White'
        color = [1 1 1];
        set([handles.popupmenu handles.text1],'foreground',[0 0 0]);
    case 'Red'
        color = [1 0 0];
        set([handles.popupmenu handles.text1],'foreground',[0 0 0]);
    case 'Green'
        color = [0 1 0];
        set([handles.popupmenu handles.text1],'foreground',[0 0 0]);
    case 'Blue'
        color = [0 0 1];
        set([handles.popupmenu handles.text1],'foreground',[1 1 1]);
    case 'Black'
        color = [0 0 0];
        set([handles.popupmenu handles.text1],'foreground',[1 1 1]);
end
set(handles.figure1,'Color',color);
set([handles.popupmenu handles.text1],'BackgroundColor',color);

% --- Executes during object creation, after setting all properties.
function popupmenu_CreateFcn(hObject, ~, ~)
% hObject    handle to popupmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(~, ~, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
user_response = questdlg('Are you sure you want to close ??','Attention !!');
switch user_response
    case 'No'
    case 'Yes'
        delete(handles.figure1);
end


% --- Executes on button press in okbutton.
function okbutton_Callback(~, ~, handles)
% hObject    handle to okbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(handles.figure1);
