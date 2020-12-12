function DurationArray = GetDurationArray(NodeSet, T0)
        DurationArray = zeros(1, NodeSet.size());
        for index = 1:NodeSet.size()
            DurationArray[index] = NodeSet.content(index).GetDelay(T0);
        end
end