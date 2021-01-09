classdef ITE
    properties
        % First, we need a data structure to storage all information of the ITE statement
        FirstVaribleId;
        FirstFunctionId;
        FirstType;
        % '+': positive cofactor
        % '-': negative cofactor
        % 'x': just varible
        % 'F': just function
        % '0': 0
        % '1': 1
        SecondVaribleId;
        SecondFunctionId;
        SecondType;
        % '+': positive cofactor
        % '-': negative cofactor
        % 'x': just varible
        % 'F': just function
        % '0': 0
        % '1': 1
        ThirdVaribleId;
        ThirdFunctionId;
        ThirdType;
        % '+': positive cofactor
        % '-': negative cofactor
        % 'x': just varible
        % 'F': just function
        % '0': 0
        % '1': 1
        id;
    end
    methods
        function obj = ITE(InputString)
            for index = 1:length(InputString)
                if (InputString(index) == '=')
                    CI = index;
                    break;
                end
            end
            obj.id = DeriveIdFromText(InputString(1:(CI - 1)));
            for index = CI:length(InputString)
                if (InputString(index) == 'x' || InputString(index) == 'F' || InputString(index) == '0' || InputString(index) == '1')
                    CI = index;
                    break;
                end
            end
            FirstChar = InputString(CI);
            FirstStart = CI;
            for index = CI:length(InputString)
                if (InputString(index) == ',')
                    CI = index;
                    obj.FirstType = FirstChar;
                    break;
                end
                if (InputString(index) == '+')
                    CI = index;
                    obj.FirstType = '+';
                    break;
                end
                if (InputString(index) == '-')
                    CI = index;
                    obj.FirstType = '-';
                    break;
                end
            end
            if (FirstChar == 'x')
                obj.FirstVaribleId = DeriveIdFromText(InputString(FirstStart:(CI - 1)));
            else
                if (FirstChar == 'F')
                    obj.FirstFunctionId = DeriveIdFromText(InputString(FirstStart:(CI - 1)));
                end
            end
            if (obj.FirstType == '+')
                for index = CI:length(InputString)
                    if (InputString(index) == 'x')
                        CI = index;
                        FirstStart = index;
                        break;
                    end
                end
                for index = CI:length(InputString)
                    if (InputString(index) == ',')
                        CI = index;
                        break;
                    end
                end
                obj.FirstVaribleId = DeriveIdFromText(InputString(FirstStart:(CI - 1)));
            else
                if (obj.FirstType == '-')
                    for index = CI:length(InputString)
                        if (InputString(index) == 'x')
                            CI = index;
                            FirstStart = index;
                            break;
                        end
                    end
                    for index = CI:length(InputString)
                        if (InputString(index) == ',')
                            CI = index;
                            break;
                        end
                    end
                    obj.FirstVaribleId = DeriveIdFromText(InputString(FirstStart:(CI - 1)));   
                end           
            end



            for index = CI:length(InputString)
                if (InputString(index) == 'x' || InputString(index) == 'F' || InputString(index) == '0' || InputString(index) == '1')
                    CI = index;
                    break;
                end
            end
            FirstChar = InputString(CI);
            FirstStart = CI;
            for index = CI:length(InputString)
                if (InputString(index) == ',')
                    CI = index;
                    obj.SecondType = FirstChar;
                    break;
                end
                if (InputString(index) == '+')
                    CI = index;
                    obj.SecondType = '+';
                    break;
                end
                if (InputString(index) == '-')
                    CI = index;
                    obj.SecondType = '-';
                    break;
                end
            end
            if (FirstChar == 'x')
                obj.SecondVaribleId = DeriveIdFromText(InputString(FirstStart:(CI - 1)));
            else
                if (FirstChar == 'F')
                    obj.SecondFunctionId = DeriveIdFromText(InputString(FirstStart:(CI - 1)));
                end
            end
            if (obj.SecondType == '+')
                for index = CI:length(InputString)
                    if (InputString(index) == 'x')
                        CI = index;
                        FirstStart = index;
                        break;
                    end
                end
                for index = CI:length(InputString)
                    if (InputString(index) == ',')
                        CI = index;
                        break;
                    end
                end
                obj.SecondVaribleId = DeriveIdFromText(InputString(FirstStart:(CI - 1)));
            else
                if (obj.SecondType == '-')
                    for index = CI:length(InputString)
                        if (InputString(index) == 'x')
                            CI = index;
                            FirstStart = index;
                            break;
                        end
                    end
                    for index = CI:length(InputString)
                        if (InputString(index) == ',')
                            CI = index;
                            break;
                        end
                    end
                    obj.SecondVaribleId = DeriveIdFromText(InputString(FirstStart:(CI - 1)));   
                end           
            end










            
            for index = CI:length(InputString)
                if (InputString(index) == 'x' || InputString(index) == 'F' || InputString(index) == '0' || InputString(index) == '1')
                    CI = index;
                    break;
                end
            end
            ThirdChar = InputString(CI);
            ThirdStart = CI;
            for index = CI:length(InputString)
                if (InputString(index) == ')')
                    CI = index;
                    obj.ThirdType = ThirdChar;
                    break;
                end
                if (InputString(index) == '+')
                    CI = index;
                    obj.ThirdType = '+';
                    break;
                end
                if (InputString(index) == '-')
                    CI = index;
                    obj.ThirdType = '-';
                    break;
                end
            end
            if (ThirdChar == 'x')
                obj.ThirdVaribleId = DeriveIdFromText(InputString(ThirdStart:(CI - 1)));
            else
                if (ThirdChar == 'F')
                    obj.ThirdFunctionId = DeriveIdFromText(InputString(ThirdStart:(CI - 1)));
                end
            end
            if (obj.ThirdType == '+')
                for index = CI:length(InputString)
                    if (InputString(index) == 'x')
                        CI = index;
                        ThirdStart = index;
                        break;
                    end
                end
                for index = CI:length(InputString)
                    if (InputString(index) == ')')
                        CI = index;
                        break;
                    end
                end
                obj.ThirdVaribleId = DeriveIdFromText(InputString(ThirdStart:(CI - 1)));
            else
                if (obj.ThirdType == '-')
                    for index = CI:length(InputString)
                        if (InputString(index) == 'x')
                            CI = index;
                            ThirdStart = index;
                            break;
                        end
                    end
                    for index = CI:length(InputString)
                        if (InputString(index) == ')')
                            CI = index;
                            break;
                        end
                    end
                    obj.ThirdVaribleId = DeriveIdFromText(InputString(ThirdStart:(CI - 1)));   
                end           
            end

        end
        function Print(obj)
            disp('id: '+ obj.id);
            disp('First: '+obj.FirstVaribleId+" Func: "+obj.FirstFunctionId+" Type: "+obj.FirstType);
            disp('Second: '+obj.SecondVaribleId+" Func: "+obj.SecondFunctionId+" Type: "+obj.SecondType);
            disp('Third: '+obj.ThirdVaribleId+" Func: "+obj.ThirdFunctionId+" Type: "+obj.ThirdType);
        end
    end
end