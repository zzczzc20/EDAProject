function [SetOfIte, StartMeUp, Type_] = IntelligentReturn(OriSet, cg)
%IntelligentReturn - Description
%
% Syntax: [SetOfIte, StartMeUp, Type] = IntelligentReturn(OriSet, cg)
%
% Long description
% This is the kernel, the spirit of ROBDD simplification.
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
                Discover = 0;
                for index = 1:OriSet.size()
                    Cite = OriSet.content(index);
                    counter = 0;
                    if (Cite.FirstType == cg.FirstType)
                        switch (cg.FirstType)
                        case '0'
                            counter = counter + 1;
                        case '1'
                            counter = counter + 1;
                        case 'x'
                            if (Cite.FirstVaribleId == cg.FirstVaribleId)
                                counter = counter + 1;
                            end
                        case 'F'
                            if (Cite.FirstFunctionId == cg.FirstFunctionId)
                                counter = counter + 1;
                            end
                        end
                    end

                    if (Cite.SecondType == cg.SecondType)
                        switch (cg.SecondType)
                        case '0'
                            counter = counter + 1;
                        case '1'
                            counter = counter + 1;
                        case 'x'
                            if (Cite.SecondVaribleId == cg.SecondVaribleId)
                                counter = counter + 1;
                            end
                        case 'F'
                            if (Cite.SecondFunctionId == cg.SecondFunctionId)
                                counter = counter + 1;
                            end
                        end
                    end

                    if (Cite.ThirdType == cg.ThirdType)
                        switch (cg.ThirdType)
                        case '0'
                            counter = counter + 1;
                        case '1'
                            counter = counter + 1;
                        case 'x'
                            if (Cite.ThirdVaribleId == cg.ThirdVaribleId)
                                counter = counter + 1;
                            end
                        case 'F'
                            if (Cite.ThirdFunctionId == cg.ThirdFunctionId)
                                counter = counter + 1;
                            end
                        end
                    end
                    if (counter == 3)
                        Discover = 1;
                        TargetId = Cite.id;
                        break;
                    end
                end
                if (Discover == 1)
                    SetOfIte = OriSet;
                    StartMeUp = TargetId;
                    Type_ = 'F';
                else
                    cg.id = -(OriSet.size() + 1);
                    SetOfIte = OriSet.push(cg);
                    StartMeUp = cg.id;
                    Type_ = 'F';
                end
            end
        end
    end
end
end