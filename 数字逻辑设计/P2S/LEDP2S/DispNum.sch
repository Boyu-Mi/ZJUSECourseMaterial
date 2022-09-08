<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="kintex7" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="clk" />
        <signal name="RST" />
        <signal name="clkd(31:0)" />
        <signal name="clkd(18:17)" />
        <signal name="HEXS(15:0)" />
        <signal name="points(3:0)" />
        <signal name="LES(3:0)" />
        <signal name="HEX(3:0)" />
        <signal name="HEX(3)" />
        <signal name="HEX(2)" />
        <signal name="HEX(1)" />
        <signal name="HEX(0)" />
        <signal name="XLXN_16" />
        <signal name="XLXN_17" />
        <signal name="Segment(7:0)" />
        <signal name="Segment(7)" />
        <signal name="Segment(6)" />
        <signal name="Segment(5)" />
        <signal name="Segment(4)" />
        <signal name="Segment(3)" />
        <signal name="Segment(2)" />
        <signal name="Segment(1)" />
        <signal name="Segment(0)" />
        <signal name="AN(3:0)" />
        <port polarity="Input" name="clk" />
        <port polarity="Input" name="RST" />
        <port polarity="Input" name="HEXS(15:0)" />
        <port polarity="Input" name="points(3:0)" />
        <port polarity="Input" name="LES(3:0)" />
        <port polarity="Output" name="Segment(7:0)" />
        <port polarity="Output" name="AN(3:0)" />
        <blockdef name="clkdiv">
            <timestamp>2020-11-2T2:34:12</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
        </blockdef>
        <blockdef name="DisplaySync">
            <timestamp>2020-11-2T2:14:43</timestamp>
            <rect width="256" x="64" y="-256" height="256" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-236" height="24" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="MyMC14495">
            <timestamp>2020-10-26T0:5:16</timestamp>
            <rect width="256" x="64" y="-512" height="512" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <line x2="0" y1="-400" y2="-400" x1="64" />
            <line x2="0" y1="-320" y2="-320" x1="64" />
            <line x2="0" y1="-240" y2="-240" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-80" y2="-80" x1="64" />
            <line x2="384" y1="-480" y2="-480" x1="320" />
            <line x2="384" y1="-416" y2="-416" x1="320" />
            <line x2="384" y1="-352" y2="-352" x1="320" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <block symbolname="clkdiv" name="XLXI_1">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="RST" name="rst" />
            <blockpin signalname="clkd(31:0)" name="clkdiv(31:0)" />
        </block>
        <block symbolname="DisplaySync" name="XLXI_2">
            <blockpin signalname="clkd(18:17)" name="Scan(1:0)" />
            <blockpin signalname="HEXS(15:0)" name="Hexs(15:0)" />
            <blockpin signalname="points(3:0)" name="point(3:0)" />
            <blockpin signalname="LES(3:0)" name="LES(3:0)" />
            <blockpin signalname="HEX(3:0)" name="HEX(3:0)" />
            <blockpin signalname="XLXN_16" name="p" />
            <blockpin signalname="XLXN_17" name="LE" />
            <blockpin signalname="AN(3:0)" name="AN(3:0)" />
        </block>
        <block symbolname="MyMC14495" name="XLXI_3">
            <blockpin signalname="HEX(3)" name="D3" />
            <blockpin signalname="HEX(2)" name="D2" />
            <blockpin signalname="HEX(1)" name="D1" />
            <blockpin signalname="HEX(0)" name="D0" />
            <blockpin signalname="XLXN_17" name="LE" />
            <blockpin signalname="XLXN_16" name="point" />
            <blockpin signalname="Segment(0)" name="a" />
            <blockpin signalname="Segment(1)" name="b" />
            <blockpin signalname="Segment(2)" name="c" />
            <blockpin signalname="Segment(3)" name="d" />
            <blockpin signalname="Segment(4)" name="e" />
            <blockpin signalname="Segment(5)" name="f" />
            <blockpin signalname="Segment(6)" name="g" />
            <blockpin signalname="Segment(7)" name="p" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="592" y="448" name="XLXI_1" orien="R0">
        </instance>
        <instance x="592" y="1344" name="XLXI_2" orien="R0">
        </instance>
        <instance x="1568" y="864" name="XLXI_3" orien="R0">
        </instance>
        <branch name="clk">
            <wire x2="592" y1="352" y2="352" x1="304" />
        </branch>
        <branch name="RST">
            <wire x2="592" y1="416" y2="416" x1="288" />
        </branch>
        <iomarker fontsize="28" x="304" y="352" name="clk" orien="R180" />
        <iomarker fontsize="28" x="288" y="416" name="RST" orien="R180" />
        <branch name="clkd(31:0)">
            <wire x2="1056" y1="944" y2="944" x1="320" />
            <wire x2="320" y1="944" y2="1120" x1="320" />
            <wire x2="320" y1="1120" y2="1136" x1="320" />
            <wire x2="1056" y1="352" y2="352" x1="976" />
            <wire x2="1056" y1="352" y2="944" x1="1056" />
        </branch>
        <bustap x2="416" y1="1120" y2="1120" x1="320" />
        <branch name="clkd(18:17)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="504" y="1120" type="branch" />
            <wire x2="504" y1="1120" y2="1120" x1="416" />
            <wire x2="592" y1="1120" y2="1120" x1="504" />
        </branch>
        <branch name="HEXS(15:0)">
            <wire x2="592" y1="1184" y2="1184" x1="240" />
        </branch>
        <branch name="points(3:0)">
            <wire x2="592" y1="1248" y2="1248" x1="240" />
        </branch>
        <branch name="LES(3:0)">
            <wire x2="592" y1="1312" y2="1312" x1="240" />
        </branch>
        <iomarker fontsize="28" x="240" y="1184" name="HEXS(15:0)" orien="R180" />
        <iomarker fontsize="28" x="240" y="1248" name="points(3:0)" orien="R180" />
        <iomarker fontsize="28" x="240" y="1312" name="LES(3:0)" orien="R180" />
        <branch name="HEX(3:0)">
            <wire x2="1216" y1="1120" y2="1120" x1="976" />
            <wire x2="1216" y1="320" y2="384" x1="1216" />
            <wire x2="1216" y1="384" y2="464" x1="1216" />
            <wire x2="1216" y1="464" y2="544" x1="1216" />
            <wire x2="1216" y1="544" y2="624" x1="1216" />
            <wire x2="1216" y1="624" y2="1120" x1="1216" />
        </branch>
        <bustap x2="1312" y1="384" y2="384" x1="1216" />
        <branch name="HEX(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1440" y="384" type="branch" />
            <wire x2="1440" y1="384" y2="384" x1="1312" />
            <wire x2="1568" y1="384" y2="384" x1="1440" />
        </branch>
        <bustap x2="1312" y1="464" y2="464" x1="1216" />
        <branch name="HEX(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1440" y="464" type="branch" />
            <wire x2="1440" y1="464" y2="464" x1="1312" />
            <wire x2="1568" y1="464" y2="464" x1="1440" />
        </branch>
        <bustap x2="1312" y1="544" y2="544" x1="1216" />
        <branch name="HEX(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1440" y="544" type="branch" />
            <wire x2="1440" y1="544" y2="544" x1="1312" />
            <wire x2="1568" y1="544" y2="544" x1="1440" />
        </branch>
        <bustap x2="1312" y1="624" y2="624" x1="1216" />
        <branch name="HEX(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1440" y="624" type="branch" />
            <wire x2="1440" y1="624" y2="624" x1="1312" />
            <wire x2="1568" y1="624" y2="624" x1="1440" />
        </branch>
        <branch name="XLXN_16">
            <wire x2="1280" y1="1184" y2="1184" x1="976" />
            <wire x2="1280" y1="784" y2="1184" x1="1280" />
            <wire x2="1568" y1="784" y2="784" x1="1280" />
        </branch>
        <branch name="XLXN_17">
            <wire x2="1392" y1="1248" y2="1248" x1="976" />
            <wire x2="1392" y1="704" y2="1248" x1="1392" />
            <wire x2="1568" y1="704" y2="704" x1="1392" />
        </branch>
        <branch name="Segment(7:0)">
            <wire x2="2208" y1="304" y2="384" x1="2208" />
            <wire x2="2208" y1="384" y2="448" x1="2208" />
            <wire x2="2208" y1="448" y2="464" x1="2208" />
            <wire x2="2208" y1="464" y2="512" x1="2208" />
            <wire x2="2208" y1="512" y2="576" x1="2208" />
            <wire x2="2208" y1="576" y2="640" x1="2208" />
            <wire x2="2208" y1="640" y2="704" x1="2208" />
            <wire x2="2208" y1="704" y2="768" x1="2208" />
            <wire x2="2208" y1="768" y2="832" x1="2208" />
            <wire x2="2208" y1="832" y2="992" x1="2208" />
            <wire x2="2448" y1="992" y2="992" x1="2208" />
        </branch>
        <iomarker fontsize="28" x="2448" y="992" name="Segment(7:0)" orien="R0" />
        <bustap x2="2112" y1="832" y2="832" x1="2208" />
        <branch name="Segment(7)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2032" y="832" type="branch" />
            <wire x2="2032" y1="832" y2="832" x1="1952" />
            <wire x2="2112" y1="832" y2="832" x1="2032" />
        </branch>
        <bustap x2="2112" y1="768" y2="768" x1="2208" />
        <branch name="Segment(6)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2032" y="768" type="branch" />
            <wire x2="2032" y1="768" y2="768" x1="1952" />
            <wire x2="2112" y1="768" y2="768" x1="2032" />
        </branch>
        <bustap x2="2112" y1="704" y2="704" x1="2208" />
        <branch name="Segment(5)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2032" y="704" type="branch" />
            <wire x2="2032" y1="704" y2="704" x1="1952" />
            <wire x2="2112" y1="704" y2="704" x1="2032" />
        </branch>
        <bustap x2="2112" y1="640" y2="640" x1="2208" />
        <branch name="Segment(4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2032" y="640" type="branch" />
            <wire x2="2032" y1="640" y2="640" x1="1952" />
            <wire x2="2112" y1="640" y2="640" x1="2032" />
        </branch>
        <bustap x2="2112" y1="576" y2="576" x1="2208" />
        <branch name="Segment(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2032" y="576" type="branch" />
            <wire x2="2032" y1="576" y2="576" x1="1952" />
            <wire x2="2112" y1="576" y2="576" x1="2032" />
        </branch>
        <bustap x2="2112" y1="512" y2="512" x1="2208" />
        <branch name="Segment(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2032" y="512" type="branch" />
            <wire x2="2032" y1="512" y2="512" x1="1952" />
            <wire x2="2112" y1="512" y2="512" x1="2032" />
        </branch>
        <bustap x2="2112" y1="448" y2="448" x1="2208" />
        <branch name="Segment(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2032" y="448" type="branch" />
            <wire x2="2032" y1="448" y2="448" x1="1952" />
            <wire x2="2112" y1="448" y2="448" x1="2032" />
        </branch>
        <bustap x2="2112" y1="384" y2="384" x1="2208" />
        <branch name="Segment(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2032" y="384" type="branch" />
            <wire x2="2032" y1="384" y2="384" x1="1952" />
            <wire x2="2112" y1="384" y2="384" x1="2032" />
        </branch>
        <branch name="AN(3:0)">
            <wire x2="1584" y1="1312" y2="1312" x1="976" />
        </branch>
        <iomarker fontsize="28" x="1584" y="1312" name="AN(3:0)" orien="R0" />
    </sheet>
</drawing>