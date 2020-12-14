classdef Queue
    properties
        content;
        size;
    end
    methods
        function obj = Queue(size_)
            obj.size = size_;
            obj.content = [];
        end
        function obj = push(obj, element)
            if (length(obj.content) < obj.size)
                obj.content = [element obj.content];
            else
                obj.content = [element obj.content(1 : (obj.size - 1))];
            end
            assert(length(obj.content) <= obj.size);
        end
    end
end