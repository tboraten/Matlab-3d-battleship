function varargout = splash(varargin)
% SPLASH M-file for splash.fig
%      SPLASH, by itself, creates a new SPLASH or raises the existing
%      singleton*.
%
%      H = SPLASH returns the handle to a new SPLASH or the handle to
%      the existing singleton*.
%
%      SPLASH('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SPLASH.M with the given input arguments.
%
%      SPLASH('Property','Value',...) creates a new SPLASH or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before splash_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to splash_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help splash

% Last Modified by GUIDE v2.5 12-Nov-2007 18:26:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @splash_OpeningFcn, ...
                   'gui_OutputFcn',  @splash_OutputFcn, ...
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


% --- Executes just before splash is made visible.
function splash_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to splash (see VARARGIN)

% Choose default command line output for splash
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


% UIWAIT makes splash wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = splash_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% handles.output = 0;
% % Get default command line output from handles structure
pause(4.3);
delete(handles.figure1);
varargout{1} = 0;


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
axes(hObject);
imshow('bship.jpg');

% Hint: place code in OpeningFcn to populate axes1


