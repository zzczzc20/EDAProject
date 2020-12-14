function TargetMethod = ALAP(NodeSet, DependencySet)
%ALAP - Description
%
% Syntax: TargetMethod = ALAP(NodeSet, DependencySet)
%
% Long description
    [NodeSet, DependencySet] = QuantumInversion(NodeSet, DependencySet);
    StartMeUp = [];
    for index = 1:NodeSet.size()
        if (NodeSet.content(index).type == 'i')
            StartMeUp = [StartMeUp NodeSet.content(index).id];
        end
    end
    TargetMethod = ASAP(NodeSet, DependencySet, StartMeUp, 0);
    disp("--------------------debug-------------------------------");
    TargetMethod.Print();
    disp("--------------------\debug-------------------------------");
    TargetMethod = TargetMethod.MethodInversion();
end