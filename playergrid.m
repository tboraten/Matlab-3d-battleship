function handles = playergrid(hObject,handles)

% This function places the five ships randomly in
% a 10x10 matrix for the computer's grid
%
% output - playergrid = the matrix with each ship having
% 			  a different number 1-5. A 0 means no ship.
%        - setShip = returns bool True if ship placed, false
%             if bad location
%
% input - ship  - type of ship to enter
%       - xCord - X position for ship
%       - yCord - Y position for ship
%       - orientation - 'h' or 'v' for horizontal/verticle
%
%	Navhandles

xCord = handles.col;
yCord = handles.row;
ship = handles.ship;
orientation = handles.orientation;
playergrid= handles.pgrid;
setShip = true;


switch ship
    case 5
        HAirCar=[5 5 5 5 5];		% horizontal Aircraft Carrier
        VAirCar=[5;5;5;5;5];		% vertical Aircraft Carrier
        ACagain = 1;
        ACcLoc = xCord;		% aircar column starting location - random column 1-6
        ACrLoc = yCord;		% aircar random row location
        while ACagain
            if orientation == 'h'
                if(ACcLoc > 6)
                    handles.setShip = false;
                    guidata(hObject,handles);
                    return;
                end
                for k=0:4	% check through the length of the ship
                    if playergrid(ACrLoc,ACcLoc+k) ~= 0 % if there is another ship leave for loop
                        ACagain=1;		% update control variable
                        handles.setShip = false;
                        guidata(hObject,handles);
                        return;
                    else
                        ACagain=0;		% update control variable
                    end
                end
            else
                if(ACrLoc > 6)
                    handles.setShip = false;
                    guidata(hObject,handles);
                    return;
                end
                %check to see if another ship is in the way
                for k=0:4	% check through the length of the ship
                    if playergrid(ACrLoc+k,ACcLoc) ~= 0	% if there is another ship, leave for loop
                        ACagain=1;		% update control variable
                        handles.setShip = false;
                        guidata(hObject,handles);
                        return;
                    else
                        ACagain=0;		% update control variable
                    end
                end
            end
        end
        if orientation == 'h'
            % place hor ship
            playergrid(ACrLoc,ACcLoc:(ACcLoc+4))=HAirCar;
        else
            % place vert ship
            playergrid(ACrLoc:(ACrLoc+4),ACcLoc)=VAirCar;
        end
        playergrid
        handles.pgrid = playergrid;
        guidata(hObject,handles);

    case 4
        HBS=[4 4 4 4];				% horizontal Battle Ship
        VBS=[4;4;4;4];				% vertical Battle Ship
        BSagain=1;			% control variable
        BScLoc = xCord;		% battle column starting loc - rand column 1-7
        BSrLoc = yCord;		% battle rand row loc
        while BSagain		% test control variable
            if orientation == 'h'
                %PBS=rand;		% probability to determine if battle ship is horiz or vert
                if(BScLoc > 7)
                    handles.setShip = false;
                    guidata(hObject,handles);
                    return;
                end
                % check to see if another ship is in the way
                for k=0:3	% check through the length of the ship
                    if playergrid(BSrLoc,BScLoc+k) ~= 0 % if there is another ship leave for loop
                        BSagain=1;		% update control variable
                        handles.setShip = false;
                        guidata(hObject,handles);
                        return;
                    else
                        BSagain=0;		% update control variable
                    end
                end
            else
                %check to see if another ship is in the way
                for k=0:3	% check through the length of the ship
                    if playergrid(BSrLoc+k,BScLoc) ~= 0	% if there is another ship, leave for loop
                        BSagain=1;		% update control variable
                        handles.setShip = false;
                        guidata(hObject,handles);
                        return;
                    else
                        BSagain=0;		% update control variable
                    end
                end
            end
        end
        if orientation == 'h'
            % place hor ship
            playergrid(BSrLoc,BScLoc:(BScLoc+3))=HBS;
        else
            % place vert ship
            playergrid(BSrLoc:(BSrLoc+3),BScLoc)=VBS;
        end
        playergrid
        handles.pgrid = playergrid;
        guidata(hObject,handles);



    case 3
        HSub=[3 3 3];				% horizontal Submarine
        VSub=[3;3;3];				% veritcal Submarine
        Subagain=1;			        % control variable
        SubcLoc = xCord;		    % sub column starting loc - rand column 1-8
        SubrLoc = yCord;	        % sub random row loc

        while Subagain		% test control variable

            if orientation == 'h'		% horizontal case
                % check to see if another ship is in the way
                if(SubcLoc > 8)
                    handles.setShip = false;
                    guidata(hObject,handles);
                    return;
                end
                for k=0:2	% check through the length of the ship
                    if playergrid(SubrLoc,SubcLoc+k) ~= 0 % if there is another ship leave for loop
                        Subagain=1;		% update control variable
                        handles.setShip = false;
                        guidata(hObject,handles);
                        return;
                    else
                        Subagain=0;		% update control variable
                    end
                end
            else				% vertical case
                % check to see if another ship is in the way
                for k=0:2	% check through the length of the ship
                    if playergrid(SubrLoc+k,SubcLoc) ~= 0	% if there is another ship, leave for loop
                        Subagain=1;		% update control variable
                        handles.setShip = false;
                        guidata(hObject,handles);
                        return;
                    else
                        Subagain=0;		% update control variable
                    end
                end
            end
        end
        if orientation == 'h'
            % place horizontal Submarine numbers into computer grid
            playergrid(SubrLoc,SubcLoc:(SubcLoc+2))=HSub;
        else
            % place vert Submarine numbers into computer grid
            playergrid(SubrLoc:(SubrLoc+2),SubcLoc)=VSub;
        end
        playergrid
        handles.pgrid = playergrid;
        guidata(hObject,handles);


    case 2
        HDes=[2 2 2];				% horizontal Destroyer
        VDes=[2;2;2];				% veritcal Destroyer
        Desagain=1;			% control variable
        DescLoc = xCord;		% Des column starting loc - rand column 1-8
        DesrLoc = yCord;	% Des random row loc

        while Desagain		% test control variable
            if orientation == 'h'		% horizontal case
                if(DescLoc > 8)
                    handles.setShip = false;
                    guidata(hObject,handles);
                    return;
                end
                % check to see if another ship is in the way
                for k=0:2	% check through the length of the ship
                    if playergrid(DesrLoc,DescLoc+k) ~= 0 % if there is another ship leave for loop
                        Desagain=1;		% update control variable
                        handles.setShip = false;
                        guidata(hObject,handles);
                        return;
                    else
                        Desagain=0;		% update control variable
                    end
                end
            else				% vertical case
                % check to see if another ship is in the way
                for k=0:2	% check through the length of the ship
                    if playergrid(DesrLoc+k,DescLoc) ~= 0	% if there is another ship, leave for loop
                        Desagain=1;		% update control variable
                        handles.setShip = false;
                        guidata(hObject,handles);
                        return;
                    else
                        Desagain=0;		% update control variable
                    end
                end
            end
        end
        if orientation == 'h'
            % place horizontal Destroyer numbers into computer grid
            playergrid(DesrLoc,DescLoc:(DescLoc+2))=HDes;
        else
            % place vert Destroyer numbers into computer grid
            playergrid(DesrLoc:(DesrLoc+2),DescLoc)=VDes;
        end
        playergrid
        handles.pgrid = playergrid;
        guidata(hObject,handles);

    case 1
        HPT=[1 1];					% horizontal PT Boat
        VPT=[1;1];					% vertical PT Boat
        PTcLoc = xCord;		% PT column starting loc - rand column 1-9
        PTrLoc = yCord;		% PT random row loc
        PTagain=1;			% control variable

        while PTagain		% test control variable
            if orientation == 'h'		% horizontal case
                if(PTcLoc > 9)
                    handles.setShip = false;
                    guidata(hObject,handles);
                    return;
                end
                % check to see if another ship is in the way
                for k=0:1	% check through the length of the ship
                    if playergrid(PTrLoc,PTcLoc+k) ~= 0 % if there is another ship leave for loop
                        PTagain=1;		% update control variable
                        handles.setShip = false;
                        guidata(hObject,handles);
                        return;
                    else
                        PTagain=0;		% update control variable
                    end
                end
            else				% vertical case
                % check to see if another ship is in the way
                for k=0:1	% check through the length of the ship
                    if playergrid(PTrLoc+k,PTcLoc) ~= 0	% if there is another ship, leave for loop
                        PTagain=1;		% update control variable
                        handles.setShip = false;
                        guidata(hObject,handles);
                        return;
                    else
                        PTagain=0;		% update control variable
                    end
                end
            end
        end
        if orientation == 'h'
            % place horizontal PT Boat numbers into computer grid
            playergrid(PTrLoc,PTcLoc:(PTcLoc+1))=HPT;
        else
            % place vert PT Boat numbers into computer grid
            playergrid(PTrLoc:(PTrLoc+1),PTcLoc)=VPT;
        end
        playergrid
        handles.pgrid = playergrid;
        guidata(hObject,handles);
end

handles.setShip = true;
guidata(hObject,handles);

return