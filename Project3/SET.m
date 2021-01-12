classdef SET
    properties
        content;
    end
    methods
        function obj = SET(content)
            obj.content = content;
        end
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
        function setT = merge(set1, set2)
            setT = SET([set1.content set2.content]);
        end
        function id_SET = FindNum(obj, id)
            id_SET = [];
            len = length(obj.content);
            for index = 1 : len
                if (obj.content(index) == id)
                    id_SET = [id_SET index];
                end
            end
        end
        function get = Get(obj, id)
            get = obj.content(obj.FindId(id));
        end
        function obj = Set(obj, id, Value_)
            obj.content(obj.FindId(id)) = Value_;
        end
        function size = size(obj)
            size = length(obj.content);
        end
        function obj = DeleteId(obj, ids)
            len = length(ids);
            for index = 1:len
                obj = obj.Delete(obj.FindId(ids(index)));
            end
        end
        function obj = DeleteNum(obj, ids)
            len = length(ids);
            for index = 1:len
                obj = obj.Delete(obj.FindNum(ids(index)));
            end
        end
        function isContained = isIncluded(obj, id)
            len = length(obj.FindId(id));
            if (len == 0)
                isContained = false;
            else
                isContained = true;
            end
        end
        function output = Print(obj)
            for index = 1:length(obj.content)
                obj.content(index).Print();
            end
        end
        function obj = Clear(obj)
            obj.content = [];
        end
    end
end