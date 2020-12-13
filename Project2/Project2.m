function output = Project2(TestFile)
%Project2 - Description
%
% Syntax: output = Project2(TestFile)
%
% Long description
    [NodeSet, DependencySet, T0, StartMeUp] = SetConstructor(TestFile);
    TargetMethod = ASAP(NodeSet, DependencySet, StartMeUp, T0);
    %disp('--------------------------------------------------');
    TargetMethod.Print();
    [cost_, MaxNumOfAdders, MaxNumOfMultipliers] = TargetMethod.GetCost()
end