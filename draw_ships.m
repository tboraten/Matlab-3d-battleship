function draw_ships(handles)

% This function draws grey boxes for ships
% 
% handles used - pgrid

hold on
for k=1:100
   if handles.pgrid(k)>0 & handles.pgrid(k)<6 % if there is a ship at that spot
      % draw grey box at that spot
      yn=ceil(k/10);		% changes k to its row number in the 10x10 matrix
      xn=k-(yn-1)*10;	% changes k to its column number in the 10x10 matrix
      % plot each individual 1x1 box according to its row and column number
      xp=[10-xn 10-xn 10-xn 11-xn 11-xn 10-xn;10-xn 10-xn 11-xn 11-xn 10-xn 10-xn;...
            11-xn 10-xn 11-xn 11-xn 10-xn 11-xn;11-xn 10-xn 10-xn 11-xn 11-xn 11-xn];
      yp=[10-yn 10-yn 10-yn 10-yn 11-yn 10-yn;11-yn 11-yn 10-yn 11-yn 11-yn 11-yn;...
            11-yn 11-yn 10-yn 11-yn 11-yn 11-yn;10-yn 10-yn 10-yn 10-yn 11-yn 10-yn];
      zp=[1 1 1 1 1 1.4;1 1 1 1 1 1.4;1 1.4 1.4 1.4 1.4 1.4;...
            1 1.4 1.4 1.4 1.4 1.4];
      fill3(xp,yp,zp,[.5 .5 .5])
   end
   if handles.pgrid(k)==6   % if there is a hit
       % draw red box at that spot
      yn=ceil(k/10);		% changes k to its row number in the 10x10 matrix
      xn=k-(yn-1)*10;	% changes k to its column number in the 10x10 matrix
      % plot each individual 1x1 box according to its row and column number
      xp=[10-xn 10-xn 10-xn 11-xn 11-xn 10-xn;10-xn 10-xn 11-xn 11-xn 10-xn 10-xn;...
            11-xn 10-xn 11-xn 11-xn 10-xn 11-xn;11-xn 10-xn 10-xn 11-xn 11-xn 11-xn];
      yp=[10-yn 10-yn 10-yn 10-yn 11-yn 10-yn;11-yn 11-yn 10-yn 11-yn 11-yn 11-yn;...
            11-yn 11-yn 10-yn 11-yn 11-yn 11-yn;10-yn 10-yn 10-yn 10-yn 11-yn 10-yn];
      zp=[1 1 1 1 1 1.4;1 1 1 1 1 1.4;1 1.4 1.4 1.4 1.4 1.4;...
            1 1.4 1.4 1.4 1.4 1.4];
      fill3(xp,yp,zp,'r')
   end
end