function ite = IntelligentChangeIte(rtype, Fid, cg, option)
%IntelligentChangeIte - Description
%
% Syntax: ite = IntelligentChangeIte(rtype, Fid, cg, option)
%
% Long description
    if (option == 1)
        if (rtype == 'F')
            cg.FirstFunctionId = Fid;
            cg.FirstType = 'F';
        elseif (rtype == 'x')
            cg.FirstType = 'x';
            cg.FirstVaribleId = Fid;
        else
            if (rtype == '0' || rtype == '1')
                cg.FirstType = rtype;
            end
        end
    elseif (option == 2)
        if (rtype == 'F')
            cg.SecondFunctionId = Fid;
            cg.SecondType = 'F';
        elseif (rtype == 'x')
            cg.SecondType = 'x';
            cg.SecondVaribleId = Fid;
        else
            if (rtype == '0' || rtype == '1')
                cg.SecondType = rtype;
            end
        end
    else
        assert(option == 3);
        if (rtype == 'F')
            cg.ThirdFunctionId = Fid;
            cg.ThirdType = 'F';
        elseif (rtype == 'x')
            cg.ThirdType = 'x';
            cg.ThirdVaribleId = Fid;
        else
            if (rtype == '0' || rtype == '1')
                cg.ThirdType = rtype;
            end
        end
    end
    ite = cg;
end