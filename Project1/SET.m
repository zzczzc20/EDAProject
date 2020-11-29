classdef SET
    properties
        content;
    end
    methods
        function obj = push(obj, element)
            obj.content = [obj.content element];
        end
        function obj = Delete(obj, index)
            obj.content(index) = [];
        end
        function id_SET = FindId(obj, id)
            id_SET = [];
            len = length(obj.content);
            for index = 1 : len
                if (obj.content(index).id == id)
                    id_SET = [id_SET index];
                end
            end
        end
    end
end