classdef port
    properties
        cell = [];
        id;
    end
    methods
        function obj = port(name)
            obj.cell = [];
            obj.id = id;
        end
        function obj = AddCell(obj, MOS_id)
            obj.cell = [obj.cell MOS_id];
        end
    end
end