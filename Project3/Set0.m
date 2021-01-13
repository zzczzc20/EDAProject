function [SetOfIte, StartMeUp] = Set0(OriSet, VarId, IteId)
    %Set0 - Description
    %
    % Syntax: [SetOfIte, StartMeUp] = Set0(OriSet, VarId, IteId)
    %
    % Long description
        ctr = 0;
        cg = OriSet.Get(IteId);
        if (cg.FirstType == 'x')
            if (OriSet.Get(IteId).FirstVaribleId == VarId)
                cg.FirstType = '0';
            end
        else
            if (cg.FirstType == 'F')
                [OriSet, Fid] = Set0(OriSet, VarId, cg.FirstFunctionId);
                cg.FirstFunctionId = Fid;
            else
                ctr = ctr + 1;
            end
        end
        if (cg.SecondType == 'x')
            if (cg.SecondVaribleId == VarId)
                cg.SecondType = '0';
            end
        else
            if (cg.SecondType == 'F')
                [OriSet, Fid] = Set0(OriSet, VarId, cg.SecondFunctionId);
                cg.SecondFunctionId = Fid;
            else
                ctr = ctr + 1;
            end
        end
        if (cg.ThirdType == 'x')
            if (cg.ThirdVaribleId == VarId)
                cg.ThirdType = '0';
            end
        else
            if (cg.ThirdType == 'F')
                [OriSet, Fid] = Set0(OriSet, VarId, cg.ThirdFunctionId);
                cg.ThirdFunctionId = Fid;
            else
                ctr = ctr + 1;
            end
        end
        if (ctr == 3)
            SetOfIte = OriSet;
            StartMeUp = IteId;
        else
            cg.id = -(OriSet.size() + 1);
            SetOfIte = OriSet.push(cg);
            StartMeUp = cg.id;
        end
end