function [MOS_SET, Port_SET] = TopOrMerge(MOS_SET, Port_SET, pid)
%TopOrMerge - Description
%
% Syntax: [MOSSET, PortSET] = TopOrMerge(MOSSET, PortSET, pid)
%
% Long description
cell_list = Port_SET.Get(pid).cell;
del_set = [];
neo_cell_list = SET([]);
cell_tags = zeros(1, length(cell_list));
for index = 1 : length(cell_list)
    if (cell_tags(index) == 0)
        neo_cell_list = neo_cell_list.push(cell_list(index));
        current_port = MOS_SET.Get(cell_list(index)).GetAnotherPort(pid);
        current_merge_cells = [];

        for gid = (index + 1) : length(cell_list)
            if (MOS_SET.Get(cell_list(gid)).GetAnotherPort(pid) == current_port)
                del_set = [del_set cell_list(gid)];
                cell_tags(gid) = 1;
                current_merge_cells = [current_merge_cells cell_list(gid)];
            end
        end

        for mid = 1:length(current_merge_cells)
            [MOS_SET, Port_SET] = CheckOr(MOS_SET, Port_SET, MOS_SET.Get(cell_list(index)).id, MOS_SET.Get(current_merge_cells(mid)).id);
            MOS_SET.content(MOS_SET.FindId(cell_list(index))) = MOS_SET.content(MOS_SET.FindId(cell_list(index))).OrNMerge(MOS_SET.Get(current_merge_cells(mid)));
        end
    end
end
neo_cell_list = neo_cell_list.content;
Port_SET.content(Port_SET.FindId(pid)).cell = neo_cell_list;
[MOS_SET, Port_SET] = IntelligentDelete(MOS_SET, Port_SET, del_set);
end