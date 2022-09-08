<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="kintex7" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="A" />
        <signal name="B" />
        <signal name="XLXN_17" />
        <signal name="XLXN_21" />
        <signal name="C" />
        <signal name="XLXN_28" />
        <signal name="XLXN_30" />
        <signal name="XLXN_32" />
        <signal name="XLXN_34" />
        <signal name="XLXN_39" />
        <signal name="G" />
        <signal name="G2A" />
        <signal name="G2B" />
        <signal name="XLXN_47" />
        <signal name="XLXN_58" />
        <signal name="Y(7:0)" />
        <signal name="Y(7)" />
        <signal name="Y(6)" />
        <signal name="Y(5)" />
        <signal name="Y(4)" />
        <signal name="Y(3)" />
        <signal name="Y(2)" />
        <signal name="Y(1)" />
        <signal name="Y(0)" />
        <port polarity="Input" name="A" />
        <port polarity="Input" name="B" />
        <port polarity="Input" name="C" />
        <port polarity="Input" name="G" />
        <port polarity="Input" name="G2A" />
        <port polarity="Input" name="G2B" />
        <port polarity="Output" name="Y(7:0)" />
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
        <blockdef name="nand3">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="216" y1="-128" y2="-128" x1="256" />
            <circle r="12" cx="204" cy="-128" />
            <line x2="144" y1="-176" y2="-176" x1="64" />
            <line x2="64" y1="-80" y2="-80" x1="144" />
            <arc ex="144" ey="-176" sx="144" sy="-80" r="48" cx="144" cy="-128" />
            <line x2="64" y1="-64" y2="-192" x1="64" />
        </blockdef>
        <blockdef name="nor3">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="48" y1="-64" y2="-64" x1="0" />
            <line x2="72" y1="-128" y2="-128" x1="0" />
            <line x2="48" y1="-192" y2="-192" x1="0" />
            <line x2="216" y1="-128" y2="-128" x1="256" />
            <circle r="12" cx="204" cy="-128" />
            <line x2="48" y1="-64" y2="-80" x1="48" />
            <line x2="48" y1="-192" y2="-176" x1="48" />
            <line x2="48" y1="-80" y2="-80" x1="112" />
            <line x2="48" y1="-176" y2="-176" x1="112" />
            <arc ex="48" ey="-176" sx="48" sy="-80" r="56" cx="16" cy="-128" />
            <arc ex="192" ey="-128" sx="112" sy="-80" r="88" cx="116" cy="-168" />
            <arc ex="112" ey="-176" sx="192" sy="-128" r="88" cx="116" cy="-88" />
        </blockdef>
        <block symbolname="inv" name="XLXI_7">
            <blockpin signalname="A" name="I" />
            <blockpin signalname="XLXN_17" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_8">
            <blockpin signalname="B" name="I" />
            <blockpin signalname="XLXN_21" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_9">
            <blockpin signalname="XLXN_21" name="I0" />
            <blockpin signalname="XLXN_17" name="I1" />
            <blockpin signalname="XLXN_28" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_10">
            <blockpin signalname="XLXN_21" name="I0" />
            <blockpin signalname="A" name="I1" />
            <blockpin signalname="XLXN_30" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_11">
            <blockpin signalname="B" name="I0" />
            <blockpin signalname="XLXN_17" name="I1" />
            <blockpin signalname="XLXN_32" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_12">
            <blockpin signalname="B" name="I0" />
            <blockpin signalname="A" name="I1" />
            <blockpin signalname="XLXN_34" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_13">
            <blockpin signalname="C" name="I" />
            <blockpin signalname="XLXN_39" name="O" />
        </block>
        <block symbolname="nand3" name="XLXI_14">
            <blockpin signalname="XLXN_39" name="I0" />
            <blockpin signalname="XLXN_58" name="I1" />
            <blockpin signalname="XLXN_28" name="I2" />
            <blockpin signalname="Y(7)" name="O" />
        </block>
        <block symbolname="nand3" name="XLXI_15">
            <blockpin signalname="XLXN_39" name="I0" />
            <blockpin signalname="XLXN_58" name="I1" />
            <blockpin signalname="XLXN_30" name="I2" />
            <blockpin signalname="Y(6)" name="O" />
        </block>
        <block symbolname="nand3" name="XLXI_16">
            <blockpin signalname="XLXN_39" name="I0" />
            <blockpin signalname="XLXN_58" name="I1" />
            <blockpin signalname="XLXN_32" name="I2" />
            <blockpin signalname="Y(5)" name="O" />
        </block>
        <block symbolname="nand3" name="XLXI_17">
            <blockpin signalname="XLXN_39" name="I0" />
            <blockpin signalname="XLXN_58" name="I1" />
            <blockpin signalname="XLXN_34" name="I2" />
            <blockpin signalname="Y(4)" name="O" />
        </block>
        <block symbolname="nand3" name="XLXI_18">
            <blockpin signalname="C" name="I0" />
            <blockpin signalname="XLXN_58" name="I1" />
            <blockpin signalname="XLXN_28" name="I2" />
            <blockpin signalname="Y(3)" name="O" />
        </block>
        <block symbolname="nand3" name="XLXI_19">
            <blockpin signalname="C" name="I0" />
            <blockpin signalname="XLXN_58" name="I1" />
            <blockpin signalname="XLXN_30" name="I2" />
            <blockpin signalname="Y(2)" name="O" />
        </block>
        <block symbolname="nand3" name="XLXI_20">
            <blockpin signalname="C" name="I0" />
            <blockpin signalname="XLXN_58" name="I1" />
            <blockpin signalname="XLXN_32" name="I2" />
            <blockpin signalname="Y(1)" name="O" />
        </block>
        <block symbolname="nand3" name="XLXI_21">
            <blockpin signalname="C" name="I0" />
            <blockpin signalname="XLXN_58" name="I1" />
            <blockpin signalname="XLXN_34" name="I2" />
            <blockpin signalname="Y(0)" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_22">
            <blockpin signalname="G" name="I" />
            <blockpin signalname="XLXN_47" name="O" />
        </block>
        <block symbolname="nor3" name="XLXI_23">
            <blockpin signalname="G2B" name="I0" />
            <blockpin signalname="G2A" name="I1" />
            <blockpin signalname="XLXN_47" name="I2" />
            <blockpin signalname="XLXN_58" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="464" y="320" name="XLXI_7" orien="R0" />
        <instance x="464" y="688" name="XLXI_8" orien="R0" />
        <branch name="A">
            <wire x2="448" y1="400" y2="400" x1="272" />
            <wire x2="928" y1="400" y2="400" x1="448" />
            <wire x2="928" y1="400" y2="496" x1="928" />
            <wire x2="1040" y1="496" y2="496" x1="928" />
            <wire x2="928" y1="496" y2="1088" x1="928" />
            <wire x2="1024" y1="1088" y2="1088" x1="928" />
            <wire x2="464" y1="288" y2="288" x1="448" />
            <wire x2="448" y1="288" y2="400" x1="448" />
        </branch>
        <branch name="B">
            <wire x2="448" y1="800" y2="800" x1="272" />
            <wire x2="448" y1="800" y2="864" x1="448" />
            <wire x2="976" y1="864" y2="864" x1="448" />
            <wire x2="1024" y1="864" y2="864" x1="976" />
            <wire x2="976" y1="864" y2="1152" x1="976" />
            <wire x2="1024" y1="1152" y2="1152" x1="976" />
            <wire x2="464" y1="656" y2="656" x1="448" />
            <wire x2="448" y1="656" y2="800" x1="448" />
        </branch>
        <instance x="1040" y="352" name="XLXI_9" orien="R0" />
        <instance x="1040" y="624" name="XLXI_10" orien="R0" />
        <instance x="1024" y="928" name="XLXI_11" orien="R0" />
        <branch name="XLXN_17">
            <wire x2="864" y1="288" y2="288" x1="688" />
            <wire x2="864" y1="288" y2="800" x1="864" />
            <wire x2="1024" y1="800" y2="800" x1="864" />
            <wire x2="864" y1="224" y2="288" x1="864" />
            <wire x2="1040" y1="224" y2="224" x1="864" />
        </branch>
        <branch name="XLXN_21">
            <wire x2="976" y1="656" y2="656" x1="688" />
            <wire x2="1040" y1="288" y2="288" x1="976" />
            <wire x2="976" y1="288" y2="560" x1="976" />
            <wire x2="1040" y1="560" y2="560" x1="976" />
            <wire x2="976" y1="560" y2="656" x1="976" />
        </branch>
        <instance x="1024" y="1216" name="XLXI_12" orien="R0" />
        <instance x="1664" y="240" name="XLXI_14" orien="R0" />
        <instance x="1664" y="480" name="XLXI_15" orien="R0" />
        <instance x="1664" y="720" name="XLXI_16" orien="R0" />
        <instance x="1664" y="944" name="XLXI_17" orien="R0" />
        <instance x="1664" y="1168" name="XLXI_18" orien="R0" />
        <instance x="1664" y="1408" name="XLXI_19" orien="R0" />
        <instance x="1664" y="1648" name="XLXI_20" orien="R0" />
        <branch name="XLXN_28">
            <wire x2="1312" y1="256" y2="256" x1="1296" />
            <wire x2="1312" y1="256" y2="976" x1="1312" />
            <wire x2="1664" y1="976" y2="976" x1="1312" />
            <wire x2="1312" y1="48" y2="256" x1="1312" />
            <wire x2="1664" y1="48" y2="48" x1="1312" />
        </branch>
        <branch name="XLXN_30">
            <wire x2="1360" y1="528" y2="528" x1="1296" />
            <wire x2="1360" y1="528" y2="1216" x1="1360" />
            <wire x2="1664" y1="1216" y2="1216" x1="1360" />
            <wire x2="1360" y1="288" y2="528" x1="1360" />
            <wire x2="1664" y1="288" y2="288" x1="1360" />
        </branch>
        <branch name="XLXN_32">
            <wire x2="1392" y1="832" y2="832" x1="1280" />
            <wire x2="1392" y1="832" y2="1456" x1="1392" />
            <wire x2="1664" y1="1456" y2="1456" x1="1392" />
            <wire x2="1392" y1="528" y2="832" x1="1392" />
            <wire x2="1664" y1="528" y2="528" x1="1392" />
        </branch>
        <branch name="XLXN_39">
            <wire x2="1472" y1="1280" y2="1280" x1="1264" />
            <wire x2="1664" y1="176" y2="176" x1="1472" />
            <wire x2="1472" y1="176" y2="416" x1="1472" />
            <wire x2="1664" y1="416" y2="416" x1="1472" />
            <wire x2="1472" y1="416" y2="656" x1="1472" />
            <wire x2="1664" y1="656" y2="656" x1="1472" />
            <wire x2="1472" y1="656" y2="880" x1="1472" />
            <wire x2="1664" y1="880" y2="880" x1="1472" />
            <wire x2="1472" y1="880" y2="1280" x1="1472" />
        </branch>
        <instance x="1040" y="1312" name="XLXI_13" orien="R0" />
        <instance x="432" y="1776" name="XLXI_22" orien="R0" />
        <instance x="896" y="2016" name="XLXI_23" orien="R0" />
        <branch name="G">
            <wire x2="432" y1="1744" y2="1744" x1="256" />
        </branch>
        <branch name="G2A">
            <wire x2="896" y1="1888" y2="1888" x1="288" />
        </branch>
        <branch name="G2B">
            <wire x2="896" y1="1952" y2="1952" x1="288" />
        </branch>
        <iomarker fontsize="28" x="288" y="1888" name="G2A" orien="R180" />
        <iomarker fontsize="28" x="288" y="1952" name="G2B" orien="R180" />
        <branch name="XLXN_47">
            <wire x2="896" y1="1744" y2="1744" x1="656" />
            <wire x2="896" y1="1744" y2="1824" x1="896" />
        </branch>
        <branch name="C">
            <wire x2="944" y1="1344" y2="1344" x1="272" />
            <wire x2="1536" y1="1344" y2="1344" x1="944" />
            <wire x2="1664" y1="1344" y2="1344" x1="1536" />
            <wire x2="1536" y1="1344" y2="1584" x1="1536" />
            <wire x2="1664" y1="1584" y2="1584" x1="1536" />
            <wire x2="1536" y1="1584" y2="1824" x1="1536" />
            <wire x2="1664" y1="1824" y2="1824" x1="1536" />
            <wire x2="1040" y1="1280" y2="1280" x1="944" />
            <wire x2="944" y1="1280" y2="1344" x1="944" />
            <wire x2="1664" y1="1104" y2="1104" x1="1536" />
            <wire x2="1536" y1="1104" y2="1344" x1="1536" />
        </branch>
        <branch name="XLXN_34">
            <wire x2="1424" y1="1120" y2="1120" x1="1280" />
            <wire x2="1424" y1="1120" y2="1696" x1="1424" />
            <wire x2="1664" y1="1696" y2="1696" x1="1424" />
            <wire x2="1424" y1="752" y2="1120" x1="1424" />
            <wire x2="1664" y1="752" y2="752" x1="1424" />
        </branch>
        <instance x="1664" y="1888" name="XLXI_21" orien="R0" />
        <branch name="XLXN_58">
            <wire x2="1616" y1="1888" y2="1888" x1="1152" />
            <wire x2="1664" y1="112" y2="112" x1="1616" />
            <wire x2="1616" y1="112" y2="352" x1="1616" />
            <wire x2="1664" y1="352" y2="352" x1="1616" />
            <wire x2="1616" y1="352" y2="592" x1="1616" />
            <wire x2="1664" y1="592" y2="592" x1="1616" />
            <wire x2="1616" y1="592" y2="816" x1="1616" />
            <wire x2="1664" y1="816" y2="816" x1="1616" />
            <wire x2="1616" y1="816" y2="1040" x1="1616" />
            <wire x2="1664" y1="1040" y2="1040" x1="1616" />
            <wire x2="1616" y1="1040" y2="1280" x1="1616" />
            <wire x2="1664" y1="1280" y2="1280" x1="1616" />
            <wire x2="1616" y1="1280" y2="1520" x1="1616" />
            <wire x2="1664" y1="1520" y2="1520" x1="1616" />
            <wire x2="1616" y1="1520" y2="1760" x1="1616" />
            <wire x2="1616" y1="1760" y2="1888" x1="1616" />
            <wire x2="1664" y1="1760" y2="1760" x1="1616" />
        </branch>
        <iomarker fontsize="28" x="256" y="1744" name="G" orien="R180" />
        <iomarker fontsize="28" x="272" y="1344" name="C" orien="R180" />
        <iomarker fontsize="28" x="272" y="800" name="B" orien="R180" />
        <iomarker fontsize="28" x="272" y="400" name="A" orien="R180" />
        <branch name="Y(7:0)">
            <wire x2="2416" y1="48" y2="112" x1="2416" />
            <wire x2="2416" y1="112" y2="336" x1="2416" />
            <wire x2="2416" y1="336" y2="576" x1="2416" />
            <wire x2="2416" y1="576" y2="800" x1="2416" />
            <wire x2="2416" y1="800" y2="848" x1="2416" />
            <wire x2="2560" y1="848" y2="848" x1="2416" />
            <wire x2="2416" y1="848" y2="1040" x1="2416" />
            <wire x2="2416" y1="1040" y2="1280" x1="2416" />
            <wire x2="2416" y1="1280" y2="1520" x1="2416" />
            <wire x2="2416" y1="1520" y2="1776" x1="2416" />
            <wire x2="2416" y1="1776" y2="1840" x1="2416" />
        </branch>
        <iomarker fontsize="28" x="2560" y="848" name="Y(7:0)" orien="R0" />
        <bustap x2="2320" y1="112" y2="112" x1="2416" />
        <branch name="Y(7)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2272" y="112" type="branch" />
            <wire x2="2272" y1="112" y2="112" x1="1920" />
            <wire x2="2320" y1="112" y2="112" x1="2272" />
        </branch>
        <bustap x2="2320" y1="336" y2="336" x1="2416" />
        <branch name="Y(6)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2264" y="336" type="branch" />
            <wire x2="2208" y1="352" y2="352" x1="1920" />
            <wire x2="2208" y1="336" y2="352" x1="2208" />
            <wire x2="2320" y1="336" y2="336" x1="2208" />
        </branch>
        <bustap x2="2320" y1="576" y2="576" x1="2416" />
        <branch name="Y(5)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2264" y="576" type="branch" />
            <wire x2="2208" y1="592" y2="592" x1="1920" />
            <wire x2="2208" y1="576" y2="592" x1="2208" />
            <wire x2="2320" y1="576" y2="576" x1="2208" />
        </branch>
        <bustap x2="2320" y1="800" y2="800" x1="2416" />
        <branch name="Y(4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2256" y="800" type="branch" />
            <wire x2="2192" y1="816" y2="816" x1="1920" />
            <wire x2="2256" y1="800" y2="800" x1="2192" />
            <wire x2="2320" y1="800" y2="800" x1="2256" />
            <wire x2="2192" y1="800" y2="816" x1="2192" />
        </branch>
        <bustap x2="2320" y1="1040" y2="1040" x1="2416" />
        <branch name="Y(3)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2248" y="1040" type="branch" />
            <wire x2="2320" y1="1040" y2="1040" x1="1920" />
        </branch>
        <bustap x2="2320" y1="1280" y2="1280" x1="2416" />
        <branch name="Y(2)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2248" y="1280" type="branch" />
            <wire x2="2320" y1="1280" y2="1280" x1="1920" />
        </branch>
        <bustap x2="2320" y1="1520" y2="1520" x1="2416" />
        <branch name="Y(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2240" y="1520" type="branch" />
            <wire x2="2240" y1="1520" y2="1520" x1="1920" />
            <wire x2="2320" y1="1520" y2="1520" x1="2240" />
        </branch>
        <bustap x2="2320" y1="1776" y2="1776" x1="2416" />
        <branch name="Y(0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2248" y="1776" type="branch" />
            <wire x2="2176" y1="1760" y2="1760" x1="1920" />
            <wire x2="2176" y1="1760" y2="1776" x1="2176" />
            <wire x2="2320" y1="1776" y2="1776" x1="2176" />
        </branch>
    </sheet>
</drawing>