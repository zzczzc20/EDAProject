function [MOS_SET_, Port_SET] = AndCheck(MOS_SET, Port_SET, Portid)
%AndCheck - Description
%
% Syntax: [MOS_SET_, Port_SET_] = AndCheck(MOS_SET, Port_SET, Portid)
%
% Long description
    del_set = [];
    CellList = Port_SET.Get(Portid).cell;
    for index = 1:length(CellList)
        CurrentPort = Port_SET.Get(MOS_SET.Get(CellList(index)).GetAnotherPort(Portid));
        if(CurrentPort.state == 0 && CurrentPort.id ~= 3 && length(CurrentPort.cell) == 2)
            MOS_SET.content(MOS_SET.FindId(CurrentPort.cell(1))) = MOS_SET.content(MOS_SET.FindId(CurrentPort.cell(1))).AndNMerge(MOS_SET.Get(CurrentPort.cell(2)), CurrentPort.id);
            del_set = [del_set CurrentPort.cell(2)];
            ChangedId = MOS_SET.Get(CurrentPort.cell(2)).GetAnotherPort(CurrentPort.id);
            ChangedList = Port_SET.Get(ChangedId).cell;
            for cid = 1:length(ChangedList)
                if (ChangedList(cid) == CurrentPort.cell(2))
                    ChangedList(cid) = CurrentPort.cell(1);
                    break;
                end
            end
            Port_SET.content(Port_SET.FindId(ChangedId)).cell = ChangedList;
            Port_SET.content(Port_SET.FindId(ChangedId)).state = 2;
        end
    end

    MOS_SET_ = MOS_SET.DeleteId(del_set);
end