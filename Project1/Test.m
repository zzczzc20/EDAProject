%{
PortOrMerge test
MOS1 = MOS(1, 'A', 2, 3);
MOS2 = MOS(1, 'B', 2, 5);
MOS4 = MOS(1, 'D', 3, 7);
MOS5 = MOS(1, 'E', 3, 8);
MOS6 = MOS(1, 'F', 4, 9);
MOS3 = MOS(1, 'C', 2, 6);

MOSSET = SET([MOS1 MOS2 MOS3 MOS4 MOS5 MOS6]);
port1 = port(1);
port1.cell = [8 3 5 6 9 7];

[MOSSET__, neo_cell_list] = PortOrMerge(MOSSET, port1.cell, 1)
%}


%And Check test
MOS1 = MOS(1, 'A', 2, 3);
MOS2 = MOS(6, 'B', 2, 5);
MOS4 = MOS(1, 'D', 5, 7);
MOS5 = MOS(8, 'E', 5, 8);
MOS6 = MOS(1, 'F', 4, 9);
MOS3 = MOS(7, 'C', 2, 6);

MOSSET = SET([MOS1 MOS2 MOS3 MOS4 MOS5 MOS6]);
port1 = port(1);
port1.cell = [3 7 9];
port2 = port(2);
port2.cell = [3 5 6];
port4 = port(4);
port4.cell = [9];
port5 = port(5);
port5.cell = [7 8];
port6 = port(6);
port6.cell = [5];
port7 = port(7);
port7.cell = [6];
port8 = port(8);
port8.cell = [8];

PortSET = SET([port1 port2 port4 port5 port6 port7 port8]);

OnePass(MOSSET, PortSET);

%[MOS_SET_, Port_SET_] = AndCheck(MOSSET, PortSET, 1)

