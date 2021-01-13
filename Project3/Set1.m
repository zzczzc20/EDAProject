function [SetOfIte, StartMeUp, Type_] = Set1(OriSet, VarId, IteId)
%Set1 - Description
%
% Syntax: [SetOfIte, StartMeUp, Type_] = Set1(OriSet, VarId, IteId)
%
% Long description
    OriSet = Preprocess(OriSet, IteId);
    ctr = 0;
    cg = OriSet.Get(IteId);
    %cg(1)
    if (cg.FirstType == 'x')
        if (OriSet.Get(IteId).FirstVaribleId == VarId)
            cg.FirstType = '1';
        else
            ctr = ctr + 1;
        end
    else
        if (cg.FirstType == 'F')
            [OriSet, Fid, rtype] = Set1(OriSet, VarId, cg.FirstFunctionId);
            cg = IntelligentChangeIte(rtype, Fid, cg, 1);
        else
            ctr = ctr + 1;
        end
    end
    if (cg.SecondType == 'x')
        if (cg.SecondVaribleId == VarId)
            cg.SecondType = '1';
        else
            ctr = ctr + 1;
        end
    else
        if (cg.SecondType == 'F')
            [OriSet, Fid, rtype] = Set1(OriSet, VarId, cg.SecondFunctionId);
            cg = IntelligentChangeIte(rtype, Fid, cg, 2);
        else
            ctr = ctr + 1;
        end
    end
    if (cg.ThirdType == 'x')
        if (cg.ThirdVaribleId == VarId)
            cg.ThirdType = '1';
        else
            ctr = ctr + 1;
        end
    else
        if (cg.ThirdType == 'F')
            [OriSet, Fid, rtype] = Set1(OriSet, VarId, cg.ThirdFunctionId);
            cg = IntelligentChangeIte(rtype, Fid, cg, 3);
        else
            ctr = ctr + 1;
        end
    end
    if (ctr == 3)
        SetOfIte = OriSet;
        StartMeUp = IteId;
        Type_ = 'F';
    else
        [SetOfIte, StartMeUp, Type_] = IntelligentReturn(OriSet, cg);
    end

end