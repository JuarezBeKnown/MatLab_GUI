function varargout = Graph_GUI(varargin)
% GRAPH_GUI MATLAB code for Graph_GUI.fig
%      GRAPH_GUI, by itself, creates a new GRAPH_GUI or raises the existing
%      singleton*.
%
%      H = GRAPH_GUI returns the handle to a new GRAPH_GUI or the handle to
%      the existing singleton*.
%
%      GRAPH_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GRAPH_GUI.M with the given input arguments.
%
%      GRAPH_GUI('Property','Value',...) creates a new GRAPH_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Graph_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Graph_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Graph_GUI

% Last Modified by GUIDE v2.5 05-Jan-2017 15:55:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Graph_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Graph_GUI_OutputFcn, ...
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


% --- Executes just before Graph_GUI is made visible.
function Graph_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Graph_GUI (see VARARGIN)

% Choose default command line output for Graph_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Graph_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Graph_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile({'*.txt'},'Open Directory');
fullpathName = strcat(pathname,filename);
set(handles.outputPath,'String',fullpathName); %this output file name

fileID = fopen(fullpathName,'r');
formatSpec = '%f %f';
s = textscan(fileID,formatSpec);
S=[s{1}, s{2}];


fclose(fileID);


x = s{1}; y = s{2};
set(handles.uit, 'Data', S);

plot(x,y,x,y*0) ,title('2D Plot');


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(hObject,'val',0);
 
% this imports 3 columns x,y,z     z = f(x,y)
[filename, pathname] = uigetfile({'*.txt'},'Open Directory');
fullpathName = strcat(pathname,filename);
set(handles.outputPath,'String',fullpathName);  % this out put file name
fileID = fopen(fullpathName,'r');
formatSpec = '%f %f %f';    
s = textscan(fileID,formatSpec);
S=[s{1}, s{2},s{3}];


fclose(fileID);

x = s{1}; y = s{2}; z=s{3};
set(handles.uit, 'Data', S);
plot3(x,y,z),title('3D Plot');
