function ID = DeriveIdFromText(text)
%DeriveIdFromText - Description
%
% Syntax: ID = DeriveIdFromText(text)
%
% Long description
    inter1 = uint8(text);
    inter2 = inter1(2 : length(inter1));
    inter3 = char(inter2);
    ID = str2num(inter3);
end