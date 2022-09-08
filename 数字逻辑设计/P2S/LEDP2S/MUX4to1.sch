<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="kintex7" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="s(1:0)" />
        <signal name="s(1)" />
        <signal name="s(0)" />
        <signal name="XLXN_4" />
        <signal name="XLXN_5" />
        <signal name="XLXN_6" />
        <signal name="XLXN_7" />
        <signal name="I0" />
        <signal name="XLXN_9" />
        <signal name="I1" />
        <signal name="XLXN_11" />
        <signal name="I2" />
        <signal name="XLXN_13" />
        <signal name="I3" />
        <signal name="XLXN_15" />
        <signal name="XLXN_16" />
        <signal name="XLXN_17" />
        <signal name="XLXN_18" />
        <signal name="O" />
        <port polarity="Input" name="s(1:0)" />
        <port polarity="Input" name="I0" />
        <port polarity="Input" name="I1" />
        <port polarity="Input" name="I2" />
        <port polarity="Input" name="I3" />
        <port polarity="Output" name="O" />
        <blockdef name="inv">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
        </blockdef>
        <blockdef name="and2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="144" ey="-144" sx="144" sy="-48" r="48" cx="144" cy="-96" />
            <line x2="64" y1="-48" y2="-48" x1="144" />
            <line x2="144" y1="-144" y2="-144" x1="64" />
            <line x2="64" y1="-48" y2="-144" x1="64" />
        </blockdef>
        <blockdef name="or4">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="48" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="48" y1="-256" y2="-256" x1="0" />
            <line x2="192" y1="-160" y2="-160" x1="256" />
            <arc ex="112" ey="-208" sx="192" sy="-160" r="88" cx="116" cy="-120" />
            <line x2="48" y1="-208" y2="-208" x1="112" />
            <line x2="48" y1="-112" y2="-112" x1="112" />
            <line x2="48" y1="-256" y2="-208" x1="48" />
            <line x2="48" y1="-64" y2="-112" x1="48" />
            <arc ex="48" ey="-208" sx="48" sy="-112" r="56" cx="16" cy="-160" />
            <arc ex="192" ey="-160" sx="112" sy="-112" r="88" cx="116" cy="-200" />
        </blockdef>
        <block symbolname="inv" name="XLXI_1">
            <blockpin signalname="s(1)" name="I" />
            <blockpin signalname="XLXN_4" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_2">
            <blockpin signalname="s(0)" name="I" />
            <blockpin signalname="XLXN_5" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_3">
            <blockpin signalname="XLXN_5" name="I0" />
            <blockpin signalname="XLXN_4" name="I1" />
            <blockpin signalname="XLXN_7" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_4">
            <blockpin signalname="s(0)" name="I0" />
            <blockpin signalname="XLXN_4" name="I1" />
            <blockpin signalname="XLXN_9" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_5">
            <blockpin signalname="s(1)" name="I0" />
            <blockpin signalname="XLXN_5" name="I1" />
            <blockpin signalname="XLXN_11" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_6">
            <blockpin signalname="s(1)" name="I0" />
            <blockpin signalname="s(0)" name="I1" />
            <blockpin signalname="XLXN_13" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_7">
            <blockpin signalname="I0" name="I0" />
            <blockpin signalname="XLXN_7" name="I1" />
            <blockpin signalname="XLXN_15" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_8">
            <blockpin signalname="I1" name="I0" />
            <blockpin signalname="XLXN_9" name="I1" />
            <blockpin signalname="XLXN_18" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_9">
            <blockpin signalname="I2" name="I0" />
            <blockpin signalname="XLXN_11" name="I1" />
            <blockpin signalname="XLXN_17" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_10">
            <blockpin signalname="I3" name="I0" />
            <blockpin signalname="XLXN_13" name="I1" />
            <blockpin signalname="XLXN_16" name="O" />
        </block>
        <block symbolname="or4" name="XLXI_11">
            <blockpin signalname="XLXN_16" name="I0" />
            <blockpin signalname="XLXN_17" name="I1" />
            <blockpin signalname="XLXN_18" name="I2" />
            <blockpin signalname="XLXN_15" name="I3" />
            <blockpin signalname="O" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="s(1:0)">
            <wire x2="400" y1="432" y2="432" x1="176" />
            <wire x2="400" y1="432" y2="544" x1="400" />
            <wire x2="400" y1="544" y2="656" x1="400" />
            <wire x2="400" y1="256" y2="336" x1="400" />
            <wire x2="400" y1="336" y2="432" x1="400" />
        </branch>
        <iomarker fontsize="28" x="176" y="432" name="s(1:0)" orien="R180" />
        <bustap x2="496" y1="336" y2="336" x1="400" />
        <branch name="s(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="544" y="336" type="branch" />
            <wire x2="544" y1="336" y2="336" x1="496" />
            <wire x2="608" y1="336" y2="336" x1="544" />
            <wire x2="784" y1="336" y2="336" x1="608" />
            <wire x2="608" y1="336" y2="1040" x1="608" />
            <wire x2="608" y1="1040" y2="1280" x1="608" />
            <wire x2="1328" y1="1280" y2="1280" x1="608" />
            <wire x2="1328" y1="1040" y2="1040" x1="608" />
        </branch>
        <bustap x2="496" y1="544" y2="544" x1="400" />
        <branch name="s(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="536" y="544" type="branch" />
            <wire x2="536" y1="544" y2="544" x1="496" />
            <wire x2="672" y1="544" y2="544" x1="536" />
            <wire x2="768" y1="544" y2="544" x1="672" />
            <wire x2="672" y1="544" y2="784" x1="672" />
            <wire x2="1328" y1="784" y2="784" x1="672" />
            <wire x2="672" y1="784" y2="1216" x1="672" />
            <wire x2="1328" y1="1216" y2="1216" x1="672" />
        </branch>
        <instance x="784" y="368" name="XLXI_1" orien="R0" />
        <instance x="768" y="576" name="XLXI_2" orien="R0" />
        <instance x="1328" y="528" name="XLXI_3" orien="R0" />
        <instance x="1328" y="848" name="XLXI_4" orien="R0" />
        <instance x="1328" y="1104" name="XLXI_5" orien="R0" />
        <instance x="1328" y="1344" name="XLXI_6" orien="R0" />
        <branch name="XLXN_5">
            <wire x2="1120" y1="544" y2="544" x1="992" />
            <wire x2="1120" y1="544" y2="976" x1="1120" />
            <wire x2="1328" y1="976" y2="976" x1="1120" />
            <wire x2="1120" y1="464" y2="544" x1="1120" />
            <wire x2="1328" y1="464" y2="464" x1="1120" />
        </branch>
        <branch name="XLXN_4">
            <wire x2="1232" y1="336" y2="336" x1="1008" />
            <wire x2="1232" y1="336" y2="400" x1="1232" />
            <wire x2="1328" y1="400" y2="400" x1="1232" />
            <wire x2="1232" y1="400" y2="720" x1="1232" />
            <wire x2="1328" y1="720" y2="720" x1="1232" />
        </branch>
        <instance x="2144" y="560" name="XLXI_7" orien="R0" />
        <instance x="2128" y="880" name="XLXI_8" orien="R0" />
        <instance x="2112" y="1136" name="XLXI_9" orien="R0" />
        <instance x="2096" y="1376" name="XLXI_10" orien="R0" />
        <branch name="XLXN_7">
            <wire x2="2144" y1="432" y2="432" x1="1584" />
        </branch>
        <branch name="I0">
            <wire x2="1728" y1="1520" y2="1520" x1="256" />
            <wire x2="2144" y1="496" y2="496" x1="1728" />
            <wire x2="1728" y1="496" y2="1520" x1="1728" />
        </branch>
        <branch name="XLXN_9">
            <wire x2="1600" y1="752" y2="752" x1="1584" />
            <wire x2="2128" y1="752" y2="752" x1="1600" />
        </branch>
        <branch name="I1">
            <wire x2="1792" y1="1616" y2="1616" x1="256" />
            <wire x2="2128" y1="816" y2="816" x1="1792" />
            <wire x2="1792" y1="816" y2="1616" x1="1792" />
        </branch>
        <branch name="XLXN_11">
            <wire x2="2112" y1="1008" y2="1008" x1="1584" />
        </branch>
        <branch name="I2">
            <wire x2="1872" y1="1728" y2="1728" x1="256" />
            <wire x2="2112" y1="1072" y2="1072" x1="1872" />
            <wire x2="1872" y1="1072" y2="1728" x1="1872" />
        </branch>
        <branch name="XLXN_13">
            <wire x2="2096" y1="1248" y2="1248" x1="1584" />
        </branch>
        <branch name="I3">
            <wire x2="1968" y1="1824" y2="1824" x1="256" />
            <wire x2="2096" y1="1312" y2="1312" x1="1968" />
            <wire x2="1968" y1="1312" y2="1824" x1="1968" />
        </branch>
        <iomarker fontsize="28" x="256" y="1520" name="I0" orien="R180" />
        <iomarker fontsize="28" x="256" y="1616" name="I1" orien="R180" />
        <iomarker fontsize="28" x="256" y="1728" name="I2" orien="R180" />
        <iomarker fontsize="28" x="256" y="1824" name="I3" orien="R180" />
        <instance x="2896" y="1072" name="XLXI_11" orien="R0" />
        <branch name="XLXN_15">
            <wire x2="2896" y1="464" y2="464" x1="2400" />
            <wire x2="2896" y1="464" y2="816" x1="2896" />
        </branch>
        <branch name="XLXN_16">
            <wire x2="2896" y1="1280" y2="1280" x1="2352" />
            <wire x2="2896" y1="1008" y2="1280" x1="2896" />
        </branch>
        <branch name="XLXN_17">
            <wire x2="2704" y1="1040" y2="1040" x1="2368" />
            <wire x2="2704" y1="944" y2="1040" x1="2704" />
            <wire x2="2896" y1="944" y2="944" x1="2704" />
        </branch>
        <branch name="XLXN_18">
            <wire x2="2768" y1="784" y2="784" x1="2384" />
            <wire x2="2768" y1="784" y2="880" x1="2768" />
            <wire x2="2896" y1="880" y2="880" x1="2768" />
        </branch>
        <branch name="O">
            <wire x2="3216" y1="912" y2="912" x1="3152" />
        </branch>
        <iomarker fontsize="28" x="3216" y="912" name="O" orien="R0" />
    </sheet>
</drawing>