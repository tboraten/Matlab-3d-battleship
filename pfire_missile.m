function handles=pfire_missile(hObject,handles)
% this function fires the player's missile at the computer
% at the desired letter(A-J) and number(1-10) cooridnate
% inputs - handles - the structure for arena
% part of code based off of dr. zhu's animated example in notes
%
% handles used - rowLoc,coloc

lett=handles.rowLoc;    % stores row location and column
numb=handles.colLoc;

x = 0:.01:25.5-lett;		% range
% function of a parabola that opens down that has x-intercepts at 
% the desired x cooridnate and zero, the max z is 4
z = -((x-((25.5-lett)/2))./(((25.5-lett)/2)/sqrt(3))).^2+4;
% the head of the missile is a marker o
hbead = line(x(1),10.5-numb, z(1), 'marker', 'o',...
   'Color','g','Erase', 'xor');
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