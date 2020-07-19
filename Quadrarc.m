function varargout = Test2(varargin)
% TEST2 MATLAB code for Test2.fig
%      TEST2, by itself, creates a new TEST2 or raises the existing
%      singleton*.
%
%      H = TEST2 returns the handle to a new TEST2 or the handle to
%      the existing singleton*.
%
%      TEST2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TEST2.M with the given input arguments.
%
%      TEST2('Property','Value',...) creates a new TEST2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Test2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Test2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Test2

% Last Modified by GUIDE v2.5 04-Dec-2018 19:09:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Test2_OpeningFcn, ...
                   'gui_OutputFcn',  @Test2_OutputFcn, ...
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


% --- Executes just before Test2 is made visible.
function Test2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Test2 (see VARARGIN)

% Choose default command line output for Test2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Test2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Test2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function DrawRect = pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
rect = drawrectangle('Rotatable', true);
% Ask user if rectangle is in final position?
rectposition = rect.Position;

% --- Executes on button press in pushbutton3.
function DrawCircle = pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Prompt the user if the position of rectangles are final?
% If yes, then get position of rectangles and draw circles
x = 0.2; y = 0.2; width = 0.6; height = 0.35; %points and size of rect
rect = rectangle('Position',[x y width height]);

centerX = width/4 + x ;
centerY = y + height/2; %left side of rect
centerX2 = x + 3*width/4; centerY2 = y + height/2; %right side of rect
r = width/4 + height/4; %radius of circle

%circle = rectangle('Position', [x y d d], 'Curvature', [1,1]);
viscircles([centerX, centerY], r);
viscircles([centerX2, centerY2], r);
viscircles([centerX, centerY], 0.005, 'Color', 'g');
viscircles([centerX2, centerY2], 0.005, 'Color', 'g');

% --- Executes on button press in pushbutton4.
function ClearAxis = pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla;


% --- Executes on button press in pushbutton6.
function HideRect = pushbutton6_Callback(hObject, eventdata, handles, DrawRect)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(rect, 'Visible', 'off');
