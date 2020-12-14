function [NodeSet, DependencySet, T0, StartMeUp] = SetConstructor(TestFile)
%SetConstructor - Description
%
% Syntax: [NodeSet, DependencySet, T0] = SetConstructor(TestFile)
%
% Long description
    %{
    FileId = fopen(TestFile);
    Raw = textscan(FileId, '%s');
    RawStr = Raw{1};
    NumOfNode = double(str2num(RawStr{1}));
    NumOfDependency = double(str2num(RawStr{2}));
    T0 = double(str2num(RawStr{3}));
    fclose(TestFile);
    %}
    IndexTrans = [];
    StartMeUp = [];
    FileId = fopen(TestFile);
    NumOfNode = str2num(fgetl(FileId));
    NumOfDependency = str2num(fgetl(FileId));
    T0 = str2num(fgetl(FileId));
    NodeSet = SET([]);
    DependencySet = SET([]);
    for index = 1:NumOfNode
        CurrentLine = fgetl(FileId);
        Raw = textscan(CurrentLine, '%s');
        RawStr = Raw{1};
        NodeId = double(str2num(RawStr{1}));
        NodeType = RawStr{2};
        if (NodeType == 'i' || NodeType == 'd')
            StartMeUp = [StartMeUp NodeId];
        end
        IndexTrans = [IndexTrans NodeId];
        NeoNode = Node(index, NodeType);
        NodeSet = NodeSet.push(NeoNode);
    end
    for index = 1:NumOfDependency
        CurrentLine = fgetl(FileId);
        Raw = textscan(CurrentLine, '%s');
        RawStr = Raw{1};
        SourceNodeId = find(IndexTrans == double(str2num(RawStr{1})));
        DestinationNodeId = find(IndexTrans == double(str2num(RawStr{2})));

        assert(NodeSet.content(SourceNodeId).type ~= 'o');
        assert(NodeSet.content(DestinationNodeId).type ~= 'i');

        NodeSet.content(SourceNodeId) = NodeSet.content(SourceNodeId).Emit(index);
        NodeSet.content(DestinationNodeId) = NodeSet.content(DestinationNodeId).Receive(index);
        NeoDependency = Dependency(index, SourceNodeId, DestinationNodeId, NodeSet.content(SourceNodeId).GetDelay(T0));
        DependencySet = DependencySet.push(NeoDependency);
    end
    %NodeSet.Print();
    %DependencySet.Print();
end