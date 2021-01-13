function Project3(TestFile)
%myFun - Description
%
% Syntax: Projec3(TestFile)
%
% Long description
    % Test of set constructor
    [SetOfIte, pmat, PrintList] = SetConstructor(TestFile);
    %SetOfIte.Print();\
    %{
    for index = 1:SetOfIte.size()
        SetOfIte.content(index)
    end
    %}
    NumOfVars = length(pmat);
    for index = 1:length(PrintList)
        CurrentId = PrintList(index);
        [SetOfIte, StartMeUp] = Apply_ite(SetOfIte, 1, CurrentId, NumOfVars);
        %SetOfIndexPrint(SetOfIte);
        %StartMeUp
        text = SetOfIte.Get(StartMeUp).PlainText(SetOfIte);
        disp(text);
    end
end