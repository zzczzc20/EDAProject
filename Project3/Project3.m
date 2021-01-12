function Project3(TestFile)
%myFun - Description
%
% Syntax: Projec3(TestFile)
%
% Long description
    % Test of set constructor
    [SetOfIte, pmat, PrintList] = SetConstructor(TestFile);
    %SetOfIte.Print();
    for index = 1:SetOfIte.size()
        SetOfIte.content(index)
    end
    NumOfVars = length(pmat);
    PrintList
end