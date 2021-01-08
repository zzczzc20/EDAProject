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
        
    end
    methods
        function obj = ITE(InputString)
            
        end
    end
    methods (Static)
        function [Type, id, End, EndSymbol] = Scanner(InputString, begin)
            % This basic type just have 2 possibilities: x or F
            Type = InputString(begin);

            for index = begin:length(InputString)
                if (InputString(index) == ',' || InputString(index) == '+' || InputString(index) == ')' || InputString(index) == '-')
                    break;
                end
            end
            End = index;
            id = DeriveIdFromText(InputString(begin:(End - 1)));
            EndSymbol = InputString(End);
        end
    end
end