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
        <signal name="I0(3:0)" />
        <signal name="I1(3:0)" />
        <signal name="I2(3:0)" />
        <signal name="I3(3:0)" />
        <signal name="XLXN_27" />
        <signal name="XLXN_28" />
        <signal name="XLXN_29" />
        <signal name="XLXN_30" />
        <signal name="XLXN_7" />
        <signal name="XLXN_8" />
        <signal name="XLXN_9" />
        <signal name="XLXN_10" />
        <signal name="XLXN_11" />
        <signal name="XLXN_12" />
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
        <signal name="XLXN_64" />
        <signal name="I0(3)" />
        <signal name="I0(2)" />
        <signal name="I0(0)" />
        <signal name="XLXN_69" />
        <signal name="I1(3)" />
        <signal name="I1(2)" />
        <signal name="I1(1)" />
        <signal name="I1(0)" />
        <signal name="XLXN_74" />
        <signal name="I2(3)" />
        <signal name="I2(2)" />
        <signal name="I2(1)" />
        <signal name="I2(0)" />
        <signal name="XLXN_79" />
        <signal name="XLXN_80" />
        <signal name="XLXN_81" />
        <signal name="I3(3)" />
        <signal name="I3(2)" />
        <signal name="I3(0)" />
        <signal name="I3(1)" />
        <signal name="I0(1)" />
        <signal name="O(3:0)" />
        <signal name="O(3)" />
        <signal name="O(2)" />
        <signal name="O(1)" />
        <signal name="O(0)" />
        <port polarity="Input" name="s(1:0)" />
        <port polarity="Input" name="I0(3:0)" />
        <port polarity="Input" name="I1(3:0)" />
        <port polarity="Input" name="I2(3:0)" />
        <port polarity="Input" name="I3(3:0)" />
        <port polarity="Output" name="O(3:0)" />
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
            <blockpin signalname="XLXN_27" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_4">
            <blockpin signalname="s(0)" name="I0" />
            <blockpin signalname="XLXN_4" name="I1" />
            <blockpin signalname="XLXN_28" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_5">
            <blockpin signalname="s(1)" name="I0" />
            <blockpin signalname="XLXN_5" name="I1" />
            <blockpin signalname="XLXN_29" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_6">
            <blockpin signalname="s(1)" name="I0" />
            <blockpin signalname="s(0)" name="I1" />
            <blockpin signalname="XLXN_30" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_7">
            <blockpin signalname="I0(0)" name="I0" />
            <blockpin signalname="XLXN_27" name="I1" />
            <blockpin signalname="XLXN_7" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_8">
            <blockpin signalname="I1(0)" name="I0" />
            <blockpin signalname="XLXN_28" name="I1" />
            <blockpin signalname="XLXN_9" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_9">
            <blockpin signalname="I2(0)" name="I0" />
            <blockpin signalname="XLXN_29" name="I1" />
            <blockpin signalname="XLXN_10" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_10">
            <blockpin signalname="I3(0)" name="I0" />
            <blockpin signalname="XLXN_30" name="I1" />
            <blockpin signalname="XLXN_8" name="O" />
        </block>
        <block symbolname="or4" name="XLXI_11">
            <blockpin signalname="XLXN_8" name="I0" />
            <blockpin signalname="XLXN_10" name="I1" />
            <blockpin signalname="XLXN_9" name="I2" />
            <blockpin signalname="XLXN_7" name="I3" />
            <blockpin signalname="O(0)" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_12">
            <blockpin signalname="I0(1)" name="I0" />
            <blockpin signalname="XLXN_27" name="I1" />
            <blockpin signalname="XLXN_11" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_13">
            <blockpin signalname="I1(1)" name="I0" />
            <blockpin signalname="XLXN_28" name="I1" />
            <blockpin signalname="XLXN_13" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_14">
            <blockpin signalname="I2(1)" name="I0" />
            <blockpin signalname="XLXN_29" name="I1" />
            <blockpin signalname="XLXN_14" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_15">
            <blockpin signalname="I3(1)" name="I0" />
            <blockpin signalname="XLXN_30" name="I1" />
            <blockpin signalname="XLXN_12" name="O" />
        </block>
        <block symbolname="or4" name="XLXI_16">
            <blockpin signalname="XLXN_12" name="I0" />
            <blockpin signalname="XLXN_14" name="I1" />
            <blockpin signalname="XLXN_13" name="I2" />
            <blockpin signalname="XLXN_11" name="I3" />
            <blockpin signalname="O(1)" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_17">
            <blockpin signalname="I0(2)" name="I0" />
            <blockpin signalname="XLXN_27" name="I1" />
            <blockpin signalname="XLXN_15" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_18">
            <blockpin signalname="I1(2)" name="I0" />
            <blockpin signalname="XLXN_28" name="I1" />
            <blockpin signalname="XLXN_17" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_19">
            <blockpin signalname="I2(2)" name="I0" />
            <blockpin signalname="XLXN_29" name="I1" />
            <blockpin signalname="XLXN_18" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_20">
            <blockpin signalname="I3(2)" name="I0" />
            <blockpin signalname="XLXN_30" name="I1" />
            <blockpin signalname="XLXN_16" name="O" />
        </block>
        <block symbolname="or4" name="XLXI_21">
            <blockpin signalname="XLXN_16" name="I0" />
            <blockpin signalname="XLXN_18" name="I1" />
            <blockpin signalname="XLXN_17" name="I2" />
            <blockpin signalname="XLXN_15" name="I3" />
            <blockpin signalname="O(2)" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_22">
            <blockpin signalname="I0(3)" name="I0" />
            <blockpin signalname="XLXN_27" name="I1" />
            <blockpin signalname="XLXN_19" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_23">
            <blockpin signalname="I1(3)" name="I0" />
            <blockpin signalname="XLXN_28" name="I1" />
            <blockpin signalname="XLXN_21" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_24">
            <blockpin signalname="I2(3)" name="I0" />
            <blockpin signalname="XLXN_29" name="I1" />
            <blockpin signalname="XLXN_22" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_25">
            <blockpin signalname="I3(3)" name="I0" />
            <blockpin signalname="XLXN_30" name="I1" />
            <blockpin signalname="XLXN_20" name="O" />
        </block>
        <block symbolname="or4" name="XLXI_26">
            <blockpin signalname="XLXN_20" name="I0" />
            <blockpin signalname="XLXN_22" name="I1" />
            <blockpin signalname="XLXN_21" name="I2" />
            <blockpin signalname="XLXN_19" name="I3" />
            <blockpin signalname="O(3)" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="7040" height="5440">
        <branch name="s(1:0)">
            <wire x2="272" y1="288" y2="288" x1="112" />
            <wire x2="272" y1="288" y2="384" x1="272" />
            <wire x2="272" y1="384" y2="464" x1="272" />
            <wire x2="272" y1="128" y2="192" x1="272" />
            <wire x2="272" y1="192" y2="288" x1="272" />
        </branch>
        <iomarker fontsize="28" x="112" y="288" name="s(1:0)" orien="R180" />
        <bustap x2="368" y1="192" y2="192" x1="272" />
        <branch name="s(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="392" y="192" type="branch" />
            <wire x2="392" y1="192" y2="192" x1="368" />
            <wire x2="432" y1="192" y2="192" x1="392" />
            <wire x2="608" y1="192" y2="192" x1="432" />
            <wire x2="432" y1="192" y2="672" x1="432" />
            <wire x2="432" y1="672" y2="864" x1="432" />
            <wire x2="1024" y1="864" y2="864" x1="432" />
            <wire x2="1024" y1="672" y2="672" x1="432" />
        </branch>
        <bustap x2="368" y1="384" y2="384" x1="272" />
        <branch name="s(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="384" y="384" type="branch" />
            <wire x2="384" y1="384" y2="384" x1="368" />
            <wire x2="496" y1="384" y2="384" x1="384" />
            <wire x2="608" y1="384" y2="384" x1="496" />
            <wire x2="496" y1="384" y2="480" x1="496" />
            <wire x2="1024" y1="480" y2="480" x1="496" />
            <wire x2="496" y1="480" y2="800" x1="496" />
            <wire x2="1024" y1="800" y2="800" x1="496" />
        </branch>
        <instance x="608" y="224" name="XLXI_1" orien="R0" />
        <instance x="608" y="416" name="XLXI_2" orien="R0" />
        <instance x="1024" y="336" name="XLXI_3" orien="R0" />
        <instance x="1024" y="544" name="XLXI_4" orien="R0" />
        <instance x="1024" y="736" name="XLXI_5" orien="R0" />
        <instance x="1024" y="928" name="XLXI_6" orien="R0" />
        <branch name="XLXN_4">
            <wire x2="944" y1="192" y2="192" x1="832" />
            <wire x2="944" y1="192" y2="208" x1="944" />
            <wire x2="944" y1="208" y2="416" x1="944" />
            <wire x2="1024" y1="416" y2="416" x1="944" />
            <wire x2="1024" y1="208" y2="208" x1="944" />
        </branch>
        <branch name="XLXN_5">
            <wire x2="896" y1="384" y2="384" x1="832" />
            <wire x2="896" y1="384" y2="608" x1="896" />
            <wire x2="1024" y1="608" y2="608" x1="896" />
            <wire x2="896" y1="272" y2="384" x1="896" />
            <wire x2="1024" y1="272" y2="272" x1="896" />
        </branch>
        <iomarker fontsize="28" x="384" y="2768" name="I0(3:0)" orien="R180" />
        <iomarker fontsize="28" x="384" y="2944" name="I1(3:0)" orien="R180" />
        <iomarker fontsize="28" x="384" y="3104" name="I2(3:0)" orien="R180" />
        <iomarker fontsize="28" x="384" y="3248" name="I3(3:0)" orien="R180" />
        <instance x="2320" y="384" name="XLXI_7" orien="R0" />
        <instance x="2320" y="624" name="XLXI_8" orien="R0" />
        <instance x="2320" y="864" name="XLXI_9" orien="R0" />
        <instance x="2320" y="1088" name="XLXI_10" orien="R0" />
        <instance x="3024" y="800" name="XLXI_11" orien="R0" />
        <branch name="XLXN_7">
            <wire x2="3024" y1="288" y2="288" x1="2576" />
            <wire x2="3024" y1="288" y2="544" x1="3024" />
        </branch>
        <branch name="XLXN_8">
            <wire x2="3024" y1="992" y2="992" x1="2576" />
            <wire x2="3024" y1="736" y2="992" x1="3024" />
        </branch>
        <branch name="XLXN_9">
            <wire x2="2864" y1="528" y2="528" x1="2576" />
            <wire x2="2864" y1="528" y2="608" x1="2864" />
            <wire x2="3024" y1="608" y2="608" x1="2864" />
        </branch>
        <branch name="XLXN_10">
            <wire x2="2864" y1="768" y2="768" x1="2576" />
            <wire x2="2864" y1="672" y2="768" x1="2864" />
            <wire x2="3024" y1="672" y2="672" x1="2864" />
        </branch>
        <instance x="2320" y="1568" name="XLXI_12" orien="R0" />
        <instance x="2320" y="1808" name="XLXI_13" orien="R0" />
        <instance x="2320" y="2048" name="XLXI_14" orien="R0" />
        <instance x="2320" y="2272" name="XLXI_15" orien="R0" />
        <instance x="3024" y="1984" name="XLXI_16" orien="R0" />
        <branch name="XLXN_11">
            <wire x2="3024" y1="1472" y2="1472" x1="2576" />
            <wire x2="3024" y1="1472" y2="1728" x1="3024" />
        </branch>
        <branch name="XLXN_12">
            <wire x2="3024" y1="2176" y2="2176" x1="2576" />
            <wire x2="3024" y1="1920" y2="2176" x1="3024" />
        </branch>
        <branch name="XLXN_13">
            <wire x2="2864" y1="1712" y2="1712" x1="2576" />
            <wire x2="2864" y1="1712" y2="1792" x1="2864" />
            <wire x2="3024" y1="1792" y2="1792" x1="2864" />
        </branch>
        <branch name="XLXN_14">
            <wire x2="2864" y1="1952" y2="1952" x1="2576" />
            <wire x2="2864" y1="1856" y2="1952" x1="2864" />
            <wire x2="3024" y1="1856" y2="1856" x1="2864" />
        </branch>
        <instance x="2320" y="2864" name="XLXI_17" orien="R0" />
        <instance x="2320" y="3104" name="XLXI_18" orien="R0" />
        <instance x="2320" y="3344" name="XLXI_19" orien="R0" />
        <instance x="2320" y="3568" name="XLXI_20" orien="R0" />
        <instance x="3024" y="3280" name="XLXI_21" orien="R0" />
        <branch name="XLXN_15">
            <wire x2="3024" y1="2768" y2="2768" x1="2576" />
            <wire x2="3024" y1="2768" y2="3024" x1="3024" />
        </branch>
        <branch name="XLXN_16">
            <wire x2="3024" y1="3472" y2="3472" x1="2576" />
            <wire x2="3024" y1="3216" y2="3472" x1="3024" />
        </branch>
        <branch name="XLXN_17">
            <wire x2="2864" y1="3008" y2="3008" x1="2576" />
            <wire x2="2864" y1="3008" y2="3088" x1="2864" />
            <wire x2="3024" y1="3088" y2="3088" x1="2864" />
        </branch>
        <branch name="XLXN_18">
            <wire x2="2864" y1="3248" y2="3248" x1="2576" />
            <wire x2="2864" y1="3152" y2="3248" x1="2864" />
            <wire x2="3024" y1="3152" y2="3152" x1="2864" />
        </branch>
        <instance x="2320" y="4144" name="XLXI_22" orien="R0" />
        <instance x="2320" y="4384" name="XLXI_23" orien="R0" />
        <instance x="2320" y="4624" name="XLXI_24" orien="R0" />
        <instance x="2320" y="4848" name="XLXI_25" orien="R0" />
        <instance x="3024" y="4560" name="XLXI_26" orien="R0" />
        <branch name="XLXN_19">
            <wire x2="3024" y1="4048" y2="4048" x1="2576" />
            <wire x2="3024" y1="4048" y2="4304" x1="3024" />
        </branch>
        <branch name="XLXN_20">
            <wire x2="3024" y1="4752" y2="4752" x1="2576" />
            <wire x2="3024" y1="4496" y2="4752" x1="3024" />
        </branch>
        <branch name="XLXN_21">
            <wire x2="2864" y1="4288" y2="4288" x1="2576" />
            <wire x2="2864" y1="4288" y2="4368" x1="2864" />
            <wire x2="3024" y1="4368" y2="4368" x1="2864" />
        </branch>
        <branch name="XLXN_22">
            <wire x2="2864" y1="4528" y2="4528" x1="2576" />
            <wire x2="2864" y1="4432" y2="4528" x1="2864" />
            <wire x2="3024" y1="4432" y2="4432" x1="2864" />
        </branch>
        <bustap x2="1920" y1="4080" y2="4080" x1="1824" />
        <branch name="I0(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1960" y="4080" type="branch" />
            <wire x2="1960" y1="4080" y2="4080" x1="1920" />
            <wire x2="2320" y1="4080" y2="4080" x1="1960" />
        </branch>
        <bustap x2="1920" y1="2800" y2="2800" x1="1824" />
        <branch name="I0(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1952" y="2800" type="branch" />
            <wire x2="1952" y1="2800" y2="2800" x1="1920" />
            <wire x2="2320" y1="2800" y2="2800" x1="1952" />
        </branch>
        <bustap x2="1920" y1="320" y2="320" x1="1824" />
        <branch name="I0(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1976" y="320" type="branch" />
            <wire x2="1976" y1="320" y2="320" x1="1920" />
            <wire x2="2320" y1="320" y2="320" x1="1976" />
        </branch>
        <bustap x2="2032" y1="4320" y2="4320" x1="1936" />
        <branch name="I1(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2072" y="4320" type="branch" />
            <wire x2="2072" y1="4320" y2="4320" x1="2032" />
            <wire x2="2320" y1="4320" y2="4320" x1="2072" />
        </branch>
        <bustap x2="2032" y1="3040" y2="3040" x1="1936" />
        <branch name="I1(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2064" y="3040" type="branch" />
            <wire x2="2064" y1="3040" y2="3040" x1="2032" />
            <wire x2="2320" y1="3040" y2="3040" x1="2064" />
        </branch>
        <bustap x2="2032" y1="1744" y2="1744" x1="1936" />
        <branch name="I1(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2072" y="1744" type="branch" />
            <wire x2="2072" y1="1744" y2="1744" x1="2032" />
            <wire x2="2320" y1="1744" y2="1744" x1="2072" />
        </branch>
        <bustap x2="2032" y1="560" y2="560" x1="1936" />
        <branch name="I1(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2072" y="560" type="branch" />
            <wire x2="2072" y1="560" y2="560" x1="2032" />
            <wire x2="2320" y1="560" y2="560" x1="2072" />
        </branch>
        <bustap x2="2144" y1="4560" y2="4560" x1="2048" />
        <branch name="I2(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2160" y="4560" type="branch" />
            <wire x2="2160" y1="4560" y2="4560" x1="2144" />
            <wire x2="2320" y1="4560" y2="4560" x1="2160" />
        </branch>
        <bustap x2="2144" y1="3280" y2="3280" x1="2048" />
        <branch name="I2(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2160" y="3280" type="branch" />
            <wire x2="2160" y1="3280" y2="3280" x1="2144" />
            <wire x2="2320" y1="3280" y2="3280" x1="2160" />
        </branch>
        <bustap x2="2144" y1="1984" y2="1984" x1="2048" />
        <branch name="I2(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2168" y="1984" type="branch" />
            <wire x2="2168" y1="1984" y2="1984" x1="2144" />
            <wire x2="2320" y1="1984" y2="1984" x1="2168" />
        </branch>
        <bustap x2="2144" y1="800" y2="800" x1="2048" />
        <branch name="I2(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2160" y="800" type="branch" />
            <wire x2="2160" y1="800" y2="800" x1="2144" />
            <wire x2="2320" y1="800" y2="800" x1="2160" />
        </branch>
        <bustap x2="2272" y1="4784" y2="4784" x1="2176" />
        <branch name="I3(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2288" y="4784" type="branch" />
            <wire x2="2288" y1="4784" y2="4784" x1="2272" />
            <wire x2="2320" y1="4784" y2="4784" x1="2288" />
        </branch>
        <bustap x2="2272" y1="3504" y2="3504" x1="2176" />
        <branch name="I3(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2288" y="3504" type="branch" />
            <wire x2="2288" y1="3504" y2="3504" x1="2272" />
            <wire x2="2320" y1="3504" y2="3504" x1="2288" />
        </branch>
        <bustap x2="2272" y1="1024" y2="1024" x1="2176" />
        <branch name="I3(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2288" y="1024" type="branch" />
            <wire x2="2288" y1="1024" y2="1024" x1="2272" />
            <wire x2="2320" y1="1024" y2="1024" x1="2288" />
        </branch>
        <bustap x2="2272" y1="2208" y2="2208" x1="2176" />
        <branch name="I3(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2296" y="2208" type="branch" />
            <wire x2="2296" y1="2208" y2="2208" x1="2272" />
            <wire x2="2320" y1="2208" y2="2208" x1="2296" />
        </branch>
        <bustap x2="1920" y1="1504" y2="1504" x1="1824" />
        <branch name="I0(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2120" y="1504" type="branch" />
            <wire x2="2120" y1="1504" y2="1504" x1="1920" />
            <wire x2="2320" y1="1504" y2="1504" x1="2120" />
        </branch>
        <branch name="XLXN_30">
            <wire x2="1376" y1="832" y2="832" x1="1280" />
            <wire x2="1376" y1="832" y2="960" x1="1376" />
            <wire x2="2320" y1="960" y2="960" x1="1376" />
            <wire x2="1376" y1="960" y2="2144" x1="1376" />
            <wire x2="2320" y1="2144" y2="2144" x1="1376" />
            <wire x2="1376" y1="2144" y2="3440" x1="1376" />
            <wire x2="2320" y1="3440" y2="3440" x1="1376" />
            <wire x2="1376" y1="3440" y2="4720" x1="1376" />
            <wire x2="2320" y1="4720" y2="4720" x1="1376" />
        </branch>
        <branch name="XLXN_29">
            <wire x2="1472" y1="640" y2="640" x1="1280" />
            <wire x2="1472" y1="640" y2="736" x1="1472" />
            <wire x2="2320" y1="736" y2="736" x1="1472" />
            <wire x2="1472" y1="736" y2="1920" x1="1472" />
            <wire x2="2320" y1="1920" y2="1920" x1="1472" />
            <wire x2="1472" y1="1920" y2="3216" x1="1472" />
            <wire x2="2320" y1="3216" y2="3216" x1="1472" />
            <wire x2="1472" y1="3216" y2="4496" x1="1472" />
            <wire x2="2320" y1="4496" y2="4496" x1="1472" />
        </branch>
        <branch name="XLXN_28">
            <wire x2="1552" y1="448" y2="448" x1="1280" />
            <wire x2="1552" y1="448" y2="496" x1="1552" />
            <wire x2="2320" y1="496" y2="496" x1="1552" />
            <wire x2="1552" y1="496" y2="1680" x1="1552" />
            <wire x2="2320" y1="1680" y2="1680" x1="1552" />
            <wire x2="1552" y1="1680" y2="2976" x1="1552" />
            <wire x2="2320" y1="2976" y2="2976" x1="1552" />
            <wire x2="1552" y1="2976" y2="4256" x1="1552" />
            <wire x2="2320" y1="4256" y2="4256" x1="1552" />
        </branch>
        <branch name="XLXN_27">
            <wire x2="1632" y1="240" y2="240" x1="1280" />
            <wire x2="1632" y1="240" y2="256" x1="1632" />
            <wire x2="2320" y1="256" y2="256" x1="1632" />
            <wire x2="1632" y1="256" y2="1440" x1="1632" />
            <wire x2="2320" y1="1440" y2="1440" x1="1632" />
            <wire x2="1632" y1="1440" y2="2736" x1="1632" />
            <wire x2="2320" y1="2736" y2="2736" x1="1632" />
            <wire x2="1632" y1="2736" y2="4016" x1="1632" />
            <wire x2="2320" y1="4016" y2="4016" x1="1632" />
        </branch>
        <branch name="I3(3:0)">
            <wire x2="2176" y1="3248" y2="3248" x1="384" />
            <wire x2="2176" y1="3248" y2="3504" x1="2176" />
            <wire x2="2176" y1="3504" y2="4784" x1="2176" />
            <wire x2="2176" y1="1024" y2="2208" x1="2176" />
            <wire x2="2176" y1="2208" y2="3248" x1="2176" />
        </branch>
        <branch name="I2(3:0)">
            <wire x2="2048" y1="3104" y2="3104" x1="384" />
            <wire x2="2048" y1="3104" y2="3280" x1="2048" />
            <wire x2="2048" y1="3280" y2="4560" x1="2048" />
            <wire x2="2048" y1="624" y2="800" x1="2048" />
            <wire x2="2048" y1="800" y2="1984" x1="2048" />
            <wire x2="2048" y1="1984" y2="3104" x1="2048" />
        </branch>
        <branch name="I1(3:0)">
            <wire x2="1936" y1="2944" y2="2944" x1="384" />
            <wire x2="1936" y1="2944" y2="3040" x1="1936" />
            <wire x2="1936" y1="3040" y2="4320" x1="1936" />
            <wire x2="1936" y1="480" y2="560" x1="1936" />
            <wire x2="1936" y1="560" y2="1744" x1="1936" />
            <wire x2="1936" y1="1744" y2="2944" x1="1936" />
        </branch>
        <branch name="I0(3:0)">
            <wire x2="1824" y1="2768" y2="2768" x1="384" />
            <wire x2="1824" y1="2768" y2="2800" x1="1824" />
            <wire x2="1824" y1="2800" y2="4080" x1="1824" />
            <wire x2="1824" y1="320" y2="1504" x1="1824" />
            <wire x2="1824" y1="1504" y2="2768" x1="1824" />
        </branch>
        <iomarker fontsize="28" x="5584" y="2448" name="O(3:0)" orien="R0" />
        <bustap x2="4512" y1="4400" y2="4400" x1="4608" />
        <branch name="O(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3896" y="4400" type="branch" />
            <wire x2="3896" y1="4400" y2="4400" x1="3280" />
            <wire x2="4512" y1="4400" y2="4400" x1="3896" />
        </branch>
        <bustap x2="4512" y1="3120" y2="3120" x1="4608" />
        <branch name="O(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3896" y="3120" type="branch" />
            <wire x2="3896" y1="3120" y2="3120" x1="3280" />
            <wire x2="4512" y1="3120" y2="3120" x1="3896" />
        </branch>
        <bustap x2="4512" y1="1824" y2="1824" x1="4608" />
        <branch name="O(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3896" y="1824" type="branch" />
            <wire x2="3896" y1="1824" y2="1824" x1="3280" />
            <wire x2="4512" y1="1824" y2="1824" x1="3896" />
        </branch>
        <bustap x2="4512" y1="640" y2="640" x1="4608" />
        <branch name="O(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3896" y="640" type="branch" />
            <wire x2="3896" y1="640" y2="640" x1="3280" />
            <wire x2="4512" y1="640" y2="640" x1="3896" />
        </branch>
        <branch name="O(3:0)">
            <wire x2="4608" y1="640" y2="1824" x1="4608" />
            <wire x2="4608" y1="1824" y2="2448" x1="4608" />
            <wire x2="5584" y1="2448" y2="2448" x1="4608" />
            <wire x2="4608" y1="2448" y2="3120" x1="4608" />
            <wire x2="4608" y1="3120" y2="4400" x1="4608" />
        </branch>
    </sheet>
</drawing>