function [can] = SingleDirectionFinder(MOS_SET, Port_SET, CurrentPort, CurrentCell, TargetCell)
%SingleDirectionFinder - Description
%
% Syntax: [can] = SingleDirectionFinder(MOS_SET, Port_SET, CurrentPort, CurrentCell, TargetCell)
%
% Long description
    assert(length(Port_SET.Get(CurrentPort).cell) ~= 0);
    if (length(Port_SET.Get(CurrentPort).cell) == 1)
        can = false;
    else
        if (length(Port_SET.Get(CurrentPort).cell) == 2)
            assert(CurrentCell ~= TargetCell);
            if (CurrentPort == 2 || CurrentPort == 3)
                can = false;
            else
                if (Port_SET.Get(CurrentPort).cell(1) == TargetCell || Port_SET.Get(CurrentPort).cell(2) == TargetCell)
                    can = true;
                else
                    if (Port_SET.Get(CurrentPort).cell(1) == CurrentCell)
                        NextCell = Port_SET.Get(CurrentPort).cell(2);
                    else
                        NextCell = Port_SET.Get(CurrentPort).cell(1);
                    end
                    can = SingleDirectionFinder(MOS_SET, Port_SET, MOS_SET.Get(NextCell).GetAnotherPort(CurrentPort), NextCell, TargetCell);
                end
            end
        else
            can = false;
        end
    end
end