function OpMethod = TabuSearch(NodeSet, DependencySet, InitialSolution, k, ReTimes)
%TabuSearch - Description
%
% Syntax: OpMethod = TabuSearch(NodeSet, DependencySet, InitialSolution, k, ReTimes)
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
        Counter = Counter + 1;
        G = [];
        for index = 1:ReTimes
            G = [G RandomSolutionGenerator(InitialSolution, NodeSet, DependencySet)];
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
            CurrentSolution = MinSolution;
            Tabu = Tabu.push(CurrentSolution);
        end
        if (CurrentSolution.GetCost() < BestSolution.GetCost())
            BestSolution = CurrentSolution;
        end
    end

    OpMethod = BestSolution;
end