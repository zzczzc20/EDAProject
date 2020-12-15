function OpMethod = TabuSearch(NodeSet, DependencySet, InitialSolution, k, ReTimes, TimeConstraint)
%TabuSearch - Description
%
% Syntax: OpMethod = TabuSearch(NodeSet, DependencySet, InitialSolution, k, ReTimes, TimeConstraint)
%
% Long description
    Counter = 2000;
    G = [InitialSolution];
    Tabu = Queue(k);
    Tabu = Tabu.push(InitialSolution);
    BestSolution = InitialSolution;
    LowwestCost = InitialSolution.GetCost();
    CurrentSolution = InitialSolution;
    while (length(G) ~= 0 && Counter >= 0)
        Counter = Counter - 1;
        G = [];
        for index = 1:ReTimes
            G = [G RandomSolutionGenerator(CurrentSolution, NodeSet, DependencySet, TimeConstraint)];
        end

        G = DeDuplicateSolutions(G);

        G = PassSolutions(Tabu, G);
        MinCost = inf;
        for index = 1:length(G)
            if (G(index).GetCost() < MinCost)
                MinSolution = G(index);
                MinCost = G(index).GetCost();
            end
        end
        if (MinCost ~= inf)
            CurrentSolution = MinSolution
            Tabu = Tabu.push(CurrentSolution);
            [cost_, MaxNumOfAdders, MaxNumOfMultipliers] = CurrentSolution.GetCost()
        end
        if (CurrentSolution.GetCost() < BestSolution.GetCost())
            BestSolution = CurrentSolution;
        end
    end

    OpMethod = BestSolution;
end