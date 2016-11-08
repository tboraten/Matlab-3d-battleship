function handles = is_psunk(hObject,handles)

% This function checks the player's grid to see if a ship was sunk
% if a ship is sunk, it displays which ship was sunk next to the fire button
% and displays it in the ship status box
% inputs and outputs the handles
% must call after spot fired at is changed
%
% handles used - nextpstatus,pstatus,pgrid,display,PACDis,PACsunk,PBSdis,PBSsunk
%  PSubDis,PSubsunk,PDesDis,PDessunk,PPTDis,PPTsunk,shipsunk,lastone

PAClen=0;
PBSlen=0;
PSublen=0;
PDeslen=0;
PPTlen=0;

if handles.lastone
   status=handles.nextpstatus;
else
   status=handles.pstatus;
end


switch status
case 5	% if the comp hit a 5, check to see if the player aircraft was sunk
   for k=1:100     % check through the whole 10x10 matrix
      if handles.pgrid(k) == 5    % if Aircraft is found
         PAClen=PAClen+1;			 % add one to the length
      end
   end
   % if no numbers were found for any ship then that means the ship is sunk
if PAClen == 0
   % might have to clear display next to fire button here
   set(handles.display,'String','The computer sunk your Aircraft Carrier!!','Fontsize',9)
   set(handles.PACDis,'String','Aircraft Carrier is sunk','Fontsize',9)
   handles.PACsunk=1;		% which ship was sunk
   handles.shipsunk=1;		% a ship was sunk
   guidata(hObject, handles);
end
case 4	% if the comp hit a 4, check to see if the player battle ship was sunk
   for k=1:100     
      if handles.pgrid(k) == 4   % if battle ship is found
         PBSlen=PBSlen+1;			% add one to the length
      end
   end
   if PBSlen == 0
   set(handles.display,'String','The computer sunk your Battle Ship!!','Fontsize',9)
   set(handles.PBSDis,'String','Battle Ship is sunk','Fontsize',9)
   handles.PBSsunk=1;
   handles.shipsunk=1;
   guidata(hObject, handles);
   end
case 3	% if the comp hit a 3, check to see if the player submarine was sunk
   for k=1:100     
      if handles.pgrid(k) == 3   % if submarine is found
         PSublen=PSublen+1;		% add one to the length
      end	
   end
   if PSublen == 0
   set(handles.display,'String','The computer sunk your Submarine!!','Fontsize',9)
   set(handles.PSubDis,'String','Submarine is sunk','Fontsize',9)
   handles.PSubsunk=1;
   handles.shipsunk=1;
   guidata(hObject, handles);
   end
case 2	% if the comp hit a 2, check to see if the player destroyer was sunk
   for k=1:100     
      if handles.pgrid(k) == 2   % if destroyer is found
         PDeslen=PDeslen+1;		% add one to the length
      end
   end
   if PDeslen == 0
   set(handles.display,'String','The computer sunk your Destroyer!!','Fontsize',9)
   set(handles.PDesDis,'String','Destroyer is sunk','Fontsize',9)
   handles.PDessunk=1;
   handles.shipsunk=1;
   guidata(hObject, handles);
   end
case 1	% if the comp hit a 1, check to see if the player pt boat was sunk
   for k=1:100     
      if handles.pgrid(k) == 1   % if PT boat is found
         PPTlen=PPTlen+1;			% add one to the length
      end
   end
   if PPTlen == 0
   set(handles.display,'String','The computer sunk your PT boat!!','Fontsize',9)
   set(handles.PPTDis,'String','PT Boat is sunk','Fontsize',9)
   handles.PPTsunk=1;
   handles.shipsunk=1;
   guidata(hObject, handles);
   end
end