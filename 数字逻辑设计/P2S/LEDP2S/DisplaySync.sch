<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="kintex7" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="Scan(1:0)" />
        <signal name="Hexs(15:0)" />
        <signal name="Hexs(3:0)" />
        <signal name="Hexs(7:4)" />
        <signal name="Hexs(11:8)" />
        <signal name="Hexs(15:12)" />
        <signal name="HEX(3:0)" />
        <signal name="point(3:0)" />
        <signal name="point(3)" />
        <signal name="point(2)" />
        <signal name="point(1)" />
        <signal name="point(0)" />
        <signal name="LES(3:0)" />
        <signal name="LES(3)" />
        <signal name="LES(2)" />
        <signal name="LES(1)" />
        <signal name="LES(0)" />
        <signal name="p" />
        <signal name="LE" />
        <signal name="Scan(1)" />
        <signal name="Scan(0)" />
        <signal name="XLXN_23" />
        <signal name="XLXN_24" />
        <signal name="XLXN_25" />
        <signal name="XLXN_26" />
        <signal name="XLXN_27" />
        <signal name="AN(3:0)" />
        <signal name="AN(3)" />
        <signal name="AN(2)" />
        <signal name="AN(1)" />
        <signal name="AN(0)" />
        <port polarity="Input" name="Scan(1:0)" />
        <port polarity="Input" name="Hexs(15:0)" />
        <port polarity="Output" name="HEX(3:0)" />
        <port polarity="Input" name="point(3:0)" />
        <port polarity="Input" name="LES(3:0)" />
        <port polarity="Output" name="p" />
        <port polarity="Output" name="LE" />
        <port polarity="Output" name="AN(3:0)" />
        <blockdef name="Mux4to1b4">
            <timestamp>2020-11-2T1:8:34</timestamp>
            <rect width="256" x="64" y="-320" height="320" />
            <rect width="64" x="0" y="-300" height="24" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-300" height="24" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
        </blockdef>
        <blockdef name="MUX4to1">
            <timestamp>2020-11-2T1:53:54</timestamp>
            <rect width="256" x="64" y="-320" height="320" />
            <rect width="64" x="0" y="-300" height="24" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
        </blockdef>
        <blockdef name="d2_4e">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <rect width="256" x="64" y="-384" height="320" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="64" y1="-320" y2="-320" x1="0" />
            <line x2="320" y1="-128" y2="-128" x1="384" />
            <line x2="320" y1="-192" y2="-192" x1="384" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="320" y1="-320" y2="-320" x1="384" />
        </blockdef>
        <blockdef name="vcc">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-64" x1="64" />
            <line x2="64" y1="0" y2="-32" x1="64" />
            <line x2="32" y1="-64" y2="-64" x1="96" />
        </blockdef>
        <blockdef name="inv4">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="160" y1="-96" y2="-96" x1="224" />
            <line x2="160" y1="-160" y2="-160" x1="224" />
            <line x2="160" y1="-224" y2="-224" x1="224" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="64" y1="-96" y2="-96" x1="0" />
            <line x2="64" y1="-160" y2="-160" x1="0" />
            <line x2="64" y1="-224" y2="-224" x1="0" />
            <line x2="128" y1="-256" y2="-224" x1="64" />
            <line x2="64" y1="-224" y2="-192" x1="128" />
            <line x2="64" y1="-192" y2="-256" x1="64" />
            <circle r="16" cx="144" cy="-32" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <line x2="128" y1="-128" y2="-96" x1="64" />
            <line x2="64" y1="-96" y2="-64" x1="128" />
            <line x2="64" y1="-64" y2="-128" x1="64" />
            <circle r="16" cx="144" cy="-96" />
            <line x2="128" y1="-192" y2="-160" x1="64" />
            <line x2="64" y1="-160" y2="-128" x1="128" />
            <line x2="64" y1="-128" y2="-192" x1="64" />
            <circle r="16" cx="144" cy="-160" />
            <circle r="16" cx="144" cy="-224" />
        </blockdef>
        <block symbolname="Mux4to1b4" name="XLXI_1">
            <blockpin signalname="Scan(1:0)" name="s(1:0)" />
            <blockpin signalname="Hexs(3:0)" name="I0(3:0)" />
            <blockpin signalname="Hexs(7:4)" name="I1(3:0)" />
            <blockpin signalname="Hexs(11:8)" name="I2(3:0)" />
            <blockpin signalname="Hexs(15:12)" name="I3(3:0)" />
            <blockpin signalname="HEX(3:0)" name="O(3:0)" />
        </block>
        <block symbolname="MUX4to1" name="XLXI_2">
            <blockpin signalname="Scan(1:0)" name="s(1:0)" />
            <blockpin signalname="point(0)" name="I0" />
            <blockpin signalname="point(1)" name="I1" />
            <blockpin signalname="point(2)" name="I2" />
            <blockpin signalname="point(3)" name="I3" />
            <blockpin signalname="p" name="O" />
        </block>
        <block symbolname="MUX4to1" name="XLXI_3">
            <blockpin signalname="Scan(1:0)" name="s(1:0)" />
            <blockpin signalname="LES(0)" name="I0" />
            <blockpin signalname="LES(1)" name="I1" />
            <blockpin signalname="LES(2)" name="I2" />
            <blockpin signalname="LES(3)" name="I3" />
            <blockpin signalname="LE" name="O" />
        </block>
        <block symbolname="d2_4e" name="XLXI_4">
            <blockpin signalname="Scan(0)" name="A0" />
            <blockpin signalname="Scan(1)" name="A1" />
            <blockpin signalname="XLXN_23" name="E" />
            <blockpin signalname="XLXN_24" name="D0" />
            <blockpin signalname="XLXN_25" name="D1" />
            <blockpin signalname="XLXN_26" name="D2" />
            <blockpin signalname="XLXN_27" name="D3" />
        </block>
        <block symbolname="vcc" name="XLXI_5">
            <blockpin signalname="XLXN_23" name="P" />
        </block>
        <block symbolname="inv4" name="XLXI_6">
            <blockpin signalname="XLXN_27" name="I0" />
            <blockpin signalname="XLXN_26" name="I1" />
            <blockpin signalname="XLXN_25" name="I2" />
            <blockpin signalname="XLXN_24" name="I3" />
            <blockpin signalname="AN(3)" name="O0" />
            <blockpin signalname="AN(2)" name="O1" />
            <blockpin signalname="AN(1)" name="O2" />
            <blockpin signalname="AN(0)" name="O3" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="5440" height="7040">
        <instance x="624" y="656" name="XLXI_1" orien="R0">
        </instance>
        <iomarker fontsize="28" x="208" y="240" name="Scan(1:0)" orien="R180" />
        <branch name="Scan(1:0)">
            <wire x2="384" y1="240" y2="240" x1="208" />
            <wire x2="384" y1="240" y2="368" x1="384" />
            <wire x2="624" y1="368" y2="368" x1="384" />
            <wire x2="384" y1="368" y2="896" x1="384" />
            <wire x2="624" y1="896" y2="896" x1="384" />
            <wire x2="384" y1="896" y2="1472" x1="384" />
            <wire x2="624" y1="1472" y2="1472" x1="384" />
            <wire x2="384" y1="1472" y2="2176" x1="384" />
            <wire x2="384" y1="2176" y2="2240" x1="384" />
            <wire x2="384" y1="2240" y2="2528" x1="384" />
        </branch>
        <branch name="Hexs(15:0)">
            <wire x2="192" y1="592" y2="592" x1="160" />
            <wire x2="192" y1="592" y2="656" x1="192" />
            <wire x2="192" y1="656" y2="720" x1="192" />
            <wire x2="192" y1="720" y2="752" x1="192" />
            <wire x2="192" y1="448" y2="480" x1="192" />
            <wire x2="192" y1="480" y2="560" x1="192" />
            <wire x2="192" y1="560" y2="592" x1="192" />
        </branch>
        <iomarker fontsize="28" x="160" y="592" name="Hexs(15:0)" orien="R180" />
        <bustap x2="288" y1="480" y2="480" x1="192" />
        <branch name="Hexs(3:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="328" y="480" type="branch" />
            <wire x2="328" y1="480" y2="480" x1="288" />
            <wire x2="512" y1="480" y2="480" x1="328" />
            <wire x2="512" y1="432" y2="480" x1="512" />
            <wire x2="624" y1="432" y2="432" x1="512" />
        </branch>
        <bustap x2="288" y1="560" y2="560" x1="192" />
        <branch name="Hexs(7:4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="320" y="560" type="branch" />
            <wire x2="320" y1="560" y2="560" x1="288" />
            <wire x2="528" y1="560" y2="560" x1="320" />
            <wire x2="528" y1="496" y2="560" x1="528" />
            <wire x2="624" y1="496" y2="496" x1="528" />
        </branch>
        <bustap x2="288" y1="656" y2="656" x1="192" />
        <branch name="Hexs(11:8)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="320" y="656" type="branch" />
            <wire x2="320" y1="656" y2="656" x1="288" />
            <wire x2="544" y1="656" y2="656" x1="320" />
            <wire x2="544" y1="560" y2="656" x1="544" />
            <wire x2="624" y1="560" y2="560" x1="544" />
        </branch>
        <bustap x2="288" y1="720" y2="720" x1="192" />
        <branch name="Hexs(15:12)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="320" y="720" type="branch" />
            <wire x2="320" y1="720" y2="720" x1="288" />
            <wire x2="560" y1="720" y2="720" x1="320" />
            <wire x2="560" y1="624" y2="720" x1="560" />
            <wire x2="624" y1="624" y2="624" x1="560" />
        </branch>
        <branch name="HEX(3:0)">
            <wire x2="1248" y1="368" y2="368" x1="1008" />
        </branch>
        <iomarker fontsize="28" x="1248" y="368" name="HEX(3:0)" orien="R0" />
        <instance x="624" y="1184" name="XLXI_2" orien="R0">
        </instance>
        <instance x="624" y="1760" name="XLXI_3" orien="R0">
        </instance>
        <branch name="point(3:0)">
            <wire x2="208" y1="944" y2="944" x1="96" />
            <wire x2="208" y1="944" y2="960" x1="208" />
            <wire x2="208" y1="960" y2="1024" x1="208" />
            <wire x2="208" y1="1024" y2="1088" x1="208" />
            <wire x2="208" y1="1088" y2="1152" x1="208" />
            <wire x2="208" y1="1152" y2="1200" x1="208" />
        </branch>
        <iomarker fontsize="28" x="96" y="944" name="point(3:0)" orien="R180" />
        <bustap x2="304" y1="1152" y2="1152" x1="208" />
        <branch name="point(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="320" y="1152" type="branch" />
            <wire x2="320" y1="1152" y2="1152" x1="304" />
            <wire x2="624" y1="1152" y2="1152" x1="320" />
        </branch>
        <bustap x2="304" y1="1088" y2="1088" x1="208" />
        <branch name="point(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="320" y="1088" type="branch" />
            <wire x2="320" y1="1088" y2="1088" x1="304" />
            <wire x2="624" y1="1088" y2="1088" x1="320" />
        </branch>
        <bustap x2="304" y1="1024" y2="1024" x1="208" />
        <branch name="point(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="320" y="1024" type="branch" />
            <wire x2="320" y1="1024" y2="1024" x1="304" />
            <wire x2="624" y1="1024" y2="1024" x1="320" />
        </branch>
        <bustap x2="304" y1="960" y2="960" x1="208" />
        <branch name="point(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="320" y="960" type="branch" />
            <wire x2="320" y1="960" y2="960" x1="304" />
            <wire x2="624" y1="960" y2="960" x1="320" />
        </branch>
        <branch name="LES(3:0)">
            <wire x2="192" y1="1488" y2="1488" x1="64" />
            <wire x2="192" y1="1488" y2="1536" x1="192" />
            <wire x2="192" y1="1536" y2="1600" x1="192" />
            <wire x2="192" y1="1600" y2="1664" x1="192" />
            <wire x2="192" y1="1664" y2="1728" x1="192" />
            <wire x2="192" y1="1728" y2="1824" x1="192" />
        </branch>
        <iomarker fontsize="28" x="64" y="1488" name="LES(3:0)" orien="R180" />
        <bustap x2="288" y1="1728" y2="1728" x1="192" />
        <branch name="LES(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="304" y="1728" type="branch" />
            <wire x2="304" y1="1728" y2="1728" x1="288" />
            <wire x2="624" y1="1728" y2="1728" x1="304" />
        </branch>
        <bustap x2="288" y1="1664" y2="1664" x1="192" />
        <branch name="LES(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="304" y="1664" type="branch" />
            <wire x2="304" y1="1664" y2="1664" x1="288" />
            <wire x2="624" y1="1664" y2="1664" x1="304" />
        </branch>
        <bustap x2="288" y1="1600" y2="1600" x1="192" />
        <branch name="LES(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="304" y="1600" type="branch" />
            <wire x2="304" y1="1600" y2="1600" x1="288" />
            <wire x2="624" y1="1600" y2="1600" x1="304" />
        </branch>
        <bustap x2="288" y1="1536" y2="1536" x1="192" />
        <branch name="LES(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="304" y="1536" type="branch" />
            <wire x2="304" y1="1536" y2="1536" x1="288" />
            <wire x2="624" y1="1536" y2="1536" x1="304" />
        </branch>
        <branch name="p">
            <wire x2="1456" y1="896" y2="896" x1="1008" />
        </branch>
        <branch name="LE">
            <wire x2="1440" y1="1472" y2="1472" x1="1008" />
        </branch>
        <iomarker fontsize="28" x="1456" y="896" name="p" orien="R0" />
        <iomarker fontsize="28" x="1440" y="1472" name="LE" orien="R0" />
        <instance x="608" y="2496" name="XLXI_4" orien="R0" />
        <bustap x2="480" y1="2240" y2="2240" x1="384" />
        <branch name="Scan(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="544" y="2240" type="branch" />
            <wire x2="544" y1="2240" y2="2240" x1="480" />
            <wire x2="608" y1="2240" y2="2240" x1="544" />
        </branch>
        <bustap x2="480" y1="2176" y2="2176" x1="384" />
        <branch name="Scan(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="544" y="2176" type="branch" />
            <wire x2="544" y1="2176" y2="2176" x1="480" />
            <wire x2="608" y1="2176" y2="2176" x1="544" />
        </branch>
        <branch name="XLXN_23">
            <wire x2="496" y1="2336" y2="2368" x1="496" />
            <wire x2="608" y1="2368" y2="2368" x1="496" />
        </branch>
        <instance x="432" y="2336" name="XLXI_5" orien="R0" />
        <instance x="1168" y="2400" name="XLXI_6" orien="R0" />
        <branch name="XLXN_24">
            <wire x2="1168" y1="2176" y2="2176" x1="992" />
        </branch>
        <branch name="XLXN_25">
            <wire x2="1168" y1="2240" y2="2240" x1="992" />
        </branch>
        <branch name="XLXN_26">
            <wire x2="1168" y1="2304" y2="2304" x1="992" />
        </branch>
        <branch name="XLXN_27">
            <wire x2="1168" y1="2368" y2="2368" x1="992" />
        </branch>
        <branch name="AN(3:0)">
            <wire x2="1696" y1="2080" y2="2176" x1="1696" />
            <wire x2="1696" y1="2176" y2="2240" x1="1696" />
            <wire x2="1696" y1="2240" y2="2304" x1="1696" />
            <wire x2="1696" y1="2304" y2="2368" x1="1696" />
            <wire x2="1696" y1="2368" y2="2544" x1="1696" />
            <wire x2="1904" y1="2544" y2="2544" x1="1696" />
        </branch>
        <iomarker fontsize="28" x="1904" y="2544" name="AN(3:0)" orien="R0" />
        <bustap x2="1600" y1="2368" y2="2368" x1="1696" />
        <branch name="AN(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1496" y="2368" type="branch" />
            <wire x2="1496" y1="2368" y2="2368" x1="1392" />
            <wire x2="1600" y1="2368" y2="2368" x1="1496" />
        </branch>
        <bustap x2="1600" y1="2304" y2="2304" x1="1696" />
        <branch name="AN(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1496" y="2304" type="branch" />
            <wire x2="1496" y1="2304" y2="2304" x1="1392" />
            <wire x2="1600" y1="2304" y2="2304" x1="1496" />
        </branch>
        <bustap x2="1600" y1="2240" y2="2240" x1="1696" />
        <branch name="AN(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1496" y="2240" type="branch" />
            <wire x2="1496" y1="2240" y2="2240" x1="1392" />
            <wire x2="1600" y1="2240" y2="2240" x1="1496" />
        </branch>
        <bustap x2="1600" y1="2176" y2="2176" x1="1696" />
        <branch name="AN(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1496" y="2176" type="branch" />
            <wire x2="1496" y1="2176" y2="2176" x1="1392" />
            <wire x2="1600" y1="2176" y2="2176" x1="1496" />
        </branch>
    </sheet>
</drawing>