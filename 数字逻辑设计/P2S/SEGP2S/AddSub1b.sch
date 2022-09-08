<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="kintex7" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="A" />
        <signal name="XLXN_3" />
        <signal name="XLXN_4" />
        <signal name="B" />
        <signal name="Ctrl" />
        <signal name="Ci" />
        <signal name="Co" />
        <signal name="S" />
        <port polarity="Input" name="A" />
        <port polarity="Input" name="B" />
        <port polarity="Input" name="Ctrl" />
        <port polarity="Input" name="Ci" />
        <port polarity="Output" name="Co" />
        <port polarity="Output" name="S" />
        <blockdef name="Adder1b">
            <timestamp>2020-11-8T12:8:26</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="xor2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="60" y1="-128" y2="-128" x1="0" />
            <line x2="208" y1="-96" y2="-96" x1="256" />
            <arc ex="44" ey="-144" sx="48" sy="-48" r="56" cx="16" cy="-96" />
            <arc ex="64" ey="-144" sx="64" sy="-48" r="56" cx="32" cy="-96" />
            <line x2="64" y1="-144" y2="-144" x1="128" />
            <line x2="64" y1="-48" y2="-48" x1="128" />
            <arc ex="128" ey="-144" sx="208" sy="-96" r="88" cx="132" cy="-56" />
            <arc ex="208" ey="-96" sx="128" sy="-48" r="88" cx="132" cy="-136" />
        </blockdef>
        <block symbolname="Adder1b" name="XLXI_1">
            <blockpin signalname="A" name="A" />
            <blockpin signalname="XLXN_4" name="B" />
            <blockpin signalname="Ci" name="C" />
            <blockpin signalname="Co" name="Co" />
            <blockpin signalname="S" name="S" />
        </block>
        <block symbolname="xor2" name="XLXI_2">
            <blockpin signalname="Ctrl" name="I0" />
            <blockpin signalname="B" name="I1" />
            <blockpin signalname="XLXN_4" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="576" y="512" name="XLXI_1" orien="R0">
        </instance>
        <branch name="A">
            <wire x2="576" y1="352" y2="352" x1="256" />
        </branch>
        <iomarker fontsize="28" x="256" y="352" name="A" orien="R180" />
        <instance x="208" y="624" name="XLXI_2" orien="R0" />
        <branch name="XLXN_4">
            <wire x2="480" y1="528" y2="528" x1="464" />
            <wire x2="480" y1="416" y2="528" x1="480" />
            <wire x2="576" y1="416" y2="416" x1="480" />
        </branch>
        <branch name="B">
            <wire x2="208" y1="496" y2="496" x1="128" />
        </branch>
        <iomarker fontsize="28" x="128" y="496" name="B" orien="R180" />
        <branch name="Ctrl">
            <wire x2="208" y1="560" y2="560" x1="96" />
        </branch>
        <iomarker fontsize="28" x="96" y="560" name="Ctrl" orien="R180" />
        <branch name="Ci">
            <wire x2="560" y1="704" y2="704" x1="224" />
            <wire x2="576" y1="480" y2="480" x1="560" />
            <wire x2="560" y1="480" y2="704" x1="560" />
        </branch>
        <iomarker fontsize="28" x="224" y="704" name="Ci" orien="R180" />
        <branch name="Co">
            <wire x2="1200" y1="352" y2="352" x1="960" />
        </branch>
        <branch name="S">
            <wire x2="1200" y1="480" y2="480" x1="960" />
        </branch>
        <iomarker fontsize="28" x="1200" y="480" name="S" orien="R0" />
        <iomarker fontsize="28" x="1200" y="352" name="Co" orien="R0" />
    </sheet>
</drawing>