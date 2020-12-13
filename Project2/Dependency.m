classdef Dependency
    properties
        id;
        weight;
        from;
        to;
    end
    methods 
        function obj = Dependency(id, from, to, weight)
            obj.id = id;
            obj.weight = weight;
            obj.from = from;
            obj.to = to;
        end
        function Output = Print(obj)
            id = obj.id
            weight = obj.weight
            from = obj.from
            to = obj.to
        end
    end
end