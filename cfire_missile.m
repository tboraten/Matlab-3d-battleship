function handles=cfire_missile(hObject,handles)
% this function fires the computer's missile at the player
% at the desired letter(A-J) and number(1-10) cooridnate
% inputs - handles - the structure for arena
% part of code based off of dr. zhu's animated example in notes
%
% handles used - nextRow,nextCol,nextstatus,compRow,compCol,pstatus

if handles.lastone
   lett=handles.nextRow;		 % stores row location and column
   numb=handles.nextCol;
   status=handles.nextpstatus;
else
   lett=handles.compRow;    % stores row location and column
   numb=handles.compCol;
   status=handles.pstatus;
end
% change the row so it fits in the center of the square
lett=10.5-lett;

x = 25:-.01:lett; % range of fire
% function of a parabola that opens down that has x-intercepts at 
% the desired x cooridnate and at 25, the max z is 4 for miss and 4.3 for a
% hit
if status	% if it is a hit move marker up so it lands ontop of the ship
    z = -(((x-((25-lett)/2))-(lett))./(((25-lett)/2)/sqrt(3))).^2+4.42;
else
    z = -(((x-((25-lett)/2))-(lett))./(((25-lett)/2)/sqrt(3))).^2+4;
end
% the head of the missile is a marker o
hbead = line(x(1),10.5-numb, z(1), 'marker', 'o',...
   'Color','r','Erase', 'xor');
% the tail is a grey dot to look like smoke
htail = line(x(1),10.5-numb, z(1), 'marker', '.',...
'Color',[.5 .5 .5],'Erase', 'none');

for k = 2 : length(x)
   % move the x and z by setting the x and y data
   % of the line function to the next point in the vector
    set(hbead, 'XData', x(k),'ZData', z(k));
    set(htail, 'XData', x(k),'ZData', z(k));
    drawnow
    set(hObject,'Enable','off') % disable fire button
    set(hObject,'BackgroundColor',[.8353 .8157 .7843])
    %pause(.0001)
end

% wait .5 sec then clear the smoke
pause(.5)
refresh