<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="kintex7" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="S" />
        <signal name="R" />
        <signal name="Q" />
        <signal name="Qbar" />
        <port polarity="Input" name="S" />
        <port polarity="Input" name="R" />
        <port polarity="Output" name="Q" />
        <port polarity="Output" name="Qbar" />
        <blockdef name="nand2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="216" y1="-96" y2="-96" x1="256" />
            <circle r="12" cx="204" cy="-96" />
            <line x2="64" y1="-48" y2="-144" x1="64" />
            <line x2="144" y1="-144" y2="-144" x1="64" />
            <line x2="64" y1="-48" y2="-48" x1="144" />
            <arc ex="144" ey="-144" sx="144" sy="-48" r="48" cx="144" cy="-96" />
        </blockdef>
        <block symbolname="nand2" name="XLXI_3">
            <blockpin signalname="Qbar" name="I0" />
            <blockpin signalname="S" name="I1" />
            <blockpin signalname="Q" name="O" />
        </block>
        <block symbolname="nand2" name="XLXI_4">
            <blockpin signalname="R" name="I0" />
            <blockpin signalname="Q" name="I1" />
            <blockpin signalname="Qbar" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="S">
            <wire x2="464" y1="192" y2="192" x1="240" />
        </branch>
        <iomarker fontsize="28" x="240" y="192" name="S" orien="R180" />
        <branch name="R">
            <wire x2="464" y1="688" y2="688" x1="192" />
        </branch>
        <iomarker fontsize="28" x="192" y="688" name="R" orien="R180" />
        <branch name="Q">
            <wire x2="752" y1="432" y2="432" x1="352" />
            <wire x2="352" y1="432" y2="624" x1="352" />
            <wire x2="464" y1="624" y2="624" x1="352" />
            <wire x2="752" y1="224" y2="224" x1="720" />
            <wire x2="960" y1="224" y2="224" x1="752" />
            <wire x2="752" y1="224" y2="432" x1="752" />
        </branch>
        <iomarker fontsize="28" x="960" y="224" name="Q" orien="R0" />
        <branch name="Qbar">
            <wire x2="336" y1="256" y2="368" x1="336" />
            <wire x2="832" y1="368" y2="368" x1="336" />
            <wire x2="832" y1="368" y2="656" x1="832" />
            <wire x2="976" y1="656" y2="656" x1="832" />
            <wire x2="464" y1="256" y2="256" x1="336" />
            <wire x2="832" y1="656" y2="656" x1="720" />
        </branch>
        <iomarker fontsize="28" x="976" y="656" name="Qbar" orien="R0" />
        <instance x="464" y="320" name="XLXI_3" orien="R0" />
        <instance x="464" y="752" name="XLXI_4" orien="R0" />
    </sheet>
</drawing>