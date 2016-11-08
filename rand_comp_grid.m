function compgrid = rand_comp_grid

% This function places the five ships randomly in
% a 10x10 matrix for the computer's grid
%
% output - compgrid = the matrix with each ship having
% 			  a different number 1-5. A 0 means no ship.
% input - no inputs

HAirCar=[5 5 5 5 5];		% horizontal Aircraft Carrier
VAirCar=[5;5;5;5;5];		% vertical Aircraft Carrier
HBS=[4 4 4 4];				% horizontal Battle Ship
VBS=[4;4;4;4];				% vertical Battle Ship
HSub=[3 3 3];				% horizontal Submarine
VSub=[3;3;3];				% veritcal Submarine
HDes=[2 2 2];				% horizontal Destroyer
VDes=[2;2;2];				% veritcal Destroyer
HPT=[1 1];					% horizontal PT Boat
VPT=[1;1];					% vertical PT Boat

compgrid=zeros(10,10);	% initial computer grid

% place Aircraft Carrier

PAC=rand;		% probability to determine if aircar is horiz or vert
if PAC < .5		% horizontal
   ACcLoc = ceil(6*rand);		% aircar column starting location - random column 1-6
   ACrLoc = ceil(10*rand);		% aircar random row location
   % place horizontal Aircraft Carrier numbers into computer grid
   compgrid(ACrLoc,ACcLoc:(ACcLoc+4))=HAirCar;
else			% vertical
   ACcLoc = ceil(10*rand);		% random column location
   ACrLoc = ceil(6*rand);		% row starting location - random row A-F
   % place vertical Aircraft Carrier numbers into computer grid
   compgrid(ACrLoc:(ACrLoc+4),ACcLoc)=VAirCar;
end

% place Battle Ship

BSagain=1;			% control variable

while BSagain		% test control variable
   
   PBS=rand;		% probability to determine if battle ship is horiz or vert
   if PBS < .5		% horizontal case
      BScLoc = ceil(7*rand);		% battle column starting loc - rand column 1-7
      BSrLoc = ceil(10*rand);		% battle rand row loc
      % check to see if another ship is in the way
      for k=0:3	% check through the length of the ship
         if compgrid(BSrLoc,BScLoc+k) ~= 0 % if there is another ship leave for loop
            BSagain=1;		% update control variable
            break
         else
            BSagain=0;		% update control variable
         end
      end
   else				% vertical case
      BScLoc = ceil(10*rand);		% random column loc
      BSrLoc = ceil(7*rand);		% random starting row loc - rows A-G
      % check to see if another ship is in the way
      for k=0:3	% check through the length of the ship
         if compgrid(BSrLoc+k,BScLoc) ~= 0	% if there is another ship, leave for loop 
            BSagain=1;		% update control variable
            break
         else 
            BSagain=0;		% update control variable
         end
      end
   end
end
if PBS < .5
   % place hor ship
   compgrid(BSrLoc,BScLoc:(BScLoc+3))=HBS;
else
   % place vert ship
   compgrid(BSrLoc:(BSrLoc+3),BScLoc)=VBS;
end

% place Submarine

Subagain=1;			% control variable

while Subagain		% test control variable
   
   PSub=rand;		% probability to determine if Submarine is horiz or vert
   if PSub < .5		% horizontal case
      SubcLoc = ceil(8*rand);		% sub column starting loc - rand column 1-8
      SubrLoc = ceil(10*rand);	% sub random row loc
      % check to see if another ship is in the way
      for k=0:2	% check through the length of the ship
         if compgrid(SubrLoc,SubcLoc+k) ~= 0 % if there is another ship leave for loop
            Subagain=1;		% update control variable
            break
         else
            Subagain=0;		% update control variable
         end
      end
   else				% vertical case
      SubcLoc = ceil(10*rand);		% random column loc
      SubrLoc = ceil(8*rand);			% random starting row loc - rows A-H
      % check to see if another ship is in the way
      for k=0:2	% check through the length of the ship
         if compgrid(SubrLoc+k,SubcLoc) ~= 0	% if there is another ship, leave for loop 
            Subagain=1;		% update control variable
            break
         else 
            Subagain=0;		% update control variable
         end
      end
   end
end
if PSub < .5
   % place horizontal Submarine numbers into computer grid
   compgrid(SubrLoc,SubcLoc:(SubcLoc+2))=HSub;
else
   % place vert Submarine numbers into computer grid
   compgrid(SubrLoc:(SubrLoc+2),SubcLoc)=VSub;
end
        
% place Destroyer

Desagain=1;			% control variable

while Desagain		% test control variable
   
   PDes=rand;		% probability to determine if Destroyer is horiz or vert
   if PDes < .5		% horizontal case
      DescLoc = ceil(8*rand);		% Des column starting loc - rand column 1-8
      DesrLoc = ceil(10*rand);	% Des random row loc
      % check to see if another ship is in the way
      for k=0:2	% check through the length of the ship
         if compgrid(DesrLoc,DescLoc+k) ~= 0 % if there is another ship leave for loop
            Desagain=1;		% update control variable
            break
         else
            Desagain=0;		% update control variable
         end
      end
   else				% vertical case
      DescLoc = ceil(10*rand);		% random column loc
      DesrLoc = ceil(8*rand);			% random starting row loc - rows A-H
      % check to see if another ship is in the way
      for k=0:2	% check through the length of the ship
         if compgrid(DesrLoc+k,DescLoc) ~= 0	% if there is another ship, leave for loop 
            Desagain=1;		% update control variable
            break
         else 
            Desagain=0;		% update control variable
         end
      end
   end
end
if PDes < .5
   % place horizontal Destroyer numbers into computer grid
   compgrid(DesrLoc,DescLoc:(DescLoc+2))=HDes;
else
   % place vert Destroyer numbers into computer grid
   compgrid(DesrLoc:(DesrLoc+2),DescLoc)=VDes;
end
            
% place PT Boat

PTagain=1;			% control variable

while PTagain		% test control variable
   
   PPT=rand;		% probability to determine if PT is horiz or vert
   if PPT < .5		% horizontal case
      PTcLoc = ceil(9*rand);		% PT column starting loc - rand column 1-9
      PTrLoc = ceil(10*rand);		% PT random row loc
      % check to see if another ship is in the way
      for k=0:1	% check through the length of the ship
         if compgrid(PTrLoc,PTcLoc+k) ~= 0 % if there is another ship leave for loop
            PTagain=1;		% update control variable
            break
         else
            PTagain=0;		% update control variable
         end
      end
   else				% vertical case
      PTcLoc = ceil(10*rand);			% random column loc
      PTrLoc = ceil(9*rand);			% random starting row loc - rows A-G
      % check to see if another ship is in the way
      for k=0:1	% check through the length of the ship
         if compgrid(PTrLoc+k,PTcLoc) ~= 0	% if there is another ship, leave for loop 
            PTagain=1;		% update control variable
            break
         else 
            PTagain=0;		% update control variable
         end
      end
   end
end
if PPT < .5
   % place horizontal PT Boat numbers into computer grid
   compgrid(PTrLoc,PTcLoc:(PTcLoc+1))=HPT;
else
   % place vert PT Boat numbers into computer grid
   compgrid(PTrLoc:(PTrLoc+1),PTcLoc)=VPT;
end

return