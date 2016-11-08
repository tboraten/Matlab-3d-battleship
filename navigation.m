function [varargout,handles] = navigation(varargin)
% NAVIGATION M-file for navigation.fig
%      NAVIGATION, by itself, creates a new NAVIGATION or raises the existing
%      singleton*.
%
%      H = NAVIGATION returns the handle to a new NAVIGATION or the handle to
%      the existing singleton*.
%
%      NAVIGATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NAVIGATION.M with the given input arguments.
%
%      NAVIGATION('Property','Value',...) creates a new NAVIGATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before navigation_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to navigation_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help navigation

% Last Modified by GUIDE v2.5 07-Nov-2007 20:07:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @navigation_OpeningFcn, ...
                   'gui_OutputFcn',  @navigation_OutputFcn, ...
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




% --- Executes just before navigation is made visible.
function navigation_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to navigation (see VARARGIN)

% Choose default command line output for navigation
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes navigation wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% Draw blue sea grid with color red
dgrid('r');

%Set default values for handles determining initial grid
set(handles.submitFormation,'Enable','off');  %Turn off submit formation
handles.shipcount = 0;                 %Counter holding total ships placed
handles.Carrier = 0;                   %Set to '1' if Carrier is placed
handles.Battleship = 0;                %Set to '1' if Battleship is placed
handles.Submarine = 0;                 %Set to '1' if Submarine is placed
handles.Destroyer = 0;                 %Set to '1' if Destroyer is placed
handles.PTBoat = 0;                    %Set to '1' if PTBoat is placed
handles.setShip = false;     %Holds false/true if ship succeeded placement
handles.col = 1;                       %Current Column starting point
handles.row = 1;                       %Current Row starting point
handles.ship = 5;                      %Current ship attempting to place
handles.orientation = 'h';             %Current ship orientation
handles.pgrid = zeros(10:10);          %Sets playing field 10x10 matrix

guidata(hObject,handles);

uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = navigation_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1}=handles.output;

delete(handles.figure1);

draw_ships(handles);

% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1
contents = get(hObject,'String');
strShip = contents{get(hObject,'Value')};

%Check to see which type of ship was selected from the menu then
%set handles.ship to corresponding number
if(strcmp('Carrier',strShip))
    handles.ship = 5;
end
if(strcmp('Battleship',strShip))
    handles.ship = 4;
end
if(strcmp('Submarine',strShip))
    handles.ship = 3;
end
if(strcmp('Destroyer',strShip))
    handles.ship = 2;
end
if(strcmp('PT Boat',strShip))
    handles.ship = 1;
end
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
handles.ship = 5;
guidata(hObject,handles);



% --- Executes on selection change in row.
function row_Callback(hObject, eventdata, handles)
% hObject    handle to row (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns row contents as cell array
%        contents{get(hObject,'Value')} returns selected item from row
contents = get(hObject,'String');
strRow = contents{get(hObject,'Value')};

%Check to see which row was selected from the menu then
%set handles.row to corresponding number
if(strcmp('A',strRow))
    handles.row = 1;
end
if(strcmp('B',strRow))
    handles.row = 2;
end
if(strcmp('C',strRow))
    handles.row = 3;
end
if(strcmp('D',strRow))
    handles.row = 4;
end
if(strcmp('E',strRow))
    handles.row = 5;
end
if(strcmp('F',strRow))
    handles.row = 6;
end
if(strcmp('G',strRow))
    handles.row = 7;
end
if(strcmp('H',strRow))
    handles.row = 8;
end
if(strcmp('I',strRow))
    handles.row = 9;
end
if(strcmp('J',strRow))
    handles.row = 10;
end
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function row_CreateFcn(hObject, eventdata, handles)
% hObject    handle to row (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
handles.row = 1;
guidata(hObject,handles);


% --- Executes on selection change in column.
function column_Callback(hObject, eventdata, handles)
% hObject    handle to column (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns column contents as cell array
%        contents{get(hObject,'Value')} returns selected item from column
contents = get(hObject,'String');
strCol = contents{get(hObject,'Value')};

%Check to see which column was selected from the menu then
%set handles.col to corresponding number
if(strcmp('1',strCol))
    handles.col = 1;
end
if(strcmp('2',strCol))
    handles.col = 2;
end
if(strcmp('3',strCol))
    handles.col = 3;
end
if(strcmp('4',strCol))
    handles.col = 4;
end
if(strcmp('5',strCol))
    handles.col = 5;
end
if(strcmp('6',strCol))
    handles.col = 6;
end
if(strcmp('7',strCol))
    handles.col = 7;
end
if(strcmp('8',strCol))
    handles.col = 8;
end
if(strcmp('9',strCol))
    handles.col = 9;
end
if(strcmp('10',strCol))
    handles.col = 10;
end
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function column_CreateFcn(hObject, eventdata, handles)
% hObject    handle to column (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
handles.col = 1;
guidata(hObject,handles);

% --- Executes on button press in submitShip.
function submitShip_Callback(hObject, eventdata, handles)
% hObject    handle to submitShip (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


%Checks current ship selected to see if we already have one
%If we do, display to user and return out of function
if(handles.ship == 5 && handles.Carrier == 1)
    set(handles.display,'String','You already have a Aircraft Carrier!');
    return;
end
if(handles.ship == 4 && handles.Battleship == 1)
    set(handles.display,'String','You already have a Battleship!');
    return;
end
if(handles.ship == 3 && handles.Submarine == 1)
    set(handles.display,'String','You already have a Submarine!');
    return;
end
if(handles.ship == 2 && handles.Destroyer == 1)
    set(handles.display,'String','You already have a Destroyer!');
    return;
end
if(handles.ship == 1 && handles.PTBoat == 1)
    set(handles.display,'String','You already have a PT Boat!');
    return;
end

%Attempts to add ship into pgrid, sets 'setShip' state depending on outcome
handles = playergrid(hObject,handles);
%draw ship onto grid
draw_ships(handles);

%If deployment was successful display to user and don't allow any more of
%that ship
if(handles.setShip == true)
    if(handles.ship == 5)
        name = 'Aircraft Carrier Deployed.';  %displaying to user
        handles.Carrier = 1;                %set control Variable
        handles.shipcount = handles.shipcount + 1; %increment total ship count
    end
    if(handles.ship == 4)
        name = 'Battleship Deployed.';
        handles.Battleship = 1;
        handles.shipcount = handles.shipcount + 1;
    end
    if(handles.ship == 3)
        name = 'Submarine Deployed.';
        handles.Submarine = 1;
        handles.shipcount = handles.shipcount + 1;
    end
    if(handles.ship == 2)
        name = 'Destroyer Deployed';
        handles.Destroyer = 1;
        handles.shipcount = handles.shipcount + 1;
    end
    if(handles.ship == 1)
        name = 'PT Boat Deployed';
        handles.PTBoat = 1;
        handles.shipcount = handles.shipcount + 1;
    end
    set(handles.display,'String',name);  %Display what was added
else %else display Bad location
    set(handles.display,'String','Failure Deploying Ship: Bad Location');
end
if(handles.shipcount == 5)
    set(handles.submitFormation,'Enable','on'); % Enable submit formation button
    set(handles.submitFormation,'BackgroundColor','y'); %change background to yellow
end
guidata(hObject,handles);

% --- Executes on button press in submitFormation.
function submitFormation_Callback(hObject, eventdata, handles)
% hObject    handle to submitFormation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(hObject,'UserData',handles.pgrid)
handles.output=get(hObject,'UserData');
guidata(hObject,handles)
uiresume(handles.figure1);


% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
%reset the following handle values to initial state
set(handles.submitFormation,'Enable','off');
handles.shipcount = 0;
handles.Carrier = 0;
handles.Battleship = 0;
handles.Submarine = 0;
handles.Destroyer = 0;
handles.PTBoat = 0;
handles.setShip = false;
handles.col = 1;
handles.row = 1;
handles.ship = 5;
handles.orientation = 'h';
handles.pgrid = zeros(10:10);
%display Reset status and turn submitbutton back to grey
set(handles.display,'String','Formation Reset...');
set(handles.submitFormation,'BackgroundColor',[.8353 .8157 .7843]);
%Turn hold off so we can draw a brand new grid
hold off;
dgrid('r');
guidata(hObject,handles);





% --- Executes on selection change in orientation.
function orientation_Callback(hObject, eventdata, handles)
% hObject    handle to orientation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = get(hObject,'String') returns orientation contents as cell array
%        contents{get(hObject,'Value')} returns selected item from orientation
contents = get(hObject,'String');
strOr = contents{get(hObject,'Value')};

%set handles.orientation to corresponding value retrieved from selection
%to place next ship
if(strcmp('Horizontal',strOr))
    handles.orientation = 'h';
end
if(strcmp('Vertical',strOr))
    handles.orientation = 'v';
end
guidata(hObject,handles);



% --- Executes during object creation, after setting all properties.
function orientation_CreateFcn(hObject, eventdata, handles)
% hObject    handle to orientation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
handles.orientation = 'h';
guidata(hObject,handles);



% --- Executes on button press in Random.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Resets values of handle objects as if you were done input ships into grid
%So the user can not add anymore after random is complete
set(handles.submitFormation,'Enable','off');
handles.shipcount = 5;
handles.Carrier = 1;
handles.Battleship = 1;
handles.Submarine = 1;
handles.Destroyer = 1;
handles.PTBoat = 1;
handles.setShip = false;
handles.col = 1;
handles.row = 1;
handles.ship = 5;
handles.orientation = 'h';
handles.pgrid = zeros(10:10);
%Get new random ship matrix from comp_rand
handles.pgrid = rand_comp_grid;
%Turn off hold so we can successfully redraw new grid
hold off;
dgrid('r');
%drawships from new maxtrix
draw_ships(handles);
%display status
set(handles.display,'String','Formation Randomized.');
set(handles.submitFormation,'Enable','on');    %Enalbe submit formation button
set(handles.submitFormation,'BackgroundColor','y');  %Change button to yellow to alert user
guidata(hObject,handles);

