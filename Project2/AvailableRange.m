classdef AvailableRange
    properties
        SingleVariationEarly;
        SingleVariationLate;
    end
    methods
        function obj = AvailableRange(Method, NodeSet, DependencySet)
            obj.SingleVariationEarly = zeros(1, NodeSet.size());
            obj.SingleVariationLate = zeros(1, NodeSet.size());
            for index = 1:NodeSet.size()
                InputDep = NodeSet.content(index).Input.content;
                OutputDep = NodeSet.content(index).Output.content;
                Early = 0;
                Late = inf;
                for iid = 1:length(InputDep)
                    FromNode = DependencySet.Get(InputDep(iid)).from;
                    StartTime = Method.StartTime(FromNode);
                    if (StartTime + DependencySet.Get(InputDep(iid)).weight > Early)
                        Early = StartTime + DependencySet.Get(InputDep(iid)).weight;
                    end
                end
                for oid = 1:length(OutputDep)
                    ToNode = DependencySet.Get(OutputDep(oid)).to;
                    StartTime = Method.StartTime(ToNode);
                    if (StartTime - DependencySet.Get(OutputDep(oid)).weight < Late)
                        Late = StartTime + DependencySet.Get(OutputDep(oid)).weight;
                    end
                end
                obj.SingleVariationEarly(index) = Early;
                obj.SingleVariationLate(index) = Late;
            end
        end
    end
end