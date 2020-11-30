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
            if (obj.Source == port)
                AnotherPort = obj.Drain;
            else
                AnotherPort = obj.Source;
            end
        end
        function AndNMOS = AndNMerge(nmos1, nmos2, ComPort)
            s = nmos1.GetAnotherPort(ComPort);
            d = nmos2.GetAnotherPort(ComPort);
            AndNMOS = MOS(d, "AND("+nmos1.Gate+", "+nmos2.Gate+")", s, nmos1.id);
        end
    end
end