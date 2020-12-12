function ReadyList = WhoAreReady(NodeSet, StateArray)
%WhoAreReady - Description
%
% Syntax: ReadyList = WhoAreReady(NodeSet, StateArray)
%
% Long description
    ReadyList = [];
    for index = 1:NodeSet.size()
        if (StateArray[index] == 0)
            if (length(NodeSet.content[index].Input) == 0)
                ReadyList = [ReadyList NodeSet.content[index].id];
            end
        end
    end
end