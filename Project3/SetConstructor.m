function [SetOfIte, pmat, PrintList] = SetConstructor(TestFile)
%SetConstructor - Description
%
% Syntax: [SetOfIte, pmat, PrintList] = SetConstructor(TestFile)
%
% Long description
FileId = fopen(TestFile);
NumOfVarible = str2num(fgetl(FileId));
NumOfIte = str2num(fgetl(FileId));
pmat = zeros(1, NumOfVarible);
TargetStr = fgetl(FileId);
SetOfIte = SET([]);
PrintList = [];
for index = 1:NumOfIte
    CurrentStr = char(fgetl(FileId));
    SetOfIte = SetOfIte.push(ITE(CurrentStr));
end
while ~feof(FileId)
    tline = char(fgetl(FileId));
    for index = 1:length(tline)
        if (tline(index) == 'F')
            break;
        end
    end
    PrintList = [PrintList DeriveIdFromText(tline(index:length(tline)))];
end
end