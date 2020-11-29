classdef MOS
    properties 
        Drain;
        Gate;
        Source;
        id;
    end
    methods
        function obj = MOS(drain, gate, source, id)
            obj.Drain = drain;
            obj.Gate = gate;
            obj.Source = source;
            obj.id = id;
        end
        function AnotherPort = GetAnotherPort(obj, port)
            if (obj.source == port)
                return obj.Drain;
            else
                return obj.Source;
            end
        end
        function AndNMOS = AndNMerge(nmos1, nmos2)
            
        end
    end
end