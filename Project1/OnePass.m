function [MOS_SET, Port_SET] = OnePass(MOS_SET, Port_SET)
%OnePass - Description
%
% Syntax: [MOS_SET, Port_SET] = OnePass(MOS_SET, Port_SET)
%
% Long description
    for index = 1:Port_SET.size()
        if (Port_SET.content(index).state == 1)
            Port_SET.content(index).state = 0;
        end
    end
    ActiveLayer = [1];
    while (length(ActiveLayer) ~= 0)
        NeoActiveLayer = [];
        for index = 1:length(ActiveLayer)
            CurrentPortId = ActiveLayer(index);
            Port_SET.content(Port_SET.FindId(CurrentPortId)).state = 1;
            [MOS_SET, NeoCellList] = PortOrMerge(MOS_SET, Port_SET.content(Port_SET.FindId(CurrentPortId)).cell, CurrentPortId);
            Port_SET.content(Port_SET.FindId(CurrentPortId)).cell = NeoCellList;
            [MOS_SET, Port_SET] = AndCheck(MOS_SET, Port_SET, CurrentPortId);
            for cid = 1:length(Port_SET.content(Port_SET.FindId(CurrentPortId)).cell)
                CellId = Port_SET.content(Port_SET.FindId(CurrentPortId)).cell(cid);
                DiscussPort = MOS_SET.content(MOS_SET.FindId(CellId)).GetAnotherPort(CurrentPortId);
                if (DiscussPort ~= 3 && Port_SET.content(Port_SET.FindId(DiscussPort)).state == 0)
                    NeoActiveLayer = [NeoActiveLayer DiscussPort];    
                end
            end
        end
        ActiveLayer = NeoActiveLayer;
    end


end