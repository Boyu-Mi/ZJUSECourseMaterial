<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="kintex7" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="S1" />
        <signal name="S2" />
        <signal name="S3" />
        <signal name="S4">
        </signal>
        <signal name="S5">
        </signal>
        <signal name="S6">
        </signal>
        <signal name="F(7:0)" />
        <signal name="F(7)">
        </signal>
        <signal name="F(6)">
        </signal>
        <signal name="F(5)">
        </signal>
        <signal name="F(4)">
        </signal>
        <signal name="F(3)">
        </signal>
        <signal name="F(2)">
        </signal>
        <signal name="F(1)">
        </signal>
        <signal name="F(0)">
        </signal>
        <signal name="XLXN_15" />
        <signal name="XLXN_16" />
        <signal name="FFF" />
        <signal name="XLXN_18" />
        <signal name="XLXN_19" />
        <port polarity="Input" name="S1" />
        <port polarity="Input" name="S2" />
        <port polarity="Input" name="S3" />
        <port polarity="Output" name="FFF" />
        <blockdef name="D_74LS138_SCH">
            <timestamp>2021-10-18T10:21:25</timestamp>
            <rect width="256" x="64" y="-384" height="384" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-364" height="24" />
            <line x2="384" y1="-352" y2="-352" x1="320" />
        </blockdef>
        <blockdef name="nand4">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="216" y1="-160" y2="-160" x1="256" />
            <circle r="12" cx="204" cy="-160" />
            <line x2="64" y1="-64" y2="-256" x1="64" />
            <line x2="144" y1="-208" y2="-208" x1="64" />
            <arc ex="144" ey="-208" sx="144" sy="-112" r="48" cx="144" cy="-160" />
            <line x2="64" y1="-112" y2="-112" x1="144" />
        </blockdef>
        <blockdef name="vcc">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-64" x1="64" />
            <line x2="64" y1="0" y2="-32" x1="64" />
            <line x2="32" y1="-64" y2="-64" x1="96" />
        </blockdef>
        <blockdef name="gnd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-96" x1="64" />
            <line x2="52" y1="-48" y2="-48" x1="76" />
            <line x2="60" y1="-32" y2="-32" x1="68" />
            <line x2="40" y1="-64" y2="-64" x1="88" />
            <line x2="64" y1="-64" y2="-80" x1="64" />
            <line x2="64" y1="-128" y2="-96" x1="64" />
        </blockdef>
        <block symbolname="D_74LS138_SCH" name="XLXI_1">
            <blockpin signalname="S1" name="A" />
            <blockpin signalname="S2" name="B" />
            <blockpin signalname="S3" name="C" />
            <blockpin signalname="S4" name="G" />
            <blockpin signalname="S5" name="G2A" />
            <blockpin signalname="S6" name="G2B" />
            <blockpin signalname="F(7:0)" name="Y(7:0)" />
        </block>
        <block symbolname="nand4" name="XLXI_2">
            <blockpin signalname="F(1)" name="I0" />
            <blockpin signalname="F(2)" name="I1" />
            <blockpin signalname="F(4)" name="I2" />
            <blockpin signalname="F(7)" name="I3" />
            <blockpin signalname="FFF" name="O" />
        </block>
        <block symbolname="vcc" name="XLXI_3">
            <blockpin signalname="S4" name="P" />
        </block>
        <block symbolname="gnd" name="XLXI_4">
            <blockpin signalname="S5" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_5">
            <blockpin signalname="S6" name="G" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1520" y="1424" name="XLXI_1" orien="R0">
        </instance>
        <branch name="S1">
            <wire x2="1520" y1="1072" y2="1072" x1="1488" />
        </branch>
        <branch name="S2">
            <wire x2="1520" y1="1136" y2="1136" x1="1488" />
        </branch>
        <iomarker fontsize="28" x="1488" y="1136" name="S2" orien="R180" />
        <branch name="S3">
            <wire x2="1520" y1="1200" y2="1200" x1="1488" />
        </branch>
        <iomarker fontsize="28" x="1488" y="1200" name="S3" orien="R180" />
        <branch name="S4">
            <wire x2="1232" y1="1296" y2="1360" x1="1232" />
            <wire x2="1328" y1="1360" y2="1360" x1="1232" />
            <wire x2="1328" y1="1248" y2="1360" x1="1328" />
            <wire x2="1488" y1="1248" y2="1248" x1="1328" />
            <wire x2="1488" y1="1248" y2="1264" x1="1488" />
            <wire x2="1520" y1="1264" y2="1264" x1="1488" />
        </branch>
        <branch name="S5">
            <wire x2="1152" y1="1216" y2="1280" x1="1152" />
            <wire x2="1184" y1="1216" y2="1216" x1="1152" />
            <wire x2="1184" y1="1216" y2="1328" x1="1184" />
            <wire x2="1488" y1="1328" y2="1328" x1="1184" />
            <wire x2="1520" y1="1328" y2="1328" x1="1488" />
        </branch>
        <branch name="S6">
            <wire x2="1488" y1="1408" y2="1408" x1="1232" />
            <wire x2="1504" y1="1408" y2="1408" x1="1488" />
            <wire x2="1232" y1="1408" y2="1424" x1="1232" />
            <wire x2="1520" y1="1392" y2="1392" x1="1504" />
            <wire x2="1504" y1="1392" y2="1408" x1="1504" />
        </branch>
        <iomarker fontsize="28" x="1488" y="1072" name="S1" orien="R180" />
        <branch name="F(7:0)">
            <wire x2="2096" y1="1072" y2="1072" x1="1904" />
            <wire x2="2096" y1="1072" y2="1088" x1="2096" />
            <wire x2="2096" y1="1088" y2="1120" x1="2096" />
            <wire x2="2096" y1="1120" y2="1136" x1="2096" />
            <wire x2="2096" y1="1136" y2="1184" x1="2096" />
            <wire x2="2096" y1="1184" y2="1232" x1="2096" />
            <wire x2="2096" y1="1232" y2="1280" x1="2096" />
            <wire x2="2096" y1="1280" y2="1344" x1="2096" />
            <wire x2="2096" y1="1344" y2="1392" x1="2096" />
            <wire x2="2096" y1="1392" y2="1440" x1="2096" />
            <wire x2="2096" y1="1440" y2="1472" x1="2096" />
            <wire x2="2096" y1="1472" y2="1504" x1="2096" />
        </branch>
        <bustap x2="2192" y1="1184" y2="1184" x1="2096" />
        <branch name="F(7)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2208" y="1184" type="branch" />
            <wire x2="2208" y1="1184" y2="1184" x1="2192" />
            <wire x2="2224" y1="1184" y2="1184" x1="2208" />
            <wire x2="2400" y1="1168" y2="1168" x1="2224" />
            <wire x2="2224" y1="1168" y2="1184" x1="2224" />
        </branch>
        <bustap x2="2192" y1="1232" y2="1232" x1="2096" />
        <branch name="F(6)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2208" y="1232" type="branch" />
            <wire x2="2208" y1="1232" y2="1232" x1="2192" />
            <wire x2="2224" y1="1232" y2="1232" x1="2208" />
        </branch>
        <bustap x2="2192" y1="1280" y2="1280" x1="2096" />
        <branch name="F(5)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2208" y="1280" type="branch" />
            <wire x2="2208" y1="1280" y2="1280" x1="2192" />
            <wire x2="2224" y1="1280" y2="1280" x1="2208" />
        </branch>
        <bustap x2="2192" y1="1344" y2="1344" x1="2096" />
        <branch name="F(4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2208" y="1344" type="branch" />
            <wire x2="2208" y1="1344" y2="1344" x1="2192" />
            <wire x2="2224" y1="1344" y2="1344" x1="2208" />
            <wire x2="2336" y1="1344" y2="1344" x1="2224" />
            <wire x2="2336" y1="1232" y2="1344" x1="2336" />
            <wire x2="2400" y1="1232" y2="1232" x1="2336" />
        </branch>
        <bustap x2="2192" y1="1392" y2="1392" x1="2096" />
        <branch name="F(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2208" y="1392" type="branch" />
            <wire x2="2208" y1="1392" y2="1392" x1="2192" />
            <wire x2="2224" y1="1392" y2="1392" x1="2208" />
        </branch>
        <bustap x2="2192" y1="1440" y2="1440" x1="2096" />
        <branch name="F(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2216" y="1440" type="branch" />
            <wire x2="2216" y1="1440" y2="1440" x1="2192" />
            <wire x2="2240" y1="1440" y2="1440" x1="2216" />
            <wire x2="2352" y1="1440" y2="1440" x1="2240" />
            <wire x2="2352" y1="1296" y2="1440" x1="2352" />
            <wire x2="2400" y1="1296" y2="1296" x1="2352" />
        </branch>
        <bustap x2="2192" y1="1472" y2="1472" x1="2096" />
        <branch name="F(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2216" y="1472" type="branch" />
            <wire x2="2216" y1="1472" y2="1472" x1="2192" />
            <wire x2="2240" y1="1472" y2="1472" x1="2216" />
            <wire x2="2400" y1="1472" y2="1472" x1="2240" />
            <wire x2="2400" y1="1360" y2="1472" x1="2400" />
        </branch>
        <bustap x2="2192" y1="1088" y2="1088" x1="2096" />
        <branch name="F(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2208" y="1088" type="branch" />
            <wire x2="2208" y1="1088" y2="1088" x1="2192" />
            <wire x2="2224" y1="1088" y2="1088" x1="2208" />
        </branch>
        <instance x="2400" y="1424" name="XLXI_2" orien="R0" />
        <branch name="FFF">
            <wire x2="2688" y1="1264" y2="1264" x1="2656" />
        </branch>
        <iomarker fontsize="28" x="2688" y="1264" name="FFF" orien="R0" />
        <instance x="1168" y="1296" name="XLXI_3" orien="R0" />
        <instance x="1088" y="1408" name="XLXI_4" orien="R0" />
        <instance x="1168" y="1552" name="XLXI_5" orien="R0" />
    </sheet>
</drawing>