function RealPossibleSolution = DeDuplicateSolutions(PossibleSolution)
%DeDuplicateSolutions - Description
%
% Syntax: RealPossibleSolution = DeDuplicateSolutions(PossibleSolution)
%
% Long description
    if (length(PossibleSolution) == 0)
        RealPossibleSolution = [];
        return;
    else
        RealPossibleSolution = [PossibleSolution(1)];
    end
    for index = 2:length(PossibleSolution)
        CurrentSolution = PossibleSolution(index);
        tag = true;
        for cid = 1:(index - 1)
            if (CurrentSolution.isEqual(PossibleSolution(cid)))
                tag = false;
            end
        end
        if (tag)
            RealPossibleSolution = [RealPossibleSolution CurrentSolution];
        end
    end
end