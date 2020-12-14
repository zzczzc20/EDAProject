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
        AcL = ActiveLayer.content;
        for aid = 1:ActiveLayer.size()
            CurrentNodeIndex = NodeSet.FindId(ActiveLayer.content(aid));
            if (NodeSet.content(CurrentNodeIndex).type == 'd' && StateArray(CurrentNodeIndex) == 0)
                StateArray(CurrentNodeIndex) = 2;
            else
                StateArray(CurrentNodeIndex) = 1;
            end
            assert(length(CurrentNodeIndex) == 1);
            for fid = 1:NodeSet.Get(ActiveLayer.content(aid)).Output.size()
                CurrentDependency = NodeSet.Get(ActiveLayer.content(aid)).Output.content(fid);
                CurrentDestination = DependencySet.Get(CurrentDependency).to;
                %assert(StateArray(NodeSet.FindId(CurrentDestination)) == 0 || StateArray(NodeSet.FindId(CurrentDestination)) == 2);
                CurrentDestinationIndex = NodeSet.FindId(CurrentDestination);
                NodeSet.content(CurrentDestinationIndex) = NodeSet.content(CurrentDestinationIndex).DeleteInput(CurrentDependency);
                if (NodeSet.content(CurrentNodeIndex).type ~= 'd')
                    if (TargetMethod.StartTime(CurrentDestinationIndex) < TargetMethod.StartTime(CurrentNodeIndex) + DependencySet.content(CurrentDependency).weight)
                        TargetMethod.StartTime(CurrentDestinationIndex) = TargetMethod.StartTime(CurrentNodeIndex) + DependencySet.content(CurrentDependency).weight;
                    end                   
                end
            end
        end
        %disp('print Node Set');
        %NodeSet.Print();
        %disp('\print Node Set');
        ActiveLayer = SET(WhoAreReady(NodeSet, StateArray));
    end
end