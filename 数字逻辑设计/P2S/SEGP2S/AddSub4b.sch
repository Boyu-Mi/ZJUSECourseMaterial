<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="kintex7" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="Ctrl" />
        <signal name="A(3:0)" />
        <signal name="A(3)" />
        <signal name="A(2)" />
        <signal name="A(1)" />
        <signal name="A(0)" />
        <signal name="XLXN_7" />
        <signal name="B(3:0)" />
        <signal name="B(3)" />
        <signal name="B(2)" />
        <signal name="B(1)" />
        <signal name="B(0)" />
        <signal name="XLXN_13" />
        <signal name="XLXN_14" />
        <signal name="XLXN_15" />
        <signal name="XLXN_16" />
        <signal name="XLXN_17" />
        <signal name="XLXN_18" />
        <signal name="XLXN_19" />
        <signal name="XLXN_20" />
        <signal name="XLXN_21" />
        <signal name="XLXN_22" />
        <signal name="S(3:0)" />
        <signal name="S(3)" />
        <signal name="S(2)" />
        <signal name="S(1)" />
        <signal name="S(0)" />
        <signal name="XLXN_29" />
        <signal name="XLXN_30" />
        <signal name="XLXN_31" />
        <signal name="Co" />
        <port polarity="Input" name="Ctrl" />
        <port polarity="Input" name="A(3:0)" />
        <port polarity="Input" name="B(3:0)" />
        <port polarity="Output" name="S(3:0)" />
        <port polarity="Output" name="Co" />
        <blockdef name="AddSub1b">
            <timestamp>2020-11-8T13:6:16</timestamp>
            <rect width="256" x="64" y="-256" height="256" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <block symbolname="AddSub1b" name="XLXI_1">
            <blockpin signalname="A(0)" name="A" />
            <blockpin signalname="B(0)" name="B" />
            <blockpin signalname="Ctrl" name="Ctrl" />
            <blockpin signalname="Ctrl" name="Ci" />
            <blockpin signalname="XLXN_18" name="Co" />
            <blockpin signalname="S(0)" name="S" />
        </block>
        <block symbolname="AddSub1b" name="XLXI_2">
            <blockpin signalname="A(1)" name="A" />
            <blockpin signalname="B(1)" name="B" />
            <blockpin signalname="Ctrl" name="Ctrl" />
            <blockpin signalname="XLXN_18" name="Ci" />
            <blockpin signalname="XLXN_20" name="Co" />
            <blockpin signalname="S(1)" name="S" />
        </block>
        <block symbolname="AddSub1b" name="XLXI_3">
            <blockpin signalname="A(2)" name="A" />
            <blockpin signalname="B(2)" name="B" />
            <blockpin signalname="Ctrl" name="Ctrl" />
            <blockpin signalname="XLXN_20" name="Ci" />
            <blockpin signalname="XLXN_22" name="Co" />
            <blockpin signalname="S(2)" name="S" />
        </block>
        <block symbolname="AddSub1b" name="XLXI_4">
            <blockpin signalname="A(3)" name="A" />
            <blockpin signalname="B(3)" name="B" />
            <blockpin signalname="Ctrl" name="Ctrl" />
            <blockpin signalname="XLXN_22" name="Ci" />
            <blockpin signalname="Co" name="Co" />
            <blockpin signalname="S(3)" name="S" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="864" y="448" name="XLXI_1" orien="R0">
        </instance>
        <instance x="864" y="896" name="XLXI_2" orien="R0">
        </instance>
        <instance x="864" y="1360" name="XLXI_3" orien="R0">
        </instance>
        <instance x="864" y="1856" name="XLXI_4" orien="R0">
        </instance>
        <branch name="Ctrl">
            <wire x2="688" y1="144" y2="144" x1="192" />
            <wire x2="688" y1="144" y2="352" x1="688" />
            <wire x2="864" y1="352" y2="352" x1="688" />
            <wire x2="688" y1="352" y2="416" x1="688" />
            <wire x2="688" y1="416" y2="800" x1="688" />
            <wire x2="864" y1="800" y2="800" x1="688" />
            <wire x2="688" y1="800" y2="1264" x1="688" />
            <wire x2="688" y1="1264" y2="1760" x1="688" />
            <wire x2="864" y1="1760" y2="1760" x1="688" />
            <wire x2="864" y1="1264" y2="1264" x1="688" />
            <wire x2="864" y1="416" y2="416" x1="688" />
        </branch>
        <iomarker fontsize="28" x="192" y="144" name="Ctrl" orien="R180" />
        <branch name="A(3:0)">
            <wire x2="144" y1="400" y2="496" x1="144" />
            <wire x2="144" y1="496" y2="608" x1="144" />
            <wire x2="144" y1="608" y2="720" x1="144" />
            <wire x2="144" y1="720" y2="832" x1="144" />
            <wire x2="144" y1="832" y2="944" x1="144" />
        </branch>
        <iomarker fontsize="28" x="144" y="400" name="A(3:0)" orien="R270" />
        <bustap x2="240" y1="832" y2="832" x1="144" />
        <branch name="A(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="272" y="832" type="branch" />
            <wire x2="272" y1="832" y2="832" x1="240" />
            <wire x2="304" y1="832" y2="832" x1="272" />
            <wire x2="384" y1="832" y2="832" x1="304" />
            <wire x2="384" y1="832" y2="1632" x1="384" />
            <wire x2="864" y1="1632" y2="1632" x1="384" />
        </branch>
        <bustap x2="240" y1="720" y2="720" x1="144" />
        <branch name="A(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="272" y="720" type="branch" />
            <wire x2="272" y1="720" y2="720" x1="240" />
            <wire x2="304" y1="720" y2="720" x1="272" />
            <wire x2="416" y1="720" y2="720" x1="304" />
            <wire x2="416" y1="720" y2="1120" x1="416" />
            <wire x2="416" y1="1120" y2="1136" x1="416" />
            <wire x2="864" y1="1136" y2="1136" x1="416" />
        </branch>
        <bustap x2="240" y1="608" y2="608" x1="144" />
        <branch name="A(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="272" y="608" type="branch" />
            <wire x2="272" y1="608" y2="608" x1="240" />
            <wire x2="304" y1="608" y2="608" x1="272" />
            <wire x2="416" y1="608" y2="608" x1="304" />
            <wire x2="416" y1="608" y2="672" x1="416" />
            <wire x2="864" y1="672" y2="672" x1="416" />
        </branch>
        <bustap x2="240" y1="496" y2="496" x1="144" />
        <branch name="A(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="272" y="496" type="branch" />
            <wire x2="272" y1="496" y2="496" x1="240" />
            <wire x2="304" y1="496" y2="496" x1="272" />
            <wire x2="416" y1="496" y2="496" x1="304" />
            <wire x2="416" y1="224" y2="496" x1="416" />
            <wire x2="864" y1="224" y2="224" x1="416" />
        </branch>
        <branch name="B(3:0)">
            <wire x2="144" y1="1232" y2="1392" x1="144" />
            <wire x2="144" y1="1392" y2="1488" x1="144" />
            <wire x2="144" y1="1488" y2="1584" x1="144" />
            <wire x2="144" y1="1584" y2="1680" x1="144" />
            <wire x2="144" y1="1680" y2="1792" x1="144" />
        </branch>
        <iomarker fontsize="28" x="144" y="1232" name="B(3:0)" orien="R270" />
        <bustap x2="240" y1="1680" y2="1680" x1="144" />
        <branch name="B(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="280" y="1680" type="branch" />
            <wire x2="280" y1="1680" y2="1680" x1="240" />
            <wire x2="320" y1="1680" y2="1680" x1="280" />
            <wire x2="320" y1="1680" y2="1696" x1="320" />
            <wire x2="864" y1="1696" y2="1696" x1="320" />
        </branch>
        <bustap x2="240" y1="1584" y2="1584" x1="144" />
        <branch name="B(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="280" y="1584" type="branch" />
            <wire x2="280" y1="1584" y2="1584" x1="240" />
            <wire x2="320" y1="1584" y2="1584" x1="280" />
            <wire x2="752" y1="1584" y2="1584" x1="320" />
            <wire x2="864" y1="1200" y2="1200" x1="752" />
            <wire x2="752" y1="1200" y2="1584" x1="752" />
        </branch>
        <bustap x2="240" y1="1488" y2="1488" x1="144" />
        <branch name="B(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="272" y="1488" type="branch" />
            <wire x2="272" y1="1488" y2="1488" x1="240" />
            <wire x2="304" y1="1488" y2="1488" x1="272" />
            <wire x2="640" y1="1488" y2="1488" x1="304" />
            <wire x2="864" y1="736" y2="736" x1="640" />
            <wire x2="640" y1="736" y2="1488" x1="640" />
        </branch>
        <bustap x2="240" y1="1392" y2="1392" x1="144" />
        <branch name="B(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="272" y="1392" type="branch" />
            <wire x2="272" y1="1392" y2="1392" x1="240" />
            <wire x2="304" y1="1392" y2="1392" x1="272" />
            <wire x2="592" y1="1392" y2="1392" x1="304" />
            <wire x2="864" y1="288" y2="288" x1="592" />
            <wire x2="592" y1="288" y2="1376" x1="592" />
            <wire x2="592" y1="1376" y2="1392" x1="592" />
        </branch>
        <branch name="XLXN_18">
            <wire x2="864" y1="864" y2="864" x1="848" />
            <wire x2="848" y1="864" y2="960" x1="848" />
            <wire x2="864" y1="960" y2="960" x1="848" />
            <wire x2="1456" y1="960" y2="960" x1="864" />
            <wire x2="1456" y1="224" y2="224" x1="1248" />
            <wire x2="1456" y1="224" y2="960" x1="1456" />
        </branch>
        <branch name="XLXN_20">
            <wire x2="864" y1="1328" y2="1328" x1="848" />
            <wire x2="848" y1="1328" y2="1440" x1="848" />
            <wire x2="864" y1="1440" y2="1440" x1="848" />
            <wire x2="1568" y1="1440" y2="1440" x1="864" />
            <wire x2="1568" y1="672" y2="672" x1="1248" />
            <wire x2="1568" y1="672" y2="1440" x1="1568" />
        </branch>
        <branch name="XLXN_22">
            <wire x2="864" y1="1824" y2="1824" x1="848" />
            <wire x2="848" y1="1824" y2="1936" x1="848" />
            <wire x2="864" y1="1936" y2="1936" x1="848" />
            <wire x2="1648" y1="1936" y2="1936" x1="864" />
            <wire x2="1648" y1="1136" y2="1136" x1="1248" />
            <wire x2="1648" y1="1136" y2="1936" x1="1648" />
        </branch>
        <branch name="S(3:0)">
            <wire x2="2144" y1="464" y2="720" x1="2144" />
            <wire x2="2144" y1="720" y2="848" x1="2144" />
            <wire x2="2144" y1="848" y2="960" x1="2144" />
            <wire x2="2144" y1="960" y2="1072" x1="2144" />
            <wire x2="2144" y1="1072" y2="1184" x1="2144" />
        </branch>
        <iomarker fontsize="28" x="2144" y="1184" name="S(3:0)" orien="R90" />
        <bustap x2="2048" y1="1072" y2="1072" x1="2144" />
        <branch name="S(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2024" y="1072" type="branch" />
            <wire x2="1872" y1="1824" y2="1824" x1="1248" />
            <wire x2="1872" y1="1072" y2="1824" x1="1872" />
            <wire x2="2000" y1="1072" y2="1072" x1="1872" />
            <wire x2="2024" y1="1072" y2="1072" x1="2000" />
            <wire x2="2048" y1="1072" y2="1072" x1="2024" />
        </branch>
        <bustap x2="2048" y1="960" y2="960" x1="2144" />
        <branch name="S(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2024" y="960" type="branch" />
            <wire x2="1792" y1="1328" y2="1328" x1="1248" />
            <wire x2="1792" y1="960" y2="1328" x1="1792" />
            <wire x2="2000" y1="960" y2="960" x1="1792" />
            <wire x2="2024" y1="960" y2="960" x1="2000" />
            <wire x2="2048" y1="960" y2="960" x1="2024" />
        </branch>
        <bustap x2="2048" y1="848" y2="848" x1="2144" />
        <branch name="S(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2024" y="848" type="branch" />
            <wire x2="2000" y1="864" y2="864" x1="1248" />
            <wire x2="2024" y1="848" y2="848" x1="2000" />
            <wire x2="2048" y1="848" y2="848" x1="2024" />
            <wire x2="2000" y1="848" y2="864" x1="2000" />
        </branch>
        <bustap x2="2048" y1="720" y2="720" x1="2144" />
        <branch name="S(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2024" y="720" type="branch" />
            <wire x2="1872" y1="416" y2="416" x1="1248" />
            <wire x2="1872" y1="416" y2="720" x1="1872" />
            <wire x2="2000" y1="720" y2="720" x1="1872" />
            <wire x2="2024" y1="720" y2="720" x1="2000" />
            <wire x2="2048" y1="720" y2="720" x1="2024" />
        </branch>
        <branch name="Co">
            <wire x2="2016" y1="1632" y2="1632" x1="1248" />
        </branch>
        <iomarker fontsize="28" x="2016" y="1632" name="Co" orien="R0" />
    </sheet>
</drawing>