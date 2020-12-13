function TargetMethod = ASAP(NodeSet, DependencySet, StartMeUp, T0)
%ASAP - Description
%
% Syntax: TargetMethod = ASAP(NodeSet, DependencySet, StartMeUp)
%
% Long description
    ActiveLayer = SET([]);
    TargetMethod = method(GetDurationArray(NodeSet, T0), GetTypeArray(NodeSet));
    ActiveLayer = ActiveLayer.push(StartMeUp);
    StateArray = zeros(1, NodeSet.size());
    %0->undiscover 1->discover
    while (ActiveLayer.size() ~= 0)
        for aid = 1:ActiveLayer.size()
            CurrentNodeIndex = NodeSet.FindId(ActiveLayer.content(aid));
            StateArray(CurrentNodeIndex) = 1;
            assert(length(CurrentNodeIndex) == 1);
            for fid = 1:NodeSet.Get(ActiveLayer.content(aid)).Output.size()
                CurrentDependency = NodeSet.Get(ActiveLayer.content(aid)).Output.content(fid);
                CurrentDestination = DependencySet.Get(CurrentDependency).to;
                assert(StateArray(NodeSet.FindId(CurrentDestination)) == 0);
                CurrentDestinationIndex = NodeSet.FindId(CurrentDestination);
                NodeSet.content(CurrentDestinationIndex) = NodeSet.content(CurrentDestinationIndex).DeleteInput(CurrentDependency);
                if (TargetMethod.StartTime(CurrentDestinationIndex) < TargetMethod.StartTime(CurrentNodeIndex) + TargetMethod.Duration(CurrentNodeIndex))
                    TargetMethod.StartTime(CurrentDestinationIndex) = TargetMethod.StartTime(CurrentNodeIndex) + TargetMethod.Duration(CurrentNodeIndex);
                end
            end
        end
        ActiveLayer = SET(WhoAreReady(NodeSet, StateArray));
    end
end