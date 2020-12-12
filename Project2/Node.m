classdef Node
    properties
        id;
        type;
        Input;
        Output;
    end
    methods
        function obj = Node(id, type_)
            obj.id = id;
            obj.type = type_;
            Input = SET([]);
            Output = SET([]);
        end
        function delay = GetDelay(obj, T0)
            if (obj.type == '+')
                delay = 1;
            elseif (obj.type == '*')
                delay = 2;
            else
                if (obj.type == 'i')
                    delay = 0;
                elseif (obj.type == 'o')
                    delay = 0;
                else
                    assert(obj.type == 'd')
                    delay = T0;
                end
            end
        end
        function obj = Emit(obj, dep_id)
            obj.Output = obj.Output.push(dep_id);
        end
        function obj = Receive(onj, dep_id)
            obj.Input = obj.Input.push(dep_id);
        end
    end
end