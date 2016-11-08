function varargout = arena(varargin)
% ARENA M-file for arena.fig
%      ARENA, by itself, creates a new ARENA or raises the existing
%      singleton*.
%
%      H = ARENA returns the handle to a new ARENA or the handle to
%      the existing singleton*.
%
%      ARENA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ARENA.M with the given input arguments.
%
%      ARENA('Property','Value',...) creates a new ARENA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before arena_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to arena_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help arena

% Last Modified by GUIDE v2.5 07-Nov-2007 15:01:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @arena_OpeningFcn, ...
                   'gui_OutputFcn',  @arena_OutputFcn, ...
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

% --- Executes just before arena is made visible.
function arena_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to arena (see VARARGIN)

% Choose default command line output for arena
handles.output = hObject;

splash;

% Random placement of computer's ships
handles.cgrid=rand_comp_grid;
% Update handles structure
guidata(hObject, handles);
computer_grid=handles.cgrid;

% UIWAIT makes arena wait for user response (see UIRESUME)
% uiwait(handles.figure1);

draw_grids('r','g');

Nav=navigation;
handles.pgrid=Nav{1};
guidata(hObject,handles)

% Set ship sunk handles to 1
handles.CACsunk=0;
handles.CBSsunk=0;
handles.CSubsunk=0;
handles.CDessunk=0;
handles.CPTsunk=0;
handles.PACsunk=0;
handles.PBSsunk=0;
handles.PSubsunk=0;
handles.PDessunk=0;
handles.PPTsunk=0;
handles.shipsunk=0;

% handles for comp_fire
handles.first=1;
handles.lastone=0;

% Update handles structure
guidata(hObject, handles);


% --- Outputs from this function are returned to the command line.
function varargout = arena_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in a1.
function a1_Callback(hObject, eventdata, handles)
% hObject    handle to a1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','A1')		% display its cooridnate

handles.rowLoc=1;
handles.colLoc=1;
handles.lastVisHand = hObject;       % stores the handle of the button pressed
guidata(hObject,handles)        % save handles
set(handles.fire,'BackgroundColor','r')  % change background color of fire button
set(handles.fire,'Enable','on')     % enable fire button

% --- Executes on button press in b1.
function b1_Callback(hObject, eventdata, handles)
% hObject    handle to b1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','B1')

handles.rowLoc=2;
handles.colLoc=1;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in c1.
function c1_Callback(hObject, eventdata, handles)
% hObject    handle to c1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','C1')

handles.rowLoc=3;
handles.colLoc=1;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in d1.
function d1_Callback(hObject, eventdata, handles)
% hObject    handle to d1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','D1')

handles.rowLoc=4;
handles.colLoc=1;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in e1.
function e1_Callback(hObject, eventdata, handles)
% hObject    handle to e1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','E1')

handles.rowLoc=5;
handles.colLoc=1;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in f1.
function f1_Callback(hObject, eventdata, handles)
% hObject    handle to f1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','F1')

handles.rowLoc=6;
handles.colLoc=1;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in g1.
function g1_Callback(hObject, eventdata, handles)
% hObject    handle to g1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','G1')

handles.rowLoc=7;
handles.colLoc=1;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in h1.
function h1_Callback(hObject, eventdata, handles)
% hObject    handle to h1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','H1')

handles.rowLoc=8;
handles.colLoc=1;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in i1.
function i1_Callback(hObject, eventdata, handles)
% hObject    handle to i1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','I1')

handles.rowLoc=9;
handles.colLoc=1;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in j1.
function j1_Callback(hObject, eventdata, handles)
% hObject    handle to j1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','J1')

handles.rowLoc=10;
handles.colLoc=1;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in a2.
function a2_Callback(hObject, eventdata, handles)
% hObject    handle to a2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','A2')

handles.rowLoc=1;
handles.colLoc=2;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in b2.
function b2_Callback(hObject, eventdata, handles)
% hObject    handle to b2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','B2')

handles.rowLoc=2;
handles.colLoc=2;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in c2.
function c2_Callback(hObject, eventdata, handles)
% hObject    handle to c2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','C2')

handles.rowLoc=3;
handles.colLoc=2;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in d2.
function d2_Callback(hObject, eventdata, handles)
% hObject    handle to d2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','D2')

handles.rowLoc=4;
handles.colLoc=2;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in e2.
function e2_Callback(hObject, eventdata, handles)
% hObject    handle to e2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','E2')

handles.rowLoc=5;
handles.colLoc=2;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in f2.
function f2_Callback(hObject, eventdata, handles)
% hObject    handle to f2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','F2')

handles.rowLoc=6;
handles.colLoc=2;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in g2.
function g2_Callback(hObject, eventdata, handles)
% hObject    handle to g2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','G2')

handles.rowLoc=7;
handles.colLoc=2;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in h2.
function h2_Callback(hObject, eventdata, handles)
% hObject    handle to h2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','H2')

handles.rowLoc=8;
handles.colLoc=2;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in i2.
function i2_Callback(hObject, eventdata, handles)
% hObject    handle to i2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','I2')

handles.rowLoc=9;
handles.colLoc=2;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in j2.
function j2_Callback(hObject, eventdata, handles)
% hObject    handle to j2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','J2')

handles.rowLoc=10;
handles.colLoc=2;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in a3.
function a3_Callback(hObject, eventdata, handles)
% hObject    handle to a3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','A3')

handles.rowLoc=1;
handles.colLoc=3;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in b3.
function b3_Callback(hObject, eventdata, handles)
% hObject    handle to b3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','B3')

handles.rowLoc=2;
handles.colLoc=3;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in c3.
function c3_Callback(hObject, eventdata, handles)
% hObject    handle to c3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','C3')

handles.rowLoc=3;
handles.colLoc=3;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in d3.
function d3_Callback(hObject, eventdata, handles)
% hObject    handle to d3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','D3')

handles.rowLoc=4;
handles.colLoc=3;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in e3.
function e3_Callback(hObject, eventdata, handles)
% hObject    handle to e3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','E3')

handles.rowLoc=5;
handles.colLoc=3;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in f3.
function f3_Callback(hObject, eventdata, handles)
% hObject    handle to f3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','F3')

handles.rowLoc=6;
handles.colLoc=3;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in g3.
function g3_Callback(hObject, eventdata, handles)
% hObject    handle to g3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','G3')

handles.rowLoc=7;
handles.colLoc=3;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in h3.
function h3_Callback(hObject, eventdata, handles)
% hObject    handle to h3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','H3')

handles.rowLoc=8;
handles.colLoc=3;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in i3.
function i3_Callback(hObject, eventdata, handles)
% hObject    handle to i3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','I3')

handles.rowLoc=9;
handles.colLoc=3;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in j3.
function j3_Callback(hObject, eventdata, handles)
% hObject    handle to j3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','J3')

handles.rowLoc=10;
handles.colLoc=3;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in a4.
function a4_Callback(hObject, eventdata, handles)
% hObject    handle to a4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','A4')

handles.rowLoc=1;
handles.colLoc=4;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in b4.
function b4_Callback(hObject, eventdata, handles)
% hObject    handle to b4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','B4')

handles.rowLoc=2;
handles.colLoc=4;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in c4.
function c4_Callback(hObject, eventdata, handles)
% hObject    handle to c4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','C4')

handles.rowLoc=3;
handles.colLoc=4;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in d4.
function d4_Callback(hObject, eventdata, handles)
% hObject    handle to d4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','D4')

handles.rowLoc=4;
handles.colLoc=4;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in e4.
function e4_Callback(hObject, eventdata, handles)
% hObject    handle to e4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','E4')

handles.rowLoc=5;
handles.colLoc=4;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in f4.
function f4_Callback(hObject, eventdata, handles)
% hObject    handle to f4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','F4')

handles.rowLoc=6;
handles.colLoc=4;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in g4.
function g4_Callback(hObject, eventdata, handles)
% hObject    handle to g4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','G4')

handles.rowLoc=7;
handles.colLoc=4;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in h4.
function h4_Callback(hObject, eventdata, handles)
% hObject    handle to h4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','H4')

handles.rowLoc=8;
handles.colLoc=4;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in i4.
function i4_Callback(hObject, eventdata, handles)
% hObject    handle to i4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','I4')

handles.rowLoc=9;
handles.colLoc=4;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in j4.
function j4_Callback(hObject, eventdata, handles)
% hObject    handle to j4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','J4')

handles.rowLoc=10;
handles.colLoc=4;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in a5.
function a5_Callback(hObject, eventdata, handles)
% hObject    handle to a5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','A5')

handles.rowLoc=1;
handles.colLoc=5;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in b5.
function b5_Callback(hObject, eventdata, handles)
% hObject    handle to b5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','B5')

handles.rowLoc=2;
handles.colLoc=5;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in c5.
function c5_Callback(hObject, eventdata, handles)
% hObject    handle to c5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','C5')

handles.rowLoc=3;
handles.colLoc=5;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in d5.
function d5_Callback(hObject, eventdata, handles)
% hObject    handle to d5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','D5')

handles.rowLoc=4;
handles.colLoc=5;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in e5.
function e5_Callback(hObject, eventdata, handles)
% hObject    handle to e5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','E5')

handles.rowLoc=5;
handles.colLoc=5;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in f5.
function f5_Callback(hObject, eventdata, handles)
% hObject    handle to f5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','F5')

handles.rowLoc=6;
handles.colLoc=5;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in g5.
function g5_Callback(hObject, eventdata, handles)
% hObject    handle to g5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','G5')

handles.rowLoc=7;
handles.colLoc=5;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in h5.
function h5_Callback(hObject, eventdata, handles)
% hObject    handle to h5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','H5')

handles.rowLoc=8;
handles.colLoc=5;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in i5.
function i5_Callback(hObject, eventdata, handles)
% hObject    handle to i5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','I5')

handles.rowLoc=9;
handles.colLoc=5;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in j5.
function j5_Callback(hObject, eventdata, handles)
% hObject    handle to j5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','J5')

handles.rowLoc=10;
handles.colLoc=5;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in a6.
function a6_Callback(hObject, eventdata, handles)
% hObject    handle to a6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','A6')

handles.rowLoc=1;
handles.colLoc=6;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in b6.
function b6_Callback(hObject, eventdata, handles)
% hObject    handle to b6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','B6')

handles.rowLoc=2;
handles.colLoc=6;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in c6.
function c6_Callback(hObject, eventdata, handles)
% hObject    handle to c6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','C6')

handles.rowLoc=3;
handles.colLoc=6;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in d6.
function d6_Callback(hObject, eventdata, handles)
% hObject    handle to d6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','D6')

handles.rowLoc=4;
handles.colLoc=6;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in e6.
function e6_Callback(hObject, eventdata, handles)
% hObject    handle to e6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','E6')

handles.rowLoc=5;
handles.colLoc=6;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in f6.
function f6_Callback(hObject, eventdata, handles)
% hObject    handle to f6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','F6')

handles.rowLoc=6;
handles.colLoc=6;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in g6.
function g6_Callback(hObject, eventdata, handles)
% hObject    handle to g6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','G6')

handles.rowLoc=7;
handles.colLoc=6;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in h6.
function h6_Callback(hObject, eventdata, handles)
% hObject    handle to h6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','H6')

handles.rowLoc=8;
handles.colLoc=6;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in i6.
function i6_Callback(hObject, eventdata, handles)
% hObject    handle to i6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','I6')

handles.rowLoc=9;
handles.colLoc=6;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in j6.
function j6_Callback(hObject, eventdata, handles)
% hObject    handle to j6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','J6')

handles.rowLoc=10;
handles.colLoc=6;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in a7.
function a7_Callback(hObject, eventdata, handles)
% hObject    handle to a7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','A7')

handles.rowLoc=1;
handles.colLoc=7;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in b7.
function b7_Callback(hObject, eventdata, handles)
% hObject    handle to b7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','B7')

handles.rowLoc=2;
handles.colLoc=7;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in c7.
function c7_Callback(hObject, eventdata, handles)
% hObject    handle to c7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','C7')

handles.rowLoc=3;
handles.colLoc=7;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in d7.
function d7_Callback(hObject, eventdata, handles)
% hObject    handle to d7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','D7')

handles.rowLoc=4;
handles.colLoc=7;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in e7.
function e7_Callback(hObject, eventdata, handles)
% hObject    handle to e7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','E7')

handles.rowLoc=5;
handles.colLoc=7;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in f7.
function f7_Callback(hObject, eventdata, handles)
% hObject    handle to f7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','F7')

handles.rowLoc=6;
handles.colLoc=7;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in g7.
function g7_Callback(hObject, eventdata, handles)
% hObject    handle to g7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','G7')

handles.rowLoc=7;
handles.colLoc=7;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in h7.
function h7_Callback(hObject, eventdata, handles)
% hObject    handle to h7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','H7')

handles.rowLoc=8;
handles.colLoc=7;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in i7.
function i7_Callback(hObject, eventdata, handles)
% hObject    handle to i7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','I7')

handles.rowLoc=9;
handles.colLoc=7;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in j7.
function j7_Callback(hObject, eventdata, handles)
% hObject    handle to j7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','J7')

handles.rowLoc=10;
handles.colLoc=7;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in a8.
function a8_Callback(hObject, eventdata, handles)
% hObject    handle to a8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','A8')

handles.rowLoc=1;
handles.colLoc=8;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in b8.
function b8_Callback(hObject, eventdata, handles)
% hObject    handle to b8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','B8')

handles.rowLoc=2;
handles.colLoc=8;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in c8.
function c8_Callback(hObject, eventdata, handles)
% hObject    handle to c8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','C8')

handles.rowLoc=3;
handles.colLoc=8;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in d8.
function d8_Callback(hObject, eventdata, handles)
% hObject    handle to d8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','D8')

handles.rowLoc=4;
handles.colLoc=8;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in e8.
function e8_Callback(hObject, eventdata, handles)
% hObject    handle to e8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','E8')

handles.rowLoc=5;
handles.colLoc=8;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in f8.
function f8_Callback(hObject, eventdata, handles)
% hObject    handle to f8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','F8')

handles.rowLoc=6;
handles.colLoc=8;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in g8.
function g8_Callback(hObject, eventdata, handles)
% hObject    handle to g8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','G8')

handles.rowLoc=7;
handles.colLoc=8;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in h8.
function h8_Callback(hObject, eventdata, handles)
% hObject    handle to h8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','H8')

handles.rowLoc=8;
handles.colLoc=8;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in i8.
function i8_Callback(hObject, eventdata, handles)
% hObject    handle to i8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','I8')

handles.rowLoc=9;
handles.colLoc=8;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in j8.
function j8_Callback(hObject, eventdata, handles)
% hObject    handle to j8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','J8')

handles.rowLoc=10;
handles.colLoc=8;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in a9.
function a9_Callback(hObject, eventdata, handles)
% hObject    handle to a9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','A9')

handles.rowLoc=1;
handles.colLoc=9;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in b9.
function b9_Callback(hObject, eventdata, handles)
% hObject    handle to b9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','B9')

handles.rowLoc=2;
handles.colLoc=9;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in c9.
function c9_Callback(hObject, eventdata, handles)
% hObject    handle to c9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','C9')

handles.rowLoc=3;
handles.colLoc=9;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in d9.
function d9_Callback(hObject, eventdata, handles)
% hObject    handle to d9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','D9')

handles.rowLoc=4;
handles.colLoc=9;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in e9.
function e9_Callback(hObject, eventdata, handles)
% hObject    handle to e9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','E9')

handles.rowLoc=5;
handles.colLoc=9;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in f9.
function f9_Callback(hObject, eventdata, handles)
% hObject    handle to f9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','F9')

handles.rowLoc=6;
handles.colLoc=9;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in g9.
function g9_Callback(hObject, eventdata, handles)
% hObject    handle to g9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','G9')

handles.rowLoc=7;
handles.colLoc=9;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in h9.
function h9_Callback(hObject, eventdata, handles)
% hObject    handle to h9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','H9')

handles.rowLoc=8;
handles.colLoc=9;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in i9.
function i9_Callback(hObject, eventdata, handles)
% hObject    handle to i9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','I9')

handles.rowLoc=9;
handles.colLoc=9;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in j9.
function j9_Callback(hObject, eventdata, handles)
% hObject    handle to j9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','J9')

handles.rowLoc=10;
handles.colLoc=9;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in a10.
function a10_Callback(hObject, eventdata, handles)
% hObject    handle to a10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','A10')

handles.rowLoc=1;
handles.colLoc=10;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in b10.
function b10_Callback(hObject, eventdata, handles)
% hObject    handle to b10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','B10')

handles.rowLoc=2;
handles.colLoc=10;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in c10.
function c10_Callback(hObject, eventdata, handles)
% hObject    handle to c10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','C10')

handles.rowLoc=3;
handles.colLoc=10;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in d10.
function d10_Callback(hObject, eventdata, handles)
% hObject    handle to d10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','D10')

handles.rowLoc=4;
handles.colLoc=10;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in e10.
function e10_Callback(hObject, eventdata, handles)
% hObject    handle to e10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','E10')

handles.rowLoc=5;
handles.colLoc=10;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in f10.
function f10_Callback(hObject, eventdata, handles)
% hObject    handle to f10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','F10')

handles.rowLoc=6;
handles.colLoc=10;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in g10.
function g10_Callback(hObject, eventdata, handles)
% hObject    handle to g10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','G10')
handles.rowLoc=7;
handles.colLoc = 10;
handles.lastVisHand = hObject;
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')
set(handles.fire,'Enable','on')


% --- Executes on button press in h10.
function h10_Callback(hObject, eventdata, handles)
% hObject    handle to h10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','H10')
handles.rowLoc=8;
handles.colLoc=10;
handles.lastVisHand = hObject;       % stores the handle of the button pressed
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')  % change background color of fire button
set(handles.fire,'Enable','on')     % enable fire button


% --- Executes on button press in i10.
function i10_Callback(hObject, eventdata, handles)
% hObject    handle to i10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','I10')
handles.rowLoc=9;
handles.colLoc=10;
handles.lastVisHand = hObject;       % stores the handle of the button pressed
guidata(hObject,handles)
set(handles.fire,'BackgroundColor','r')  % change background color of fire button
set(handles.fire,'Enable','on')     % enable fire button


% --- Executes on button press in j10.
function j10_Callback(hObject, eventdata, handles)
% hObject    handle to j10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.display,'String','J10')
handles.rowLoc = 10;
handles.colLoc = 10;
handles.lastVisHand = hObject;       % stores the handle of the button pressed
guidata(hObject,handles)        % save handles
set(handles.fire,'BackgroundColor','r')  % change background color of fire button
set(handles.fire,'Enable','on')     % enable fire button

% --- Executes on button press in fire.
function fire_Callback(hObject, eventdata, handles)
% hObject    handle to fire (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% change fire button background color back to grey
set(hObject,'BackgroundColor',[.8353 .8157 .7843])
set(hObject,'Enable','off') % disable fire button

% store the value in the 10x10 matrix at the position fired on the comp grid
handles.cstatus = handles.cgrid(handles.rowLoc,handles.colLoc);
guidata(hObject,handles)

% fire the player's missile at the spot chosen
handles=pfire_missile(hObject,handles);

if handles.cstatus	% if the player hit one of the computer's ships
   handles.cgrid(handles.rowLoc,handles.colLoc)=6;	% change the value in the computer's 10x10 matrix to 6
   guidata(hObject,handles)	% update
   set(handles.display,'String','You HIT the computer ship','FontSize',10)	% display hit next to fire button
   handles = is_csunk(hObject,handles);	% check to see if a computer's ship was sunk
   set(handles.lastVisHand,'BackgroundColor','r')	% change the grid button to red
   set(handles.lastVisHand,'Enable','off')			% disable the grid button
else    % if it is a miss change to white and disable
   set(handles.lastVisHand,'BackgroundColor',[1 1 1])
   set(handles.lastVisHand,'Enable','off')
   set(handles.display,'String','You missed the computer ship','FontSize',10)
end


% tell comp to fire
pause(.5)
handles=comp_fire(hObject,handles);


% --- Executes on button press in surrender.
function surrender_Callback(hObject, eventdata, handles)
% hObject    handle to surrender (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


close  %Forces termination of program.


% --------------------------------------------------------------------
function RestartGame_Callback(hObject, eventdata, handles)
% hObject    handle to RestartGame (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close
clear
arena;

% --------------------------------------------------------------------
function Game_Callback(hObject, eventdata, handles)
% hObject    handle to Game (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function quit_Callback(hObject, eventdata, handles)
% hObject    handle to quit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close    %Forces termination of program.






