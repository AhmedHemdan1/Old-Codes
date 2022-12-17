function varargout = Simple_Calculator(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Simple_Calculator_OpeningFcn, ...
                   'gui_OutputFcn',  @Simple_Calculator_OutputFcn, ...
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


function Simple_Calculator_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);


function varargout = Simple_Calculator_OutputFcn(hObject, eventdata, handles)
varargout{1} = handles.output;


function one_Callback(hObject, eventdata, handles)
OLDstring=get(handles.text1,'string');
NEWstring=('1');
textstring=strcat(OLDstring,NEWstring);
set(handles.text1,'string',textstring);


function two_Callback(hObject, eventdata, handles)
OLDstring=get(handles.text1,'string');
NEWstring=('2');
textstring=strcat(OLDstring,NEWstring);
set(handles.text1,'string',textstring);


function three_Callback(hObject, eventdata, handles)
OLDstring=get(handles.text1,'string');
NEWstring=('3');
textstring=strcat(OLDstring,NEWstring);
set(handles.text1,'string',textstring);


function four_Callback(hObject, eventdata, handles)
OLDstring=get(handles.text1,'string');
NEWstring=('4');
textstring=strcat(OLDstring,NEWstring);
set(handles.text1,'string',textstring);


function five_Callback(hObject, eventdata, handles)
OLDstring=get(handles.text1,'string');
NEWstring=('5');
textstring=strcat(OLDstring,NEWstring);
set(handles.text1,'string',textstring);


function six_Callback(hObject, eventdata, handles)
OLDstring=get(handles.text1,'string');
NEWstring=('6');
textstring=strcat(OLDstring,NEWstring);
set(handles.text1,'string',textstring);


function seven_Callback(hObject, eventdata, handles)
OLDstring=get(handles.text1,'string');
NEWstring=('7');
textstring=strcat(OLDstring,NEWstring);
set(handles.text1,'string',textstring);


function eight_Callback(hObject, eventdata, handles)
OLDstring=get(handles.text1,'string');
NEWstring=('8');
textstring=strcat(OLDstring,NEWstring);
set(handles.text1,'string',textstring);


function nine_Callback(hObject, eventdata, handles)
OLDstring=get(handles.text1,'string');
NEWstring=('9');
textstring=strcat(OLDstring,NEWstring);
set(handles.text1,'string',textstring);


function zero_Callback(hObject, eventdata, handles)
OLDstring=get(handles.text1,'string');
NEWstring=('0');
textstring=strcat(OLDstring,NEWstring);
set(handles.text1,'string',textstring);


function bracket_open_Callback(hObject, eventdata, handles)
OLDstring=get(handles.text1,'string');
NEWstring=('(');
textstring=strcat(OLDstring,NEWstring);
set(handles.text1,'string',textstring);


function bracket_close_Callback(hObject, eventdata, handles)
OLDstring=get(handles.text1,'string');
NEWstring=(')');
textstring=strcat(OLDstring,NEWstring);
set(handles.text1,'string',textstring);


function sine_Callback(hObject, eventdata, handles)
textstring=get(handles.text1,'string');
textstring=strcat(textstring,'sin(pi/180*');
set(handles.text1,'string',textstring);


function cosine_Callback(hObject, eventdata, handles)
textstring=get(handles.text1,'string');
textstring=strcat(textstring,'cos(pi/180*');
set(handles.text1,'string',textstring);


function tan_Callback(hObject, eventdata, handles)
textstring=get(handles.text1,'string');
textstring=strcat(textstring,'tan(pi/180*');
set(handles.text1,'string',textstring);


function dot_Callback(hObject, eventdata, handles)
OLDstring=get(handles.text1,'string');
NEWstring=('.');
textstring=strcat(OLDstring,NEWstring);
set(handles.text1,'string',textstring);


function pi_Callback(hObject, eventdata, handles)
OLDstring=get(handles.text1,'string');
NEWstring=('pi');
textstring=strcat(OLDstring,NEWstring);
set(handles.text1,'string',textstring);


function clear_Callback(hObject, eventdata, handles)
set(handles.text1,'string',' ');


function sum_Callback(hObject, eventdata, handles)
OLDstring=get(handles.text1,'string');
NEWstring=('+');
textstring=strcat(OLDstring,NEWstring);
set(handles.text1,'string',textstring);


function subtraction_Callback(hObject, eventdata, handles)
OLDstring=get(handles.text1,'string');
NEWstring=('-');
textstring=strcat(OLDstring,NEWstring);
set(handles.text1,'string',textstring);


function multiplication_Callback(hObject, eventdata, handles)
OLDstring=get(handles.text1,'string');
NEWstring=('*');
textstring=strcat(OLDstring,NEWstring);
set(handles.text1,'string',textstring);


function division_Callback(hObject, eventdata, handles)
OLDstring=get(handles.text1,'string');
NEWstring=('/');
textstring=strcat(OLDstring,NEWstring);
set(handles.text1,'string',textstring);


function power_Callback(hObject, eventdata, handles)
OLDstring=get(handles.text1,'string');
NEWstring=('^');
textstring=strcat(OLDstring,NEWstring);
set(handles.text1,'string',textstring);


function result_Callback(hObject, eventdata, handles)
textstring=get(handles.text1,'string');
textstring=eval(textstring);
set(handles.text1,'string',textstring);
