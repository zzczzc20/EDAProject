function ret = Project1(TestFile)
%Project1 - Description
%
% Syntax: ret = Project1(TestFile)
%
% Long description

    % First Part ------------------------------------------------------------------------------
    % Construct ports set and MOS set ---------------------------------------------------------
    FileId = fopen(TestFile);
    Raw = textscan(FileId, '%s');
    RawStr = Raw{1};
    MOSNumber = double(str2num(RawStr{1}));
    NetNumber = double(str2num(RawStr{2}));

    PortsSet = SET([]);
    MOSSet = SET([]);

    for netid = 1:NetNumber
        PortsSet = PortsSet.push(port(netid));
    end
    
    for mosid = 1:MOSNumber
        MOSDrain = double(str2num(RawStr{mosid * 3})) + 1;
        MOSSource = double(str2num(RawStr{mosid * 3 + 1})) + 1;
        MOSGate = RawStr{mosid * 3 + 2};
        MOSSet = MOSSet.push(MOS(MOSDrain, MOSGate, MOSSource, mosid));
        PortsSet.content(int32(MOSDrain)) = PortsSet.content(int32(MOSDrain)).AddCell(mosid);
        PortsSet.content(int32(MOSSource)) = PortsSet.content(int32(MOSSource)).AddCell(mosid);
    end
    % The End of First Part -------------------------------------------------------------------
    % After the first part, we construct the Port set and MOS set.

    % After Convert Process
    % 1-> gnd
    % 2-> Vdd
    % 3-> Output


    % Second Part ------------------------------------------------------------------------------
    % Use OnePass function to merge ------------------------------------------------------------
    while (true)
        OriSize = MOSSet.size();
        [MOSSet, PortsSet] = OnePass(MOSSet, PortsSet);
        ProSize = MOSSet.size();
        if (OriSize == ProSize)
            break;
        end
    end
    % The End of Second Part -------------------------------------------------------------------

    % Third Part -------------------------------------------------------------------------------
    % Process and Display Information ----------------------------------------------------------
    assert(MOSSet.size() == 2);
    assert(MOSSet.Get(PortsSet.Get(1).cell).Gate == MOSSet.Get(PortsSet.Get(2).cell).Gate);
    disp('NOT('+MOSSet.Get(PortsSet.Get(1).cell).Gate+')')
    % The End of Third Part --------------------------------------------------------------------
    fclose(FileId);

end
