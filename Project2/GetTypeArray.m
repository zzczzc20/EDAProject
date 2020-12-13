function TypeArray = GetTypeArray(NodeSet)
    TypeArray = zeros(1, NodeSet.size());
    for index = 1:NodeSet.size()
        TypeArray(index) = NodeSet.content(index).type;
    end
end