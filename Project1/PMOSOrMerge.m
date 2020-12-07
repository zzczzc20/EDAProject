function [MOS_SET, Port_SET] = PMOSOrMerge(MOS_SET, Port_SET, id1, id2)
%PMOSOrMerge - Description
%
% Syntax: [MOS_SET, Port_SET] = PMOSOrMerge(MOS_SET, Port_SET, id1, id2)
%
% Long description
    MOS_SET.content(MOS_SET.FindId(id1)).Gate = "OR("+MOS_SET.content(MOS_SET.FindId(id1)).Gate+", "+MOS_SET.content(MOS_SET.FindId(id2)).Gate+")";
    port1 = MOS_SET.Get(id2).Source;
    port2 = MOS_SET.Get(id2).Drain;
    Port_SET.content(port1) = Port_SET.content(port1).DelCell(id2);
    Port_SET.content(port2) = Port_SET.content(port2).DelCell(id2);
    assert((port1 ~= 2 || port2 ~= 3) && (port2 ~= 2 || port1 ~= 3));
    if (port1 == 2 || port1 == 3)
        ChosenPort = port1;
        FinishPort = port2;
        Port_SET.content(port2) = Port_SET.content(port2).Finish();
    else
        ChosenPort = port2;
        FinishPort = port1;
        Port_SET.content(port1) = Port_SET.content(port1).Finish();
    end
    for index = 1:length(Port_SET.Get(FinishPort).cell)
        CurrentMOSId = Port_SET.Get(FinishPort).cell(index);
        Port_SET.content(ChosenPort) = Port_SET.content(ChosenPort).AddCell(CurrentMOSId);
        if (MOS_SET.content(MOS_SET.FindId(CurrentMOSId)).Source == FinishPort)
            MOS_SET.content(MOS_SET.FindId(CurrentMOSId)).Source = ChosenPort;
        else
            assert(MOS_SET.content(MOS_SET.FindId(CurrentMOSId)).Drain == FinishPort);
            MOS_SET.content(MOS_SET.FindId(CurrentMOSId)).Drain = ChosenPort;
        end
    end
    MOS_SET = MOS_SET.DeleteId(id2);
end