function Method = RandomSolutionGenerator(SrcMethod, NodeSet, DependencySet)
%RandomSolutionGenerator - Description
%
% Syntax: Method = RandomSolutionGenerator(SrcMethod, NodeSet, DependencySet)
%
% Long description
    AvailableRangeX = AvailableRange(SrcMethod, NodeSet, DependencySet);
    NumOfNode = NodeSet.size();
    ChangeWho = 0;
    while (true)
        ChangeWho = randi([1, NumOfNode]);
        if(AvailableRangeX.SingleVariationEarly(ChangeWho) ~=AvailableRangeX.SingleVariationLate(ChangeWho))
            break;
        end
    end
    SrcMethod.StartTime(ChangeWho) = randi([AvailableRangeX.SingleVariationEarly(ChangeWho), AvailableRangeX.SingleVariationLate(ChangeWho)]);
    Method = SrcMethod;
end