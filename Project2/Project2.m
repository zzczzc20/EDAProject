function output = Project2(TestFile)
%Project2 - Description
%
% Syntax: output = Project2(TestFile)
%
% Long description
    [NodeSet, DependencySet, T0, StartMeUp] = SetConstructor(TestFile);
    %{
    NodeSet.Print();
    DependencySet.Print();
    %}
    [NodeSet, DependencySet] = OperationsToRemoveD(NodeSet, DependencySet);
    %{
    disp("-------------------------")
    NodeSet.Print();
    DependencySet.Print();
    %}
    TargetMethod = ASAP(NodeSet, DependencySet, StartMeUp, T0)
    %disp('--------------------------------------------------');
    %TargetMethod.Print();
    [cost_, MaxNumOfAdders, MaxNumOfMultipliers] = TargetMethod.GetCost()
    %aran = AvailableRange(TargetMethod, NodeSet, DependencySet);
    %aran.SingleVariationEarly
    %aran.SingleVariationLate
    ALAPMethod = ALAP(NodeSet, DependencySet)
    %ALAPMethod.Print();
    [cost_, MaxNumOfAdders, MaxNumOfMultipliers] = ALAPMethod.GetCost()
    %aran = AvailableRange(ALAPMethod, NodeSet, DependencySet);
    %aran.SingleVariationEarly
    %aran.SingleVariationLate
    %TargetMethod
    %ALAPMethod
    %Method = RandomSolutionGenerator(TargetMethod, NodeSet, DependencySet)
    OpMethod = TabuSearch(NodeSet, DependencySet, TargetMethod, 200, 20, 10)
    [cost_, MaxNumOfAdders, MaxNumOfMultipliers] = OpMethod.GetCost()
end