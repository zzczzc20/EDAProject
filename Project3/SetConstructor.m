function [SetOfITE, pmat] = SetConstructor(TestFile)
%SetConstructor - Description
%
% Syntax: [SetOfITE, pmat] = SetConstructor(TestFile)
%
% Long description
FileId = fopen(TestFile);
NumOfVarible = str2num(fgetl(FileId));
NumOfIte = str2num(fgetl(FileId));
pmat = zeros(1, NumOfVarible);
TargetStr = fgetl(FileId);
SetOfIte = SET([]);
for index = 1:NumOfIte
    SetOfIte = SetOfIte.push(ITE(char(fgetl(FileId))));
end
end