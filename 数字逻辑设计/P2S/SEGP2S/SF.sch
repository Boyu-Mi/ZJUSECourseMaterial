<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="kintex7" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="start" />
        <signal name="finish" />
        <signal name="XLXN_4" />
        <signal name="S_L" />
        <signal name="XLXN_6" />
        <signal name="XLXN_7" />
        <port polarity="Input" name="start" />
        <port polarity="Input" name="finish" />
        <port polarity="Output" name="S_L" />
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
        <blockdef name="inv">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
        </blockdef>
        <blockdef name="nor2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="216" y1="-96" y2="-96" x1="256" />
            <circle r="12" cx="204" cy="-96" />
            <arc ex="192" ey="-96" sx="112" sy="-48" r="88" cx="116" cy="-136" />
            <arc ex="112" ey="-144" sx="192" sy="-96" r="88" cx="116" cy="-56" />
            <arc ex="48" ey="-144" sx="48" sy="-48" r="56" cx="16" cy="-96" />
            <line x2="48" y1="-48" y2="-48" x1="112" />
            <line x2="48" y1="-144" y2="-144" x1="112" />
        </blockdef>
        <block symbolname="and2" name="XLXI_1">
            <blockpin signalname="finish" name="I0" />
            <blockpin signalname="start" name="I1" />
            <blockpin signalname="XLXN_4" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_2">
            <blockpin signalname="finish" name="I" />
            <blockpin signalname="XLXN_6" name="O" />
        </block>
        <block symbolname="nor2" name="XLXI_3">
            <blockpin signalname="S_L" name="I0" />
            <blockpin signalname="XLXN_4" name="I1" />
            <blockpin signalname="XLXN_7" name="O" />
        </block>
        <block symbolname="nor2" name="XLXI_4">
            <blockpin signalname="XLXN_6" name="I0" />
            <blockpin signalname="XLXN_7" name="I1" />
            <blockpin signalname="S_L" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="464" y="384" name="XLXI_1" orien="R0" />
        <instance x="464" y="560" name="XLXI_2" orien="R0" />
        <branch name="start">
            <wire x2="464" y1="256" y2="256" x1="192" />
        </branch>
        <iomarker fontsize="28" x="192" y="256" name="start" orien="R180" />
        <branch name="finish">
            <wire x2="336" y1="528" y2="528" x1="176" />
            <wire x2="464" y1="528" y2="528" x1="336" />
            <wire x2="336" y1="320" y2="528" x1="336" />
            <wire x2="464" y1="320" y2="320" x1="336" />
        </branch>
        <iomarker fontsize="28" x="176" y="528" name="finish" orien="R180" />
        <instance x="944" y="368" name="XLXI_3" orien="R0" />
        <instance x="944" y="624" name="XLXI_4" orien="R0" />
        <branch name="XLXN_4">
            <wire x2="832" y1="288" y2="288" x1="720" />
            <wire x2="832" y1="240" y2="288" x1="832" />
            <wire x2="944" y1="240" y2="240" x1="832" />
        </branch>
        <branch name="S_L">
            <wire x2="944" y1="304" y2="304" x1="896" />
            <wire x2="896" y1="304" y2="368" x1="896" />
            <wire x2="1232" y1="368" y2="368" x1="896" />
            <wire x2="1232" y1="368" y2="528" x1="1232" />
            <wire x2="1600" y1="528" y2="528" x1="1232" />
            <wire x2="1232" y1="528" y2="528" x1="1200" />
        </branch>
        <branch name="XLXN_6">
            <wire x2="816" y1="528" y2="528" x1="688" />
            <wire x2="816" y1="528" y2="560" x1="816" />
            <wire x2="944" y1="560" y2="560" x1="816" />
        </branch>
        <branch name="XLXN_7">
            <wire x2="880" y1="416" y2="496" x1="880" />
            <wire x2="944" y1="496" y2="496" x1="880" />
            <wire x2="1280" y1="416" y2="416" x1="880" />
            <wire x2="1280" y1="272" y2="272" x1="1200" />
            <wire x2="1280" y1="272" y2="416" x1="1280" />
        </branch>
        <iomarker fontsize="28" x="1600" y="528" name="S_L" orien="R0" />
    </sheet>
</drawing>