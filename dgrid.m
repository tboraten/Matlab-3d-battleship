function dgrid(playCol)
% This function draws two 10x10 grids
% no outputs
% inputs - playCol = the color of the player's board
%	        compCol = the color of the computer's board
playCol = 'r'; compCol = 'g';
for k=0:10
   % draw blue water box for player, each colum makes a side of the box
   %1.bottom 4.back 2.front 5.left 3.right
   %   |      |      |        |       |
   xp=[0 0 0 10 10;0 0 10 10 10;10 0 10 10 0; 10 0 0 10 0];
	yp=[0 0 0 0 10; 10 10 0 0 10;10 10 0 10 10; 0 0 0 10 10];
   zp=[0 0 0 0 0;0 0 0 1 1;0 1 1 1 1;0 1 1 0 0];
   fill3(xp,yp,zp,'b','EdgeColor','none','FaceAlpha',.2)								% face alpha makes everything somewhat transparent
   
   % draw top grid for player
   line([k k],[0 10],[1 1],'LineWidth',1.5,'Color',playCol)    % // to y-axis
   hold on
   line([0 10],[k k],[1 1],'LineWidth',1.5,'Color',playCol)    % // x-axis
   % plot lines on the side of the box for player
   line([0 0],[k k],[0 1],'LineWidth',1.5,'Color',playCol)     % along y-axis nearside
   line([k k],[0 0],[0 1],'LineWidth',1.5,'Color',playCol)     % along x-azis nearside
   axis([-2 10 -2 10 0 10])
   axis off
   distbtw=5;
   dist=distbtw+10; % distance apart
   
   
   axis([-2 10+dist -2 10 0 10])
   axis equal
end

% label grid with numbers and letters
% create array for numbers as strings
numbers=['9' '8' '7' '6' '5' '4' '3' '2' '1'];
% create array for letters
alpha=['I' 'H' 'G' 'F' 'E' 'D' 'C' 'B' 'A'];
% plot J and 10 for player
text(1.4,11.5,.5,'J','Color',playCol)
text(10.4,1,1,'10','Color',playCol)
for w=1:9
   % plot letters for player
   text(w+1.4,11.5,.5,alpha(w),'Color',playCol)
   % plot numbers for player
   text(10.4,w+1,1,numbers(w),'Color',playCol)
end
