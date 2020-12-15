function Method = RandomSolutionGenerator(SrcMethod, NodeSet, DependencySet, TimeConstraint)
%RandomSolutionGenerator - Description
%
% Syntax: Method = RandomSolutionGenerator(SrcMethod, NodeSet, DependencySet, TimeConstraint)
%
% Long description
    AvailableRangeX = AvailableRange(SrcMethod, NodeSet, DependencySet, TimeConstraint);
    NumOfNode = NodeSet.size();
    ChangeWho = 0;
    while (true)
        ChangeWho = randi([1, NumOfNode]);
        if(AvailableRangeX.SingleVariationEarly(ChangeWho) ~=AvailableRangeX.SingleVariationLate(ChangeWho))
            break;
        end
    end
    %ChangeWho
    Low = AvailableRangeX.SingleVariationEarly(ChangeWho);
    High = AvailableRangeX.SingleVariationLate(ChangeWho);
    SrcMethod.StartTime(ChangeWho) = randi([AvailableRangeX.SingleVariationEarly(ChangeWho), AvailableRangeX.SingleVariationLate(ChangeWho)]);
    Method = SrcMethod;
end