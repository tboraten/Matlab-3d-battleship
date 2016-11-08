function handles = is_csunk(hObject,handles)

% This function checks the computer's grid to see if a ship was sunk
% if a ship is sunk, it displays which ship was sunk next to the fire button
% and displays it in the ship status box
% inputs and outputs the handles
% must call after spot fired at is changed
%
% handles - cstatus,cgrid,display,CACDis,CACsunk,CBSdis,CBSsunk
%  CSubDis,CSubsunk,CDesDis,CDessunk,CPTDis,CPTsunk


CAClen=0;
CBSlen=0;
CSublen=0;
CDeslen=0;
CPTlen=0;

% check computer grid
switch handles.cstatus
    case 5	% if the player hit a 5, check to see if the comp aircraft was sunk
        for k=1:100     % check through the whole 10x10 matrix
            if handles.cgrid(k) == 5    % if Aircraft is found
                CAClen=CAClen+1;			 % add one to the length
            end
        end
        % if no numbers were found for any ship then that means the ship is
        % sunk
        if CAClen == 0
            set(handles.display,'String','You sunk the computer Aircraft Carrier!!','Fontsize',9)
            set(handles.CACDis,'String','Aircraft Carrier is sunk','Fontsize',9)
            handles.CACsunk=1;
            guidata(hObject, handles);
        end
    case 4	% if the player hit a 4, check to see if the comp battle ship was sunk
        for k=1:100
            if handles.cgrid(k) == 4   % if battle ship is found
                CBSlen=CBSlen+1;			% add one to the length
            end
        end
        if CBSlen == 0
            set(handles.display,'String','You sunk the computer Battle Ship!!','Fontsize',9)
            set(handles.CBSDis,'String','Battle Ship is sunk','Fontsize',9)
            handles.CBSsunk=1;
            guidata(hObject, handles);
        end
    case 3	% if the player hit a 3, check to see if the comp submarine was sunk
        for k=1:100
            if handles.cgrid(k) == 3   % if submarine is found
                CSublen=CSublen+1;		% add one to the length
            end
        end
        if CSublen == 0
            set(handles.display,'String','You sunk the computer Submarine!!','Fontsize',9)
            set(handles.CSubDis,'String','Submarine is sunk','Fontsize',9)
            handles.CSubsunk=1;
            guidata(hObject, handles);
        end
    case 2	% if the player hit a 2, check to see if the comp destroyer was sunk
        for k=1:100
            if handles.cgrid(k) == 2   % if destroyer is found
                CDeslen=CDeslen+1;		% add one to the length
            end
        end
        if CDeslen == 0
            set(handles.display,'String','You sunk the computer Destroyer!!','Fontsize',9)
            set(handles.CDesDis,'String','Destroyer is sunk','Fontsize',9)
            handles.CDessunk=1;
            guidata(hObject, handles);
        end
    case 1	% if the player hit a 1, check to see if the comp pt boat was sunk
        for k=1:100
            if handles.cgrid(k) == 1   % if PT boat is found
                CPTlen=CPTlen+1;			% add one to the length
            end
        end
        if CPTlen == 0
            set(handles.display,'String','You sunk the computer PT Boat!!','Fontsize',9)
            set(handles.CPTDis,'String','PT Boat is sunk','Fontsize',9)
            handles.CPTsunk=1;
            guidata(hObject, handles);
        end
end