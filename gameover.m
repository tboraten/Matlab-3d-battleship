function varargout = gameover (varargin)
% GAMEOVER M-file for gameover.fig
%      GAMEOVER, by itself, creates a new GAMEOVER or raises the existing
%      singleton*.
%
%      H = GAMEOVER returns the handle to a new GAMEOVER or the handle to
%      the existing singleton*.
%
%      GAMEOVER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GAMEOVER.M with the given input arguments.
%
%      GAMEOVER('Property','Value',...) creates a new GAMEOVER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gameover_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gameover_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gameover

% Last Modified by GUIDE v2.5 13-Nov-2007 01:10:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gameover_OpeningFcn, ...
                   'gui_OutputFcn',  @gameover_OutputFcn, ...
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


% --- Executes just before gameover is made visible.
function gameover_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gameover (see VARARGIN)

% Choose default command line output for gameover
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
ahandles=varargin{1};

hits=0;
misses=0;
for k=1:100
    if ahandles.cgrid(k)==6
        hits=hits+1;
    elseif ahandles.cgrid(k)==7
        misses=misses+1;
    end
end
sHits=num2str(hits);
smisses=num2str(misses);
set(handles.hits,'String',sHits,'FontSize',10)
set(handles.Misses,'String',smisses,'FontSize',10)
acc=(hits/(hits+misses))*100;
sacc=num2str(acc);
set(handles.Acc,'String',sacc,'FontSize',10)
if ahandles.winner
    set(handles.WinOrLose,'String','YOU WON!!','FontSize',16)
else
    set(handles.WinOrLose,'String','The Computer Won.','FontSize',16)
end

% UIWAIT makes gameover wait for user response (see UIRESUME)
uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gameover_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in NewGame.
function NewGame_Callback(hObject, eventdata, handles)
% hObject    handle to NewGame (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(handles.figure1);
close
clear
arena;



% --- Executes on button press in Exit.
function Exit_Callback(hObject, eventdata, handles)
% hObject    handle to Exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(handles.figure1);
close

