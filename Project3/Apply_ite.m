function [SetOfIte, StartMeUp] = Apply_ite(OriSet, VarId, IteId)
%Apply_ite - Description
%
% Syntax: [SetOfIte, StartMeUp] = Apply_ite(OriSet, VarId, IteId)
%
% Long description
    OriIte = OriSet.GetId(IteId);
    [OriSet, LeftStatus] = Set1(OriSet, VarId, IteId);
    [OriSet, RightStatus] = Set0(OriSet, VarId, IteId);
    [OriSet, LeftStatus] = Apply_ite(OriSet, VarId + 1, LeftStatus);
    [OriSet, RightStatus] = Apply_ite(OriSet, VarId + 1, RightStatus);
    OriIte.FirstType = 'x';
    OriIte.FirstVaribleId = VarId;
    OriIte.SecondType = 'F';
    OriIte.SecondFunctionId = LeftStatus;
    OriIte.ThirdType = 'F';
    OriIte.ThirdFunctionId = RightStatus;
    OriIte.id = -(OriSet.size() + 1);
    SetOfIte = OriSet.push(OriIte);
    StartMeUp = OriIte.id;
end