<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="kintex7" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="Sbar" />
        <signal name="XLXN_2" />
        <signal name="XLXN_3" />
        <signal name="XLXN_4" />
        <signal name="XLXN_7" />
        <signal name="Rbar" />
        <signal name="Cp" />
        <signal name="D" />
        <signal name="Q" />
        <signal name="Qbar" />
        <port polarity="Input" name="Sbar" />
        <port polarity="Input" name="Rbar" />
        <port polarity="Input" name="Cp" />
        <port polarity="Input" name="D" />
        <port polarity="Output" name="Q" />
        <port polarity="Output" name="Qbar" />
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
        <block symbolname="nand3" name="XLXI_1">
            <blockpin signalname="XLXN_2" name="I0" />
            <blockpin signalname="XLXN_7" name="I1" />
            <blockpin signalname="Sbar" name="I2" />
            <blockpin signalname="XLXN_4" name="O" />
        </block>
        <block symbolname="nand3" name="XLXI_2">
            <blockpin signalname="Cp" name="I0" />
            <blockpin signalname="Rbar" name="I1" />
            <blockpin signalname="XLXN_4" name="I2" />
            <blockpin signalname="XLXN_2" name="O" />
        </block>
        <block symbolname="nand3" name="XLXI_3">
            <blockpin signalname="XLXN_7" name="I0" />
            <blockpin signalname="Cp" name="I1" />
            <blockpin signalname="XLXN_2" name="I2" />
            <blockpin signalname="XLXN_3" name="O" />
        </block>
        <block symbolname="nand3" name="XLXI_4">
            <blockpin signalname="Rbar" name="I0" />
            <blockpin signalname="D" name="I1" />
            <blockpin signalname="XLXN_3" name="I2" />
            <blockpin signalname="XLXN_7" name="O" />
        </block>
        <block symbolname="nand3" name="XLXI_5">
            <blockpin signalname="Qbar" name="I0" />
            <blockpin signalname="XLXN_2" name="I1" />
            <blockpin signalname="Sbar" name="I2" />
            <blockpin signalname="Q" name="O" />
        </block>
        <block symbolname="nand3" name="XLXI_6">
            <blockpin signalname="Rbar" name="I0" />
            <blockpin signalname="XLXN_3" name="I1" />
            <blockpin signalname="Q" name="I2" />
            <blockpin signalname="Qbar" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="368" y="368" name="XLXI_1" orien="R0" />
        <instance x="368" y="1056" name="XLXI_3" orien="R0" />
        <instance x="368" y="1472" name="XLXI_4" orien="R0" />
        <instance x="976" y="720" name="XLXI_5" orien="R0" />
        <instance x="976" y="1056" name="XLXI_6" orien="R0" />
        <branch name="Sbar">
            <wire x2="208" y1="64" y2="176" x1="208" />
            <wire x2="368" y1="176" y2="176" x1="208" />
            <wire x2="880" y1="64" y2="64" x1="208" />
            <wire x2="1088" y1="64" y2="64" x1="880" />
            <wire x2="880" y1="64" y2="528" x1="880" />
            <wire x2="976" y1="528" y2="528" x1="880" />
        </branch>
        <iomarker fontsize="28" x="1088" y="64" name="Sbar" orien="R0" />
        <branch name="XLXN_2">
            <wire x2="368" y1="304" y2="304" x1="304" />
            <wire x2="304" y1="304" y2="400" x1="304" />
            <wire x2="640" y1="400" y2="400" x1="304" />
            <wire x2="640" y1="400" y2="592" x1="640" />
            <wire x2="976" y1="592" y2="592" x1="640" />
            <wire x2="640" y1="592" y2="768" x1="640" />
            <wire x2="640" y1="768" y2="768" x1="304" />
            <wire x2="304" y1="768" y2="864" x1="304" />
            <wire x2="368" y1="864" y2="864" x1="304" />
            <wire x2="640" y1="592" y2="592" x1="624" />
        </branch>
        <branch name="XLXN_3">
            <wire x2="640" y1="1168" y2="1168" x1="320" />
            <wire x2="320" y1="1168" y2="1280" x1="320" />
            <wire x2="368" y1="1280" y2="1280" x1="320" />
            <wire x2="640" y1="928" y2="928" x1="624" />
            <wire x2="976" y1="928" y2="928" x1="640" />
            <wire x2="640" y1="928" y2="1168" x1="640" />
        </branch>
        <branch name="XLXN_4">
            <wire x2="672" y1="464" y2="464" x1="304" />
            <wire x2="304" y1="464" y2="528" x1="304" />
            <wire x2="368" y1="528" y2="528" x1="304" />
            <wire x2="672" y1="240" y2="240" x1="624" />
            <wire x2="672" y1="240" y2="464" x1="672" />
        </branch>
        <instance x="368" y="720" name="XLXI_2" orien="R0" />
        <branch name="Rbar">
            <wire x2="368" y1="592" y2="592" x1="256" />
            <wire x2="256" y1="592" y2="1408" x1="256" />
            <wire x2="256" y1="1408" y2="1600" x1="256" />
            <wire x2="848" y1="1600" y2="1600" x1="256" />
            <wire x2="880" y1="1600" y2="1600" x1="848" />
            <wire x2="368" y1="1408" y2="1408" x1="256" />
            <wire x2="976" y1="992" y2="992" x1="848" />
            <wire x2="848" y1="992" y2="1600" x1="848" />
        </branch>
        <iomarker fontsize="28" x="880" y="1600" name="Rbar" orien="R0" />
        <branch name="Cp">
            <wire x2="144" y1="784" y2="784" x1="80" />
            <wire x2="144" y1="784" y2="928" x1="144" />
            <wire x2="368" y1="928" y2="928" x1="144" />
            <wire x2="368" y1="656" y2="656" x1="144" />
            <wire x2="144" y1="656" y2="784" x1="144" />
        </branch>
        <iomarker fontsize="28" x="80" y="784" name="Cp" orien="R180" />
        <branch name="D">
            <wire x2="368" y1="1344" y2="1344" x1="128" />
        </branch>
        <iomarker fontsize="28" x="128" y="1344" name="D" orien="R180" />
        <branch name="XLXN_7">
            <wire x2="368" y1="240" y2="240" x1="208" />
            <wire x2="208" y1="240" y2="1536" x1="208" />
            <wire x2="688" y1="1536" y2="1536" x1="208" />
            <wire x2="368" y1="992" y2="992" x1="304" />
            <wire x2="304" y1="992" y2="1088" x1="304" />
            <wire x2="688" y1="1088" y2="1088" x1="304" />
            <wire x2="688" y1="1088" y2="1344" x1="688" />
            <wire x2="688" y1="1344" y2="1536" x1="688" />
            <wire x2="688" y1="1344" y2="1344" x1="624" />
        </branch>
        <branch name="Q">
            <wire x2="1264" y1="704" y2="704" x1="944" />
            <wire x2="944" y1="704" y2="864" x1="944" />
            <wire x2="976" y1="864" y2="864" x1="944" />
            <wire x2="1264" y1="592" y2="592" x1="1232" />
            <wire x2="1392" y1="592" y2="592" x1="1264" />
            <wire x2="1264" y1="592" y2="704" x1="1264" />
        </branch>
        <branch name="Qbar">
            <wire x2="976" y1="656" y2="656" x1="896" />
            <wire x2="896" y1="656" y2="768" x1="896" />
            <wire x2="1280" y1="768" y2="768" x1="896" />
            <wire x2="1280" y1="768" y2="928" x1="1280" />
            <wire x2="1376" y1="928" y2="928" x1="1280" />
            <wire x2="1280" y1="928" y2="928" x1="1232" />
        </branch>
        <iomarker fontsize="28" x="1392" y="592" name="Q" orien="R0" />
        <iomarker fontsize="28" x="1376" y="928" name="Qbar" orien="R0" />
    </sheet>
</drawing>