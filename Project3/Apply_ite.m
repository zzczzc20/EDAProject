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
        %SetOfIte = OriSet;
        %StartMeUp = IteId;
        %rtype = 'F';
        cg = OriSet.Get(IteId);
        if (cg.FirstType == '1')
            if (cg.SecondType == '1' || cg.SecondType == '0')
                SetOfIte = OriSet;
                Type_ = cg.SecondType;
                StartMeUp = 0;
            elseif (cg.SecondType == 'F')
                SetOfIte = OriSet;
                Type_ = 'F';
                StartMeUp = cg.SecondFunctionId;
            else
                if (cg.SecondType == 'x')
                    SetOfIte = OriSet;
                    Type_ = 'x';
                    StartMeUp = cg.SecondVaribleId;
                end
            end
        elseif (cg.FirstType == '0')
            if (cg.ThirdType == '1' || cg.ThirdType == '0')
                SetOfIte = OriSet;
                Type_ = cg.ThirdType;
                StartMeUp = 0;
            elseif (cg.ThirdType == 'F')
                SetOfIte = OriSet;
                Type_ = 'F';
                StartMeUp = cg.ThirdFunctionId;
            else
                if (cg.ThirdType == 'x')
                    SetOfIte = OriSet;
                    Type_ = 'x';
                    StartMeUp = cg.ThirdVaribleId;
                end
            end
        else
            if (cg.SecondType == '1' && cg.ThirdType == '0')
                if (cg.FirstType == '1' || cg.FirstType == '0')
                    SetOfIte = OriSet;
                    Type_ = cg.FirstType;
                    StartMeUp = 0;
                elseif (cg.FirstType == 'F')
                    SetOfIte = OriSet;
                    Type_ = 'F';
                    StartMeUp = cg.FirstFunctionId;
                else
                    if (cg.FirstType == 'x')
                        SetOfIte = OriSet;
                        Type_ = 'x';
                        StartMeUp = cg.FirstVaribleId;
                    end
                end
            else
                if (cg.SecondType == '1' && cg.ThirdType == '1')
                    Type_ = '1';
                    StartMeUp = 0;
                    SetOfIte = OriSet;
                elseif (cg.SecondType == '0' && cg.ThirdType == '0')
                    Type_ = '0';
                    StartMeUp = 0;
                    SetOfIte = OriSet;
                else
                    if (cg.SecondType == 'x' && cg.ThirdType == 'x' && cg.SecondVaribleId == cg.ThirdVaribleId)
                        Type_ = 'x';
                        StartMeUp = cg.SecondVaribleId;
                        SetOfIte = OriSet;
                    elseif (cg.SecondType == 'F' && cg.ThirdType == 'F' && cg.SecondFunctionId == cg.ThirdFunctionId)
                        Type_ = 'F';
                        StartMeUp = cg.SecondFunctionId;
                        SetOfIte = OriSet;
                    else
                        SetOfIte = OriSet;
                        StartMeUp = IteId;
                        Type_ = 'F';
                    end
                end
            end
        end
        rtype = Type_;
    else
        [OriSet, LeftStatus, Lrtype] = Set1(OriSet, VarId, IteId);
        %SetOfIndexPrint(OriSet);
        [OriSet, RightStatus, Rrtype] = Set0(OriSet, VarId, IteId);
        %SetOfIndexPrint(OriSet);
        if (Lrtype == 'F')
            [OriSet, LeftStatus, Lrtype] = Apply_ite(OriSet, VarId + 1, LeftStatus, MaxVarId);
        end
        if (Rrtype == 'F')
            [OriSet, RightStatus, Rrtype] = Apply_ite(OriSet, VarId + 1, RightStatus, MaxVarId);
        end
        OriIte.FirstType = 'x';
        OriIte.FirstVaribleId = VarId;
        %Lrtype
        %LeftStatus
        %Rrtype
        %RightStatus
        OriIte = IntelligentChangeIte(Lrtype, LeftStatus, OriIte, 2);
        OriIte = IntelligentChangeIte(Rrtype, RightStatus, OriIte, 3);
        [SetOfIte, StartMeUp, rtype] = IntelligentReturn(OriSet, OriIte);
    end
end