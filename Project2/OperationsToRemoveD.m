function [NodeSet, DependencySet] = OperationsToRemoveD(NodeSet, DependencySet)
%ExtensionAfterASAP - Description
%
% Syntax: [NodeSet, DependencySet] = OperationsToRemoveD(NodeSet, DependencySet)
%
% Long description

%Currently, we assume that index == id. And finally we will replace all ids with indexs to relize this assumption.

%We reserve the original d-node as an output node, and generate some input nodes.
%Then, we should modify the dependency, make the dependency's source become new id.
%First, find all d-type nodes.
    Dindex = [];
    for index = 1:NodeSet.size()
        if (NodeSet.content(index).type == 'd')
            Dindex = [Dindex index];
            NodeSet.content(index).type = 'o';
        end
    end
    NumOfNode = NodeSet.size();
    for index = 1:length(Dindex)
        AddNode = Node(NumOfNode + index, 'i');
        AddNode.Output = AddNode.Output.push(NodeSet.content(Dindex(index)).Output.content);
        NodeSet.content(Dindex(index)).Output = NodeSet.content(Dindex(index)).Output.Clear();

        for oid = 1:AddNode.Output.size()
            DependencySet.content(DependencySet.FindId(AddNode.Output.content(oid))).from = NumOfNode + index;
        end

        NodeSet = NodeSet.push(AddNode);
    end
end