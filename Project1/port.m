classdef port
    properties
        cell = [];
        state;
        id;
    end
    methods
        function obj = port(name)
            obj.cell = [];
            obj.id = name;
            obj.state = 0;
        end
        function obj = AddCell(obj, MOS_id)
            obj.cell = [obj.cell MOS_id];
        end
        function obj = Discover(obj)
            obj.state = 1;
        end
        function obj = Finish(obj)
            obj.state = 2;
        end
        function obj = Recover(obj)
            obj.state = 0;
        end
        function obj = DelCell(obj, id)
            obj.cell(obj.cell == id) = [];
        end
        function output = Print(obj)
            Cell = obj.cell
            state = obj.state
            id = obj.id
        end
    end
end