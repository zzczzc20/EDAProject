function [SetOfIte, StartMeUp, rtype] = Apply_ite(OriSet, VarId, IteId, MaxVarId)
%Apply_ite - Description
%
% Syntax: [SetOfIte, StartMeUp, rtype] = Apply_ite(OriSet, VarId, IteId)
%
% Long description
%{
    if (IteId > -10)
        SetOfIndexPrint(OriSet)
        VarId
        IteId
    end
%}
    OriIte = OriSet.Get(IteId);
    if (VarId >= MaxVarId)
        SetOfIte = OriSet;
        StartMeUp = IteId;
    else
        [OriSet, LeftStatus, Lrtype] = Set1(OriSet, VarId, IteId);
        [OriSet, RightStatus, Rrtype] = Set0(OriSet, VarId, IteId);
        if (Lrtype == 'F')
            [OriSet, LeftStatus, Lrtype] = Apply_ite(OriSet, VarId + 1, LeftStatus, MaxVarId);
        end
        if (Rrtype == 'F')
            [OriSet, RightStatus, Rrtype] = Apply_ite(OriSet, VarId + 1, RightStatus, MaxVarId);
        end
        OriIte.FirstType = 'x';
        OriIte.FirstVaribleId = VarId;
        OriIte = IntelligentChangeIte(Lrtype, LeftStatus, OriIte, 2);
        OriIte = IntelligentChangeIte(Rrtype, RightStatus, OriIte, 3);
        [SetOfIte, StartMeUp, rtype] = IntelligentReturn(OriSet, OriIte);
    end
end