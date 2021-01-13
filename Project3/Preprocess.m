function SetOfIte = Preprocess(OriSet, IteId)
%Preprocess - Description
%
% Syntax: SetOfIte = Preprocess(OriSet, IteId)
%
% Long description
    if (OriSet.Get(IteId).FirstType == '+')
        [OriSet, StartMeUp, Type_] = Set1(OriSet, OriSet.Get(IteId).FirstVaribleId, OriSet.Get(IteId).FirstFunctionId);
        ncg = IntelligentChangeIte(Type_, StartMeUp, OriSet.Get(IteId), 1);
        OriSet = OriSet.Set(IteId, ncg);
    else
        if (OriSet.Get(IteId).FirstType == '-')
            [OriSet, StartMeUp, Type_] = Set0(OriSet, OriSet.Get(IteId).FirstVaribleId, OriSet.Get(IteId).FirstFunctionId);
            ncg = IntelligentChangeIte(Type_, StartMeUp, OriSet.Get(IteId), 1);
            OriSet = OriSet.Set(IteId, ncg);
        end
    end

    if (OriSet.Get(IteId).SecondType == '+')
        [OriSet, StartMeUp, Type_] = Set1(OriSet, OriSet.Get(IteId).SecondVaribleId, OriSet.Get(IteId).SecondFunctionId);
        ncg = IntelligentChangeIte(Type_, StartMeUp, OriSet.Get(IteId), 2);
        OriSet = OriSet.Set(IteId, ncg);
    else
        if (OriSet.Get(IteId).SecondType == '-')
            [OriSet, StartMeUp, Type_] = Set0(OriSet, OriSet.Get(IteId).SecondVaribleId, OriSet.Get(IteId).SecondFunctionId);
            ncg = IntelligentChangeIte(Type_, StartMeUp, OriSet.Get(IteId), 2);
            OriSet = OriSet.Set(IteId, ncg);
        end
    end

    if (OriSet.Get(IteId).ThirdType == '+')
        [OriSet, StartMeUp, Type_] = Set1(OriSet, OriSet.Get(IteId).ThirdVaribleId, OriSet.Get(IteId).ThirdFunctionId);
        ncg = IntelligentChangeIte(Type_, StartMeUp, OriSet.Get(IteId), 3);
        OriSet = OriSet.Set(IteId, ncg);
    else
        if (OriSet.Get(IteId).ThirdType == '-')
            [OriSet, StartMeUp, Type_] = Set0(OriSet, OriSet.Get(IteId).ThirdVaribleId, OriSet.Get(IteId).ThirdFunctionId);
            ncg = IntelligentChangeIte(Type_, StartMeUp, OriSet.Get(IteId), 3);
            OriSet = OriSet.Set(IteId, ncg);
        end
    end

    SetOfIte = OriSet;
end