classdef Node
    properties
        id;
        type;
        Input;
        Output;
        ASAPTime;
        ALAPTime;
    end
    methods
        function obj = Node(id, type_)
            obj.id = id;
            obj.type = type_;
            obj.Input = SET([]);
            obj.Output = SET([]);
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
                    %delay = T0;
                    delay = 0;
                end
            end
        end
        function obj = Emit(obj, dep_id)
            obj.Output = obj.Output.push(dep_id);
        end
        function obj = Receive(obj, dep_id)
            obj.Input = obj.Input.push(dep_id);
        end
        function obj = DeleteInput(obj, DeleteId)
            obj.Input = obj.Input.DeleteNum(DeleteId);
        end
        function Output = Print(obj)
            id = obj.id
            type_ = obj.type
            input_ = obj.Input
            output_ = obj.Output
        end
    end
end