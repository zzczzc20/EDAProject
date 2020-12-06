function [MOS_SET, Port_SET] = IntelligentDelete(MOS_SET, Port_SET, Del_SET)
%IntelligentDelete - Description
%
% Syntax: [MOS_SET, Port_SET] = IntelligentDelete(MOS_SET, Port_SET, Del_SET)
%
% Long description
    for index = 1:length(Del_SET)
        CurrentMOS = MOS_SET.Get(Del_SET(index));
        Port_SET.content(CurrentMOS.Source) = Port_SET.content(CurrentMOS.Source).DelCell(Del_SET(index));
        Port_SET.content(CurrentMOS.Drain) = Port_SET.content(CurrentMOS.Drain).DelCell(Del_SET(index));
    end
    MOS_SET = MOS_SET.DeleteId(Del_SET);    
end