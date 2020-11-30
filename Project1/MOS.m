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
        function OrNMOS = OrNMerge(nmos1, nmos2)
            OrNMOS = MOS(nmos1.Drain, "OR("+nmos1.Gate+", "+nmos2.Gate+")", nmos1.Source, nmos1.id);
        end
        function AndPMOS = AndPMerge(pmos1, pmos2)
            AndPMOS = MOS(pmos1.Drain, "AND("+pmos1.Gate+", "+pmos2.Gate+")", pmos1.Source, pmos1.id);
        end
        function OrPMOS = OrPMerge(pmos1, pmos2, ComPort)
            s = pmos1.GetAnotherPort(ComPort);
            d = pmos2.GetAnotherPort(ComPort);
            OrPMOS = MOS(d, "OR("+pmos1.Gate+", "+pmos2.Gate+")", s, pmos1.id);
        end
    end
end