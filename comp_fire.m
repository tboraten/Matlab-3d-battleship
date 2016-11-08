function handles = comp_fire(hObject,handles)

% This function has the computer fire back at the player's grid
% if the previous shot was a hit, the next shot will fire at one of the 
% spots immediately next to the hit, if that shot is a miss then it 
% will go back to the hit and try another spot imediatley next to it until
% a ship is sunk. it also fires the missile

probAgain=1;	% control variable
counter=0;
while probAgain
   
   % try a surrounding spot if the last shot was a hit and this isnt the first shot
   if handles.lastone & ~handles.first
      % new locations here are the locations of the previous hit
      % comp locations here are the location of the first hit
      % next locations here are the locations that are currently being
      % tried
      
      % direction is known - go in the direction of the ship
      if handles.knowdir
         switch handles.direction
         case 'u'
            if handles.newRow~=1		% only go up if not in first row
               handles.nextLoc=handles.newLoc-1;
               guidata(hObject,handles)
            else							% otherwise go back to original location
               handles.direction='d';	% in the opposite direction
               handles.nextLoc=handles.compLoc+1;
               guidata(hObject,handles)
            end
         case 'd'
            if handles.newRow~=10	% only go down if not in last row
               handles.nextLoc=handles.newLoc+1;
               guidata(hObject,handles)
            else
               handles.direction='u';
               handles.nextLoc=handles.compLoc-1;
               guidata(hObject,handles)
            end
         case 'r'
            if handles.newCol~=10	% only go right if not last column
               handles.nextLoc=handles.newLoc+10;
               guidata(hObject,handles)
            else
               handles.direction='l';
               handles.nextLoc=handles.compLoc-10;
               guidata(hObject,handles)
            end
         case 'l'
            if handles.newCol~=1		% only go left if not first column
               handles.nextLoc=handles.newLoc-10;
               guidata(hObject,handles)
            else
               handles.direction='r';
               handles.nextLoc=handles.compLoc+10;
               guidata(hObject,handles)
            end
         end
         
         % direction is unknown try surrounding locations
      else
          
          handles.newLoc=handles.compLoc;
          handles.newRow=handles.compRow;
          handles.newCol=handles.compCol;
          guidata(hObject,handles)
         % check to see where the last shot was in order to find a new location to fire at
         if handles.newLoc==1			% top left corner
            prob=rand;
            if prob < .5	% move right one
               handles.nextLoc=handles.newLoc+10;
               handles.direction='r';
            else				% move down one
               handles.nextLoc=handles.newLoc+1;
               handles.direction='d';
            end
         elseif handles.newLoc==91		% top right corner
            prob=rand;
            if prob < .5	% move left one
               handles.nextLoc=handles.newLoc-10;
               handles.direction='l';
            else				% move down one
               handles.nextLoc=handles.newLoc+1;
               handles.direction='d';
            end
         elseif handles.newLoc==10		% bottom left corner
            prob=rand;
            if prob < .5	% move up one
               handles.nextLoc=handles.newLoc-1;
               handles.direction='u';
            else				% move right one
               handles.nextLoc=handles.newLoc+10;
               handles.direction='r';
            end
         elseif handles.newLoc==100	% bottom right corner
            prob=rand;
            if prob < .5	% move up one
               handles.nextLoc=handles.newLoc-1;
               handles.direction='u';
            else				% move right one
               handles.nextLoc=handles.newLoc-10;
               handles.direction='r';
            end
         elseif handles.compRow==1		% first row
            prob=rand;
            if prob < .3333		% move right one
               handles.nextLoc=handles.newLoc+10;
               handles.direction='r';
            elseif prob > .6666	% move left one
               handles.nextLoc=handles.newLoc-10;
               handles.direction='l';
            else						% move down one
               handles.nextLoc=handles.newLoc+1;
               handles.direction='d';
            end
         elseif handles.compRow==10		% last row
            prob=rand;
            if prob < .3333		% move right one
               handles.nextLoc=handles.newLoc+10;
               handles.direction='r';
            elseif prob > .6666	% move left one
               handles.nextLoc=handles.newLoc-10;
               handles.direction='l';
            else						% move up one
               handles.nextLoc=handles.newLoc-1;
               handles.direction='u';
            end
         elseif handles.compCol==1		% first column
            prob=rand;
            if prob < .3333		% move right one
               handles.nextLoc=handles.newLoc+10;
               handles.direction='r';
            elseif prob > .6666	% move down one
               handles.nextLoc=handles.newLoc+1;
               handles.direction='d';
            else						% move up one
               handles.nextLoc=handles.newLoc-1;
               handles.direction='u';
            end
         else									% anywhere else 
            prob=rand;
            UoD=ceil(rand*2-1)*2-1;			% random -1 or 1 for up or down
            LoR=(ceil(rand*2-1)*2-1)*10;	% random 10 or 10 for left or right
            if prob < .5			% move up or down
               handles.nextLoc=handles.newLoc+UoD;
               switch UoD
               case 1
                  handles.direction='d';
               case -1
                  handles.direction='u';
               end
            else						% move left or right 
               handles.nextLoc=handles.newLoc+LoR;
               switch LoR
               case 10
                  handles.direction='r';
               case -10
                  handles.direction='l';
               end
            end
         end
         guidata(hObject,handles)
      end
      
      % use index to get row and column
      handles.nextCol=ceil(handles.nextLoc/10);		
      guidata(hObject,handles)	% store becuase it is used in next line
      handles.nextRow=handles.nextLoc-(handles.nextCol-1)*10;
      guidata(hObject,handles)
      
      % check to see what is in the current location
      handles.nextpstatus=handles.pgrid(handles.nextLoc);
      guidata(hObject,handles)	% i hate updating the handles it is really annoying
      if handles.nextpstatus > 0 & handles.nextpstatus < 6		% that spot is a hit
         probAgain=0;	% update control variable
         handles.lastone=1;  % means the last shot didnt shink a ship
         handles.knowdir=1;	% we know what direction to fire 
         % fire missile, display hit, check sunk, redraw ships
         handles=cfire_missile(hObject,handles);	% fire missile
         set(handles.display,'String','The computer HIT your ship','FontSize',10)	% display hit next to fire button
         %fsound=wavread('bomb.wav');
         %wavplay(fsound);
         handles.newRow=handles.nextRow;		% update the location
         handles.newCol=handles.nextCol;
         handles.newLoc=handles.nextLoc;
         guidata(hObject,handles);
         handles.pgrid(handles.newLoc)=6;		% change location to 6 to indicate a hit
         guidata(hObject,handles)
         handles = is_psunk(hObject,handles);	% check to see if a player's ship was sunk
         draw_ships(handles)   % redraw ships to show the hit spot as red
         if handles.shipsunk	% if a ship is sunk then find a completely new spot
             handles.lastone=0;
             handles.knowdir=0;
             guidata(hObject,handles)
         end
         handles.shipsunk=0;
         guidata(hObject,handles)
         
      elseif handles.nextpstatus ==0			% that spot is a miss
         probAgain=0;	% update control variable
         handles.lastone=1;	% means the last shot did not sink a ship
         guidata(hObject,handles);
         handles=cfire_missile(hObject,handles);	% fire missile
         set(handles.display,'String','The computer missed your ship','FontSize',10)	% display a miss
         handles.pgrid(handles.nextLoc)=7;		% change to 7 to indicate miss
         guidata(hObject,handles)
         if handles.knowdir	% if it is a miss and the location is known go back to the start and go
            handles.newLoc=handles.compLoc;
            handles.newRow=handles.compRow;
            handles.newCol=handles.compCol;
             switch handles.direction
                 case 'u'
                     handles.direction='d';
                 case 'd'
                     handles.direction='u';
                 case 'r'
                     handles.direction='l';
                 case 'l'
                     handles.direction='r';
             end
            guidata(hObject,handles)
         end
      else % the location was already shot at
         probAgain=1;	% update control variable
      end
      
      counter=counter+1;
      if counter > 4
          handles.lastone=0;
          guidata(hObject,handles);
      end
      
      % if this is the first time or a ship was sunk   
   else
       shootprob=rand;
       if shootprob <= .88
           % randomly find a spot to fire
           % random number 1-10 for shot
           handles.compRow=ceil(rand*10);
           handles.compCol=ceil(rand*10);
           handles.compLoc=(handles.compCol-1)*10+handles.compRow;	% get the index
           % store the value of number in that location
           handles.pstatus=handles.pgrid(handles.compLoc);
           guidata(hObject,handles);
       else
           handles.compRow=ceil(rand*10);
           handles.compCol=ceil(rand*10);
           handles.compLoc=(handles.compCol-1)*10+handles.compRow;
           handles.pstatus=handles.pgrid(handles.compLoc);
           guidata(hObject,handles);
           while handles.pstatus < 1 | handles.pstatus >=6
               handles.compRow=ceil(rand*10);
               handles.compCol=ceil(rand*10);
               handles.compLoc=(handles.compCol-1)*10+handles.compRow;
               handles.pstatus=handles.pgrid(handles.compLoc);
               guidata(hObject,handles);
           end
       end
           
      handles.knowdir=0;
      guidata(hObject,handles);
      
      % decide what to do
      % test to see if it was a hit, miss, or already shot at
      if handles.pstatus >0 & handles.pstatus <6		% that spot is a hit
         probAgain=0;	% update control variable
         % fire missile, display hit, check sunk, redraw ships
         handles=cfire_missile(hObject,handles);	% fire missile
         set(handles.display,'String','The computer HIT your ship','FontSize',10)	% display hit next to fire button
         %fsound=wavread('bomb.wav');
         %wavplay(fsound);
         handles.pgrid(handles.compRow,handles.compCol)=6;		% change location to 6 to indicate a hit
         guidata(hObject,handles)
         handles = is_psunk(hObject,handles);	% check to see if a player's ship was sunk
         draw_ships(handles)   % redraw ships to show the hit spot as red
         handles.lastone=1;  % means the last one was a hit, next time shoot at a spot next to it
         guidata(hObject,handles);
      elseif handles.pstatus ==0			% that spot is a miss
         probAgain=0;	% update control variable
         handles.lastone=0;	% means the last shot was not a hit, do not purposely shoot at a spot next to it
         guidata(hObject,handles);
         handles=cfire_missile(hObject,handles);	% fire missile
         set(handles.display,'String','The computer missed your ship','FontSize',10)	% display a miss
         handles.pgrid(handles.compRow,handles.compCol)=7;		% change to 7 to indicate miss
         guidata(hObject,handles)
         
      else % the location was already shot at
         probAgain=1;	% update control variable
      end
   end
end


% to indicate this isnt the first time calling comp_fire
handles.first=0;
guidata(hObject,handles);