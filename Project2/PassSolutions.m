function SolutionArray = PassSolutions(TabuQueue, PossibleSolution)
%PassSolutions - Description
%
% Syntax: SolutionArray = PassSolutions(TabuQueue, PossibleSolution)
%
% Long description
    SolutionArray = [];
    tabu = TabuQueue.content;
    for index = 1:length
        CurrentSolution = PossibleSolution(index);
        tag = true;
        for tid = 1:length(tabu)
            if (CurrentSolution.isEqual(tabu(tid)))
                tag = false;
            end
        end
        if (tag)
            SolutionArray = [SolutionArray CurrentSolution];
        end
    end
end