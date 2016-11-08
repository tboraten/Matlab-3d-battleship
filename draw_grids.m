function draw_grids(playCol,compCol)
% This function draws two 10x10 grids
% no outputs
% inputs - playCol = the color of the player's board
%	        compCol = the color of the computer's board

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
   
   % fill in water for comp, 
   xc=[0+dist 0+dist 0+dist 10+dist 10+dist;0+dist 0+dist 10+dist 10+dist 10+dist;...
         10+dist 0+dist 10+dist 10+dist 0+dist; 10+dist 0+dist 0+dist 10+dist 0+dist];
	yc=[0 0 0 0 10; 10 10 0 0 10;10 10 0 10 10; 0 0 0 10 10];
   zc=[0 0 0 0 0;0 0 0 1 1;0 1 1 1 1;0 1 1 0 0];
   fill3(xc,yc,zc,'b','EdgeColor','none')
   
   % draw top grid for computer
   line([k+dist k+dist],[0 10],[1 1],'LineWidth',1.5,'Color',compCol)    % // to y-axis
   hold on
   line([0+dist 10+dist],[k k],[1 1],'LineWidth',1.5,'Color',compCol)    % // x-axis
   % plot lines on the side of the box for computer
   line([0+dist 0+dist],[k k],[0 1],'LineWidth',1.5,'Color',compCol)     % along y-axis nearside
   line([k+dist k+dist],[0 0],[0 1],'LineWidth',1.5,'Color',compCol)     % along x-azis nearside
   
   % draw divider
   % bottom
   fill3([10+3/10*distbtw 10+6/10*distbtw 10+6/10*distbtw 10+3/10*distbtw],...
      [0 0 10 10],[0 0 0 0],'y','EdgeColor','none')
   % top
   fill3([10+3/10*distbtw 10+6/10*distbtw 10+6/10*distbtw 10+3/10*distbtw],...
      [0 0 10 10],[1+3/10*distbtw 1+3/10*distbtw 1+3/10*distbtw 1+3/10*distbtw],'y')
   % front side
   fill3([10+3/10*distbtw 10+3/10*distbtw 10+3/10*distbtw 10+3/10*distbtw],...
      [0 0 10 10],[0 1+3/10*distbtw 1+3/10*distbtw 0],'y','EdgeColor','none')
   % right side
   fill3([10+3/10*distbtw 10+6/10*distbtw 10+6/10*distbtw 10+3/10*distbtw],...
      [0 0 0 0],[0 0 1+3/10*distbtw 1+3/10*distbtw],'y')
   
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
% J and 10 for comp
text(1.4+dist,11.5,.5,'J','Color',compCol)
text(10.4+dist,1,1,'10','Color',compCol)
for w=1:9
   % plot letters for player
   text(w+1.4,11.5,.5,alpha(w),'Color',playCol)
   % plot numbers for player
   text(10.4,w+1,1,numbers(w),'Color',playCol)
   % letters for comp
   text(w+1.4+dist,11.5,.5,alpha(w),'Color',compCol)
   % numbers for comp
   text(10.4+dist,w+1,1,numbers(w),'Color',compCol)
end
