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
        <signal name="XLXN_3" />
        <signal name="C" />
        <signal name="XLXN_5" />
        <signal name="XLXN_6" />
        <signal name="XLXN_7" />
        <signal name="Co" />
        <signal name="S" />
        <port polarity="Input" name="A" />
        <port polarity="Input" name="B" />
        <port polarity="Input" name="C" />
        <port polarity="Output" name="Co" />
        <port polarity="Output" name="S" />
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
        <blockdef name="or3">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="48" y1="-64" y2="-64" x1="0" />
            <line x2="72" y1="-128" y2="-128" x1="0" />
            <line x2="48" y1="-192" y2="-192" x1="0" />
            <line x2="192" y1="-128" y2="-128" x1="256" />
            <arc ex="192" ey="-128" sx="112" sy="-80" r="88" cx="116" cy="-168" />
            <arc ex="48" ey="-176" sx="48" sy="-80" r="56" cx="16" cy="-128" />
            <line x2="48" y1="-64" y2="-80" x1="48" />
            <line x2="48" y1="-192" y2="-176" x1="48" />
            <line x2="48" y1="-80" y2="-80" x1="112" />
            <arc ex="112" ey="-176" sx="192" sy="-128" r="88" cx="116" cy="-88" />
            <line x2="48" y1="-176" y2="-176" x1="112" />
        </blockdef>
        <block symbolname="xor2" name="XLXI_1">
            <blockpin signalname="B" name="I0" />
            <blockpin signalname="A" name="I1" />
            <blockpin signalname="XLXN_3" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_2">
            <blockpin signalname="C" name="I0" />
            <blockpin signalname="XLXN_3" name="I1" />
            <blockpin signalname="S" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_3">
            <blockpin signalname="B" name="I0" />
            <blockpin signalname="A" name="I1" />
            <blockpin signalname="XLXN_5" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_4">
            <blockpin signalname="C" name="I0" />
            <blockpin signalname="B" name="I1" />
            <blockpin signalname="XLXN_6" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_5">
            <blockpin signalname="C" name="I0" />
            <blockpin signalname="A" name="I1" />
            <blockpin signalname="XLXN_7" name="O" />
        </block>
        <block symbolname="or3" name="XLXI_6">
            <blockpin signalname="XLXN_7" name="I0" />
            <blockpin signalname="XLXN_6" name="I1" />
            <blockpin signalname="XLXN_5" name="I2" />
            <blockpin signalname="Co" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="720" y="848" name="XLXI_1" orien="R0" />
        <instance x="1120" y="1120" name="XLXI_2" orien="R0" />
        <branch name="A">
            <wire x2="464" y1="720" y2="720" x1="368" />
            <wire x2="720" y1="720" y2="720" x1="464" />
            <wire x2="464" y1="720" y2="1232" x1="464" />
            <wire x2="464" y1="1232" y2="1744" x1="464" />
            <wire x2="736" y1="1744" y2="1744" x1="464" />
            <wire x2="736" y1="1232" y2="1232" x1="464" />
        </branch>
        <iomarker fontsize="28" x="368" y="720" name="A" orien="R180" />
        <iomarker fontsize="28" x="368" y="784" name="B" orien="R180" />
        <instance x="736" y="1360" name="XLXI_3" orien="R0" />
        <instance x="736" y="1632" name="XLXI_4" orien="R0" />
        <instance x="736" y="1872" name="XLXI_5" orien="R0" />
        <branch name="XLXN_3">
            <wire x2="1040" y1="752" y2="752" x1="976" />
            <wire x2="1040" y1="752" y2="992" x1="1040" />
            <wire x2="1120" y1="992" y2="992" x1="1040" />
        </branch>
        <branch name="C">
            <wire x2="624" y1="1056" y2="1056" x1="384" />
            <wire x2="1120" y1="1056" y2="1056" x1="624" />
            <wire x2="624" y1="1056" y2="1568" x1="624" />
            <wire x2="624" y1="1568" y2="1808" x1="624" />
            <wire x2="736" y1="1808" y2="1808" x1="624" />
            <wire x2="736" y1="1568" y2="1568" x1="624" />
        </branch>
        <iomarker fontsize="28" x="384" y="1056" name="C" orien="R180" />
        <branch name="B">
            <wire x2="560" y1="784" y2="784" x1="368" />
            <wire x2="720" y1="784" y2="784" x1="560" />
            <wire x2="560" y1="784" y2="1288" x1="560" />
            <wire x2="560" y1="1288" y2="1296" x1="560" />
            <wire x2="560" y1="1296" y2="1504" x1="560" />
            <wire x2="736" y1="1504" y2="1504" x1="560" />
            <wire x2="736" y1="1296" y2="1296" x1="560" />
        </branch>
        <instance x="1264" y="1664" name="XLXI_6" orien="R0" />
        <branch name="XLXN_5">
            <wire x2="1168" y1="1264" y2="1264" x1="992" />
            <wire x2="1168" y1="1264" y2="1472" x1="1168" />
            <wire x2="1264" y1="1472" y2="1472" x1="1168" />
        </branch>
        <branch name="XLXN_6">
            <wire x2="1008" y1="1536" y2="1536" x1="992" />
            <wire x2="1264" y1="1536" y2="1536" x1="1008" />
        </branch>
        <branch name="XLXN_7">
            <wire x2="1152" y1="1776" y2="1776" x1="992" />
            <wire x2="1152" y1="1600" y2="1776" x1="1152" />
            <wire x2="1264" y1="1600" y2="1600" x1="1152" />
        </branch>
        <branch name="Co">
            <wire x2="2016" y1="1536" y2="1536" x1="1520" />
        </branch>
        <branch name="S">
            <wire x2="1968" y1="1024" y2="1024" x1="1376" />
        </branch>
        <iomarker fontsize="28" x="1968" y="1024" name="S" orien="R0" />
        <iomarker fontsize="28" x="2016" y="1536" name="Co" orien="R0" />
    </sheet>
</drawing>