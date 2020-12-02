function ret = Project1(TestFile)
%Project1 - Description
%
% Syntax: ret = Project1(TestFile)
%
% Long description
    % First Part ------------------------------------------------------------------------------
    % Construct ports set and MOS set ---------------------------------------------------------
    FileId = fopen(TestFile);
    Raw = textscan(FileId, '%c');
    RawStr = Raw{1};
    MOSNumber = double(RawStr(1) - '0');
    NetNumber = double(RawStr(2) - '0');

    PortsSet = SET();
    MOSSet = SET();

    for netid = 1:NetNumber
        PortsSet = PortsSet.push(port(netid));
    end
    
    for mosid = 1:MOSNumber
        MOSDrain = double(RawStr(mosid * 3) - '0') + 1;
        MOSSource = double(RawStr(mosid * 3 + 1) - '0') + 1;
        MOSGate = RawStr(mosid * 3 + 2);
        MOSSet = MOSSet.push(MOS(MOSDrain, MOSGate, MOSSource, mosid));
        PortsSet.content(int32(MOSDrain)) = PortsSet.content(int32(MOSDrain)).AddCell(mosid);
        PortsSet.content(int32(MOSSource)) = PortsSet.content(int32(MOSSource)).AddCell(mosid);
    end

    fclose(FileId);
    % The End of First Part -------------------------------------------------------------------
end
