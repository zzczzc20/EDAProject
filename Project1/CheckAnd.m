function [MOS_SET, Port_SET] = CheckAnd(MOS_SET, Port_SET, id1, id2)
%CheckAnd - Description
%
% Syntax: [MOS_SET, Port_SET] = CheckAnd(MOS_SET, Port_SET)
%
% Long description
    Gate1 = MOS_SET.Get(id1).Gate;
    Gate2 = MOS_SET.Get(id2).Gate;
    nid1 = -1;
    nid2 = -1;
    for index = 1:length(MOS_SET.content)
        if (MOS_SET.content(index).Gate == Gate1 && MOS_SET.content(index).id ~= id1)
            if (nid1 == -1)
                nid1 = MOS_SET.content(index).id;
                src1 = MOS_SET.content(index).Source;
                drn1 = MOS_SET.content(index).Drain;
            else
                disp("Sorry, currently, we don't support multi-ports with the same value.");
                assert(false);
            end
        end
        if (MOS_SET.content(index).Gate == Gate2 && MOS_SET.content(index).id ~= id2)
            if (nid2 == -1)
                nid2 = MOS_SET.content(index).id;
                src2 = MOS_SET.content(index).Source;
                drn2 = MOS_SET.content(index).Drain;
            else
                disp("Sorry, currently, we don't support multi-ports with the same value.");
                assert(false);
            end
        end
    end

    if(nid1 == -1 || nid2 == -1)
        disp("Incomplete PMOS net.");
        assert(false);
    end

    assert((src1 == src2 && drn1 == drn2) || (src1 == drn2 && src2 == drn1));

    MOS_SET.content(nid1) = MOS_SET.content(nid1).AndPMerge(MOS_SET.Get(nid2));
    Port_SET.content(src1) = Port_SET.content(src1).DelCell(nid2);
    Port_SET.content(drn1) = Port_SET.content(drn1).DelCell(nid2);
    MOS_SET = MOS_SET.DeleteId(nid2);
end