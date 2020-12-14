function OpMethod = TabuSearch(NodeSet, DependencySet, InitialSolution, k)
%TabuSearch - Description
%
% Syntax: OpMethod = TabuSearch(NodeSet, DependencySet, InitialSolution, k)
%
% Long description
    Counter = 10000;
    G = [InitialSolution];
    Tabu = Queue(k);
    BestSolution = InitialSolution;
    LowwestCost = InitialSolution.GetCost();
    CurrentSolution = InitialSolution;
    while (length(G) ~= 0 && Counter >= 0)
        Counter++;
        


        if (CurrentSolution.GetCost() < BestSolution.GetCost())
            BestSolution = CurrentSolution;
        end
    end

    OpMethod = BestSolution;
end