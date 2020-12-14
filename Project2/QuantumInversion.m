function [NodeSet, DependencySet] = QuantumInversion(NodeSet, DependencySet)
%QuantumInversion - Description
%
% Syntax: [NodeSet, DependencySet] = QuantumInversion(NodeSet, DependencySet)
%
% Long description
%Firstly, we change the dependency:
    DependencyNum = DependencySet.size();
    for index = 1:DependencyNum
        SFT = DependencySet.content(index).from;
        DependencySet.content(index).from = DependencySet.content(index).to;
        DependencySet.content(index).to = SFT;
        %DO NOT CHANGE THE WEIGHT!
    end
%Second Inverse the nodes's input and output, and inverse its type:
    NodeNum = NodeSet.size();
    for index = 1:NodeNum
        SIO = NodeSet.content(index).Input;
        NodeSet.content(index).Input = NodeSet.content(index).Output;
        NodeSet.content(index).Output = SIO;
        if (NodeSet.content(index).type == 'i')
            NodeSet.content(index).type = 'o';
        else
            if (NodeSet.content(index).type == 'o')
                NodeSet.content(index).type = 'i';
            end
        end
    end
end