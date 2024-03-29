classdef method
    properties
        StartTime;
        Duration;
        Type;
    end
    methods
        function [cost_, MaxNumOfAdders, MaxNumOfMultipliers] = GetCost(obj)
            %Firstly, Get the last time. Which should be the output.
            LastTime = 0;
            LastTimeIndex = 0;
            for index = 1:length(obj.StartTime)
                if (obj.StartTime(index) > LastTime)
                    LastTime = obj.StartTime(index);
                    LastTimeIndex = index;
                end
            end
            assert(obj.Type(LastTimeIndex) == 'o' || obj.Type(LastTimeIndex) == 'd');
            assert(obj.Duration(LastTimeIndex) == 0);
            %Secondly, Calculate hardware utilization for every single moments
            MaxNumOfAdders = 0;
            MaxNumOfMultipliers = 0;
            for time = 0:LastTime
                NumOfAdders = 0;
                NumOfMultipliers = 0;
                for item = 1:length(obj.StartTime)
                    if (obj.Type(item) == '+')
                        if ((time >= obj.StartTime(item)) && ((time - obj.StartTime(item)) < obj.Duration(item)))
                            NumOfAdders = NumOfAdders + 1;
                        end
                    elseif (obj.Type(item) == '*')
                        if ((time >= obj.StartTime(item)) && ((time - obj.StartTime(item)) < obj.Duration(item)))
                            NumOfMultipliers = NumOfMultipliers + 1;
                        end
                    else
                         
                    end
                end
                if (NumOfAdders > MaxNumOfAdders)
                    MaxNumOfAdders = NumOfAdders;
                end
                if (NumOfMultipliers > MaxNumOfMultipliers)
                    MaxNumOfMultipliers = NumOfMultipliers;
                end
            end
            %Finally, return cost
            cost_ = MaxNumOfAdders + 2 * MaxNumOfMultipliers;
        end
        function obj = method(Duration, Type)
            obj.StartTime = zeros(1, length(Duration));
            obj.Duration = Duration;
            obj.Type = Type;
        end
        function obj = SetStartTime(obj, id, StartTime)
            obj.StartTime(id) = StartTime;
        end
        function output = Print(obj)
            for index = 1:length(obj.StartTime)
                index
                StartTime = obj.StartTime(index)
                Duration = obj.Duration(index)
                Type_ = char(obj.Type(index))
            end
        end
        function obj = MethodInversion(obj)
            LatestNode = max(obj.StartTime);
            obj.StartTime = LatestNode - obj.StartTime;
            for index = 1:length(obj.Type)
                if (obj.Type(index) == 'i')
                    obj.Type(index) = 'o';
                else
                    if (obj.Type(index) == 'o')
                        obj.Type(index) = 'i';
                    end
                end
            end
        end
        function isEqual = isEqual(obj1, obj2)
            assert(length(obj1.StartTime) == length(obj2.StartTime));
            isEqual = true;
            for index = 1:length(obj1.StartTime)
                if (obj1.StartTime(index) ~= obj2.StartTime(index))
                    isEqual = false;
                end
            end
        end
    end
end