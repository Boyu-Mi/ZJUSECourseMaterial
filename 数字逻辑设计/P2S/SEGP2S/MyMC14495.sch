<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="kintex7" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_9" />
        <signal name="D3" />
        <signal name="D2" />
        <signal name="D1" />
        <signal name="D0" />
        <signal name="XLXN_26" />
        <signal name="XLXN_27" />
        <signal name="XLXN_28" />
        <signal name="XLXN_29" />
        <signal name="XLXN_30" />
        <signal name="XLXN_34" />
        <signal name="XLXN_35" />
        <signal name="XLXN_36" />
        <signal name="XLXN_37" />
        <signal name="XLXN_38" />
        <signal name="XLXN_39" />
        <signal name="XLXN_40" />
        <signal name="XLXN_41" />
        <signal name="XLXN_42" />
        <signal name="XLXN_44" />
        <signal name="XLXN_45" />
        <signal name="XLXN_46" />
        <signal name="XLXN_47" />
        <signal name="XLXN_48" />
        <signal name="XLXN_49" />
        <signal name="XLXN_50" />
        <signal name="XLXN_51" />
        <signal name="XLXN_52" />
        <signal name="XLXN_53" />
        <signal name="XLXN_54" />
        <signal name="XLXN_55" />
        <signal name="XLXN_57" />
        <signal name="XLXN_58" />
        <signal name="XLXN_59" />
        <signal name="XLXN_62" />
        <signal name="XLXN_63" />
        <signal name="XLXN_64" />
        <signal name="XLXN_65" />
        <signal name="XLXN_68" />
        <signal name="XLXN_69" />
        <signal name="XLXN_75" />
        <signal name="XLXN_78" />
        <signal name="XLXN_79" />
        <signal name="XLXN_80" />
        <signal name="XLXN_81" />
        <signal name="XLXN_82" />
        <signal name="LE" />
        <signal name="XLXN_84" />
        <signal name="XLXN_85" />
        <signal name="XLXN_87" />
        <signal name="XLXN_88" />
        <signal name="XLXN_89" />
        <signal name="XLXN_90" />
        <signal name="a" />
        <signal name="b" />
        <signal name="c" />
        <signal name="d" />
        <signal name="e" />
        <signal name="f" />
        <signal name="g" />
        <signal name="p" />
        <signal name="point" />
        <port polarity="Input" name="D3" />
        <port polarity="Input" name="D2" />
        <port polarity="Input" name="D1" />
        <port polarity="Input" name="D0" />
        <port polarity="Input" name="LE" />
        <port polarity="Output" name="a" />
        <port polarity="Output" name="b" />
        <port polarity="Output" name="c" />
        <port polarity="Output" name="d" />
        <port polarity="Output" name="e" />
        <port polarity="Output" name="f" />
        <port polarity="Output" name="g" />
        <port polarity="Output" name="p" />
        <port polarity="Input" name="point" />
        <blockdef name="inv">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
        </blockdef>
        <blockdef name="and4">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-112" y2="-112" x1="144" />
            <arc ex="144" ey="-208" sx="144" sy="-112" r="48" cx="144" cy="-160" />
            <line x2="144" y1="-208" y2="-208" x1="64" />
            <line x2="64" y1="-64" y2="-256" x1="64" />
            <line x2="192" y1="-160" y2="-160" x1="256" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-64" y2="-64" x1="0" />
        </blockdef>
        <blockdef name="and3">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="192" y1="-128" y2="-128" x1="256" />
            <line x2="144" y1="-176" y2="-176" x1="64" />
            <line x2="64" y1="-80" y2="-80" x1="144" />
            <arc ex="144" ey="-176" sx="144" sy="-80" r="48" cx="144" cy="-128" />
            <line x2="64" y1="-64" y2="-192" x1="64" />
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
        <blockdef name="or2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="192" ey="-96" sx="112" sy="-48" r="88" cx="116" cy="-136" />
            <arc ex="48" ey="-144" sx="48" sy="-48" r="56" cx="16" cy="-96" />
            <line x2="48" y1="-144" y2="-144" x1="112" />
            <arc ex="112" ey="-144" sx="192" sy="-96" r="88" cx="116" cy="-56" />
            <line x2="48" y1="-48" y2="-48" x1="112" />
        </blockdef>
        <block symbolname="inv" name="XLXI_5">
            <blockpin signalname="D3" name="I" />
            <blockpin signalname="XLXN_9" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_6">
            <blockpin signalname="D2" name="I" />
            <blockpin signalname="XLXN_26" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_7">
            <blockpin signalname="D1" name="I" />
            <blockpin signalname="XLXN_27" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_8">
            <blockpin signalname="D0" name="I" />
            <blockpin signalname="XLXN_30" name="O" />
        </block>
        <block symbolname="and4" name="XLXI_10">
            <blockpin signalname="XLXN_30" name="I0" />
            <blockpin signalname="XLXN_27" name="I1" />
            <blockpin signalname="D2" name="I2" />
            <blockpin signalname="XLXN_9" name="I3" />
            <blockpin signalname="XLXN_37" name="O" />
        </block>
        <block symbolname="and4" name="XLXI_28">
            <blockpin signalname="D0" name="I0" />
            <blockpin signalname="D1" name="I1" />
            <blockpin signalname="D2" name="I2" />
            <blockpin signalname="XLXN_9" name="I3" />
            <blockpin signalname="XLXN_79" name="O" />
        </block>
        <block symbolname="and4" name="XLXI_20">
            <blockpin signalname="XLXN_30" name="I0" />
            <blockpin signalname="D1" name="I1" />
            <blockpin signalname="XLXN_26" name="I2" />
            <blockpin signalname="D3" name="I3" />
            <blockpin signalname="XLXN_50" name="O" />
        </block>
        <block symbolname="and4" name="XLXI_17">
            <blockpin signalname="XLXN_30" name="I0" />
            <blockpin signalname="D1" name="I1" />
            <blockpin signalname="XLXN_26" name="I2" />
            <blockpin signalname="XLXN_9" name="I3" />
            <blockpin signalname="XLXN_47" name="O" />
        </block>
        <block symbolname="and4" name="XLXI_13">
            <blockpin signalname="D0" name="I0" />
            <blockpin signalname="XLXN_27" name="I1" />
            <blockpin signalname="D2" name="I2" />
            <blockpin signalname="XLXN_9" name="I3" />
            <blockpin signalname="XLXN_41" name="O" />
        </block>
        <block symbolname="and4" name="XLXI_12">
            <blockpin signalname="D0" name="I0" />
            <blockpin signalname="D1" name="I1" />
            <blockpin signalname="XLXN_26" name="I2" />
            <blockpin signalname="D3" name="I3" />
            <blockpin signalname="XLXN_40" name="O" />
        </block>
        <block symbolname="and4" name="XLXI_9">
            <blockpin signalname="D0" name="I0" />
            <blockpin signalname="XLXN_26" name="I1" />
            <blockpin signalname="XLXN_27" name="I2" />
            <blockpin signalname="XLXN_9" name="I3" />
            <blockpin signalname="XLXN_36" name="O" />
        </block>
        <block symbolname="and4" name="XLXI_71">
            <blockpin signalname="XLXN_30" name="I0" />
            <blockpin signalname="XLXN_27" name="I1" />
            <blockpin signalname="D2" name="I2" />
            <blockpin signalname="D3" name="I3" />
            <blockpin signalname="XLXN_80" name="O" />
        </block>
        <block symbolname="and4" name="XLXI_72">
            <blockpin signalname="D0" name="I0" />
            <blockpin signalname="XLXN_27" name="I1" />
            <blockpin signalname="D2" name="I2" />
            <blockpin signalname="D3" name="I3" />
            <blockpin signalname="XLXN_39" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_73">
            <blockpin signalname="XLXN_30" name="I0" />
            <blockpin signalname="D1" name="I1" />
            <blockpin signalname="D2" name="I2" />
            <blockpin signalname="XLXN_42" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_74">
            <blockpin signalname="XLXN_30" name="I0" />
            <blockpin signalname="D2" name="I1" />
            <blockpin signalname="D3" name="I2" />
            <blockpin signalname="XLXN_44" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_75">
            <blockpin signalname="D0" name="I0" />
            <blockpin signalname="D1" name="I1" />
            <blockpin signalname="D3" name="I2" />
            <blockpin signalname="XLXN_45" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_76">
            <blockpin signalname="D1" name="I0" />
            <blockpin signalname="D2" name="I1" />
            <blockpin signalname="D3" name="I2" />
            <blockpin signalname="XLXN_48" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_77">
            <blockpin signalname="D0" name="I0" />
            <blockpin signalname="D1" name="I1" />
            <blockpin signalname="D2" name="I2" />
            <blockpin signalname="XLXN_49" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_78">
            <blockpin signalname="D0" name="I0" />
            <blockpin signalname="XLXN_9" name="I1" />
            <blockpin signalname="XLXN_51" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_79">
            <blockpin signalname="XLXN_27" name="I0" />
            <blockpin signalname="D2" name="I1" />
            <blockpin signalname="XLXN_9" name="I2" />
            <blockpin signalname="XLXN_52" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_80">
            <blockpin signalname="XLXN_27" name="I0" />
            <blockpin signalname="XLXN_26" name="I1" />
            <blockpin signalname="XLXN_9" name="I2" />
            <blockpin signalname="XLXN_65" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_81">
            <blockpin signalname="D0" name="I0" />
            <blockpin signalname="D1" name="I1" />
            <blockpin signalname="XLXN_9" name="I2" />
            <blockpin signalname="XLXN_64" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_82">
            <blockpin signalname="D1" name="I0" />
            <blockpin signalname="XLXN_26" name="I1" />
            <blockpin signalname="XLXN_9" name="I2" />
            <blockpin signalname="XLXN_62" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_83">
            <blockpin signalname="D0" name="I0" />
            <blockpin signalname="XLXN_26" name="I1" />
            <blockpin signalname="XLXN_9" name="I2" />
            <blockpin signalname="XLXN_57" name="O" />
        </block>
        <block symbolname="or4" name="XLXI_85">
            <blockpin signalname="XLXN_40" name="I0" />
            <blockpin signalname="XLXN_39" name="I1" />
            <blockpin signalname="XLXN_37" name="I2" />
            <blockpin signalname="XLXN_36" name="I3" />
            <blockpin signalname="XLXN_82" name="O" />
        </block>
        <block symbolname="or4" name="XLXI_86">
            <blockpin signalname="XLXN_45" name="I0" />
            <blockpin signalname="XLXN_44" name="I1" />
            <blockpin signalname="XLXN_42" name="I2" />
            <blockpin signalname="XLXN_41" name="I3" />
            <blockpin signalname="XLXN_84" name="O" />
        </block>
        <block symbolname="or3" name="XLXI_87">
            <blockpin signalname="XLXN_48" name="I0" />
            <blockpin signalname="XLXN_47" name="I1" />
            <blockpin signalname="XLXN_44" name="I2" />
            <blockpin signalname="XLXN_85" name="O" />
        </block>
        <block symbolname="or4" name="XLXI_88">
            <blockpin signalname="XLXN_50" name="I0" />
            <blockpin signalname="XLXN_49" name="I1" />
            <blockpin signalname="XLXN_37" name="I2" />
            <blockpin signalname="XLXN_36" name="I3" />
            <blockpin signalname="XLXN_87" name="O" />
        </block>
        <block symbolname="or3" name="XLXI_89">
            <blockpin signalname="XLXN_53" name="I0" />
            <blockpin signalname="XLXN_52" name="I1" />
            <blockpin signalname="XLXN_51" name="I2" />
            <blockpin signalname="XLXN_88" name="O" />
        </block>
        <block symbolname="or4" name="XLXI_90">
            <blockpin signalname="XLXN_64" name="I0" />
            <blockpin signalname="XLXN_62" name="I1" />
            <blockpin signalname="XLXN_57" name="I2" />
            <blockpin signalname="XLXN_39" name="I3" />
            <blockpin signalname="XLXN_89" name="O" />
        </block>
        <block symbolname="or3" name="XLXI_91">
            <blockpin signalname="XLXN_80" name="I0" />
            <blockpin signalname="XLXN_79" name="I1" />
            <blockpin signalname="XLXN_65" name="I2" />
            <blockpin signalname="XLXN_90" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_92">
            <blockpin signalname="D0" name="I0" />
            <blockpin signalname="XLXN_27" name="I1" />
            <blockpin signalname="XLXN_26" name="I2" />
            <blockpin signalname="XLXN_53" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_93">
            <blockpin signalname="LE" name="I0" />
            <blockpin signalname="XLXN_82" name="I1" />
            <blockpin signalname="a" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_94">
            <blockpin signalname="LE" name="I0" />
            <blockpin signalname="XLXN_84" name="I1" />
            <blockpin signalname="b" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_95">
            <blockpin signalname="LE" name="I0" />
            <blockpin signalname="XLXN_85" name="I1" />
            <blockpin signalname="c" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_96">
            <blockpin signalname="LE" name="I0" />
            <blockpin signalname="XLXN_87" name="I1" />
            <blockpin signalname="d" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_97">
            <blockpin signalname="LE" name="I0" />
            <blockpin signalname="XLXN_88" name="I1" />
            <blockpin signalname="e" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_98">
            <blockpin signalname="LE" name="I0" />
            <blockpin signalname="XLXN_89" name="I1" />
            <blockpin signalname="f" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_99">
            <blockpin signalname="LE" name="I0" />
            <blockpin signalname="XLXN_90" name="I1" />
            <blockpin signalname="g" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_100">
            <blockpin signalname="point" name="I" />
            <blockpin signalname="p" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="5440" height="7040">
        <instance x="256" y="160" name="XLXI_5" orien="R0" />
        <instance x="256" y="352" name="XLXI_6" orien="R0" />
        <instance x="256" y="528" name="XLXI_7" orien="R0" />
        <instance x="256" y="704" name="XLXI_8" orien="R0" />
        <instance x="1424" y="656" name="XLXI_10" orien="R0" />
        <instance x="1424" y="5248" name="XLXI_28" orien="R0" />
        <instance x="1424" y="3216" name="XLXI_20" orien="R0" />
        <instance x="1424" y="2448" name="XLXI_17" orien="R0" />
        <instance x="1424" y="1440" name="XLXI_13" orien="R0" />
        <instance x="1424" y="1184" name="XLXI_12" orien="R0" />
        <instance x="1424" y="384" name="XLXI_9" orien="R0" />
        <branch name="D3">
            <wire x2="208" y1="128" y2="128" x1="144" />
            <wire x2="256" y1="128" y2="128" x1="208" />
            <wire x2="208" y1="128" y2="240" x1="208" />
            <wire x2="800" y1="240" y2="240" x1="208" />
            <wire x2="800" y1="240" y2="656" x1="800" />
            <wire x2="1424" y1="656" y2="656" x1="800" />
            <wire x2="800" y1="656" y2="928" x1="800" />
            <wire x2="1424" y1="928" y2="928" x1="800" />
            <wire x2="800" y1="928" y2="1696" x1="800" />
            <wire x2="1424" y1="1696" y2="1696" x1="800" />
            <wire x2="800" y1="1696" y2="1952" x1="800" />
            <wire x2="1424" y1="1952" y2="1952" x1="800" />
            <wire x2="800" y1="1952" y2="2496" x1="800" />
            <wire x2="1424" y1="2496" y2="2496" x1="800" />
            <wire x2="800" y1="2496" y2="2960" x1="800" />
            <wire x2="800" y1="2960" y2="5248" x1="800" />
            <wire x2="1424" y1="5248" y2="5248" x1="800" />
            <wire x2="1424" y1="2960" y2="2960" x1="800" />
        </branch>
        <iomarker fontsize="28" x="144" y="128" name="D3" orien="R180" />
        <iomarker fontsize="28" x="144" y="320" name="D2" orien="R180" />
        <iomarker fontsize="28" x="144" y="496" name="D1" orien="R180" />
        <iomarker fontsize="28" x="144" y="672" name="D0" orien="R180" />
        <instance x="1424" y="5504" name="XLXI_71" orien="R0" />
        <instance x="1424" y="912" name="XLXI_72" orien="R0" />
        <instance x="1424" y="1664" name="XLXI_73" orien="R0" />
        <instance x="1424" y="2144" name="XLXI_75" orien="R0" />
        <instance x="1424" y="1888" name="XLXI_74" orien="R0" />
        <instance x="1424" y="2688" name="XLXI_76" orien="R0" />
        <instance x="1424" y="2896" name="XLXI_77" orien="R0" />
        <instance x="1424" y="3344" name="XLXI_78" orien="R0" />
        <instance x="1424" y="3664" name="XLXI_79" orien="R0" />
        <instance x="1424" y="4672" name="XLXI_81" orien="R0" />
        <instance x="1424" y="4432" name="XLXI_82" orien="R0" />
        <instance x="1424" y="4176" name="XLXI_83" orien="R0" />
        <branch name="XLXN_26">
            <wire x2="1232" y1="320" y2="320" x1="480" />
            <wire x2="1232" y1="320" y2="992" x1="1232" />
            <wire x2="1424" y1="992" y2="992" x1="1232" />
            <wire x2="1232" y1="992" y2="2256" x1="1232" />
            <wire x2="1424" y1="2256" y2="2256" x1="1232" />
            <wire x2="1232" y1="2256" y2="3024" x1="1232" />
            <wire x2="1424" y1="3024" y2="3024" x1="1232" />
            <wire x2="1232" y1="3024" y2="3728" x1="1232" />
            <wire x2="1424" y1="3728" y2="3728" x1="1232" />
            <wire x2="1232" y1="3728" y2="4048" x1="1232" />
            <wire x2="1424" y1="4048" y2="4048" x1="1232" />
            <wire x2="1232" y1="4048" y2="4304" x1="1232" />
            <wire x2="1424" y1="4304" y2="4304" x1="1232" />
            <wire x2="1232" y1="4304" y2="4800" x1="1232" />
            <wire x2="1424" y1="4800" y2="4800" x1="1232" />
            <wire x2="1424" y1="256" y2="256" x1="1232" />
            <wire x2="1232" y1="256" y2="320" x1="1232" />
        </branch>
        <branch name="D1">
            <wire x2="208" y1="496" y2="496" x1="144" />
            <wire x2="256" y1="496" y2="496" x1="208" />
            <wire x2="208" y1="496" y2="576" x1="208" />
            <wire x2="640" y1="576" y2="576" x1="208" />
            <wire x2="640" y1="576" y2="1056" x1="640" />
            <wire x2="1424" y1="1056" y2="1056" x1="640" />
            <wire x2="640" y1="1056" y2="1536" x1="640" />
            <wire x2="1424" y1="1536" y2="1536" x1="640" />
            <wire x2="640" y1="1536" y2="2016" x1="640" />
            <wire x2="1424" y1="2016" y2="2016" x1="640" />
            <wire x2="640" y1="2016" y2="2320" x1="640" />
            <wire x2="1424" y1="2320" y2="2320" x1="640" />
            <wire x2="640" y1="2320" y2="2624" x1="640" />
            <wire x2="1424" y1="2624" y2="2624" x1="640" />
            <wire x2="640" y1="2624" y2="2768" x1="640" />
            <wire x2="1424" y1="2768" y2="2768" x1="640" />
            <wire x2="640" y1="2768" y2="3088" x1="640" />
            <wire x2="1424" y1="3088" y2="3088" x1="640" />
            <wire x2="640" y1="3088" y2="4368" x1="640" />
            <wire x2="1424" y1="4368" y2="4368" x1="640" />
            <wire x2="640" y1="4368" y2="4544" x1="640" />
            <wire x2="1424" y1="4544" y2="4544" x1="640" />
            <wire x2="640" y1="4544" y2="5120" x1="640" />
            <wire x2="1424" y1="5120" y2="5120" x1="640" />
        </branch>
        <branch name="D0">
            <wire x2="192" y1="672" y2="672" x1="144" />
            <wire x2="256" y1="672" y2="672" x1="192" />
            <wire x2="192" y1="672" y2="752" x1="192" />
            <wire x2="560" y1="752" y2="752" x1="192" />
            <wire x2="576" y1="752" y2="752" x1="560" />
            <wire x2="560" y1="752" y2="848" x1="560" />
            <wire x2="1424" y1="848" y2="848" x1="560" />
            <wire x2="560" y1="848" y2="1120" x1="560" />
            <wire x2="1424" y1="1120" y2="1120" x1="560" />
            <wire x2="560" y1="1120" y2="1376" x1="560" />
            <wire x2="1424" y1="1376" y2="1376" x1="560" />
            <wire x2="560" y1="1376" y2="2080" x1="560" />
            <wire x2="1424" y1="2080" y2="2080" x1="560" />
            <wire x2="560" y1="2080" y2="2832" x1="560" />
            <wire x2="1424" y1="2832" y2="2832" x1="560" />
            <wire x2="560" y1="2832" y2="3280" x1="560" />
            <wire x2="1424" y1="3280" y2="3280" x1="560" />
            <wire x2="560" y1="3280" y2="3856" x1="560" />
            <wire x2="1424" y1="3856" y2="3856" x1="560" />
            <wire x2="560" y1="3856" y2="4112" x1="560" />
            <wire x2="1424" y1="4112" y2="4112" x1="560" />
            <wire x2="560" y1="4112" y2="4608" x1="560" />
            <wire x2="1424" y1="4608" y2="4608" x1="560" />
            <wire x2="560" y1="4608" y2="5184" x1="560" />
            <wire x2="1424" y1="5184" y2="5184" x1="560" />
            <wire x2="1392" y1="352" y2="352" x1="576" />
            <wire x2="576" y1="352" y2="752" x1="576" />
            <wire x2="1424" y1="320" y2="320" x1="1392" />
            <wire x2="1392" y1="320" y2="352" x1="1392" />
        </branch>
        <branch name="XLXN_27">
            <wire x2="1152" y1="496" y2="496" x1="480" />
            <wire x2="1152" y1="496" y2="528" x1="1152" />
            <wire x2="1424" y1="528" y2="528" x1="1152" />
            <wire x2="1152" y1="528" y2="784" x1="1152" />
            <wire x2="1424" y1="784" y2="784" x1="1152" />
            <wire x2="1152" y1="784" y2="1312" x1="1152" />
            <wire x2="1424" y1="1312" y2="1312" x1="1152" />
            <wire x2="1152" y1="1312" y2="3600" x1="1152" />
            <wire x2="1424" y1="3600" y2="3600" x1="1152" />
            <wire x2="1152" y1="3600" y2="3792" x1="1152" />
            <wire x2="1424" y1="3792" y2="3792" x1="1152" />
            <wire x2="1152" y1="3792" y2="4864" x1="1152" />
            <wire x2="1152" y1="4864" y2="5376" x1="1152" />
            <wire x2="1424" y1="5376" y2="5376" x1="1152" />
            <wire x2="1424" y1="4864" y2="4864" x1="1152" />
            <wire x2="1424" y1="192" y2="192" x1="1152" />
            <wire x2="1152" y1="192" y2="496" x1="1152" />
        </branch>
        <branch name="XLXN_30">
            <wire x2="1056" y1="672" y2="672" x1="480" />
            <wire x2="1056" y1="672" y2="1600" x1="1056" />
            <wire x2="1424" y1="1600" y2="1600" x1="1056" />
            <wire x2="1056" y1="1600" y2="1824" x1="1056" />
            <wire x2="1424" y1="1824" y2="1824" x1="1056" />
            <wire x2="1056" y1="1824" y2="2384" x1="1056" />
            <wire x2="1424" y1="2384" y2="2384" x1="1056" />
            <wire x2="1056" y1="2384" y2="3152" x1="1056" />
            <wire x2="1424" y1="3152" y2="3152" x1="1056" />
            <wire x2="1056" y1="3152" y2="5440" x1="1056" />
            <wire x2="1424" y1="5440" y2="5440" x1="1056" />
            <wire x2="1424" y1="592" y2="592" x1="1056" />
            <wire x2="1056" y1="592" y2="672" x1="1056" />
        </branch>
        <branch name="D2">
            <wire x2="208" y1="320" y2="320" x1="144" />
            <wire x2="256" y1="320" y2="320" x1="208" />
            <wire x2="208" y1="320" y2="416" x1="208" />
            <wire x2="704" y1="416" y2="416" x1="208" />
            <wire x2="704" y1="416" y2="464" x1="704" />
            <wire x2="1424" y1="464" y2="464" x1="704" />
            <wire x2="704" y1="464" y2="720" x1="704" />
            <wire x2="1424" y1="720" y2="720" x1="704" />
            <wire x2="704" y1="720" y2="1248" x1="704" />
            <wire x2="1424" y1="1248" y2="1248" x1="704" />
            <wire x2="704" y1="1248" y2="1472" x1="704" />
            <wire x2="1424" y1="1472" y2="1472" x1="704" />
            <wire x2="704" y1="1472" y2="1760" x1="704" />
            <wire x2="1424" y1="1760" y2="1760" x1="704" />
            <wire x2="704" y1="1760" y2="2560" x1="704" />
            <wire x2="1424" y1="2560" y2="2560" x1="704" />
            <wire x2="704" y1="2560" y2="2704" x1="704" />
            <wire x2="1424" y1="2704" y2="2704" x1="704" />
            <wire x2="704" y1="2704" y2="3536" x1="704" />
            <wire x2="1424" y1="3536" y2="3536" x1="704" />
            <wire x2="704" y1="3536" y2="5056" x1="704" />
            <wire x2="1424" y1="5056" y2="5056" x1="704" />
            <wire x2="704" y1="5056" y2="5312" x1="704" />
            <wire x2="1424" y1="5312" y2="5312" x1="704" />
        </branch>
        <instance x="2320" y="720" name="XLXI_85" orien="R0" />
        <instance x="2304" y="1984" name="XLXI_86" orien="R0" />
        <instance x="2304" y="2416" name="XLXI_87" orien="R0" />
        <instance x="2288" y="3008" name="XLXI_88" orien="R0" />
        <instance x="2272" y="3488" name="XLXI_89" orien="R0" />
        <instance x="2272" y="4096" name="XLXI_90" orien="R0" />
        <instance x="2240" y="4992" name="XLXI_91" orien="R0" />
        <branch name="XLXN_40">
            <wire x2="2240" y1="1024" y2="1024" x1="1680" />
            <wire x2="2240" y1="656" y2="1024" x1="2240" />
            <wire x2="2320" y1="656" y2="656" x1="2240" />
        </branch>
        <branch name="XLXN_41">
            <wire x2="2208" y1="1280" y2="1280" x1="1680" />
            <wire x2="2208" y1="1280" y2="1728" x1="2208" />
            <wire x2="2304" y1="1728" y2="1728" x1="2208" />
        </branch>
        <branch name="XLXN_42">
            <wire x2="1904" y1="1536" y2="1536" x1="1680" />
            <wire x2="1904" y1="1536" y2="1792" x1="1904" />
            <wire x2="2304" y1="1792" y2="1792" x1="1904" />
        </branch>
        <branch name="XLXN_44">
            <wire x2="1824" y1="1760" y2="1760" x1="1680" />
            <wire x2="1824" y1="1760" y2="1856" x1="1824" />
            <wire x2="2304" y1="1856" y2="1856" x1="1824" />
            <wire x2="1824" y1="1856" y2="2224" x1="1824" />
            <wire x2="2304" y1="2224" y2="2224" x1="1824" />
        </branch>
        <branch name="XLXN_45">
            <wire x2="2304" y1="2016" y2="2016" x1="1680" />
            <wire x2="2304" y1="1920" y2="2016" x1="2304" />
        </branch>
        <branch name="XLXN_47">
            <wire x2="2304" y1="2288" y2="2288" x1="1680" />
        </branch>
        <branch name="XLXN_48">
            <wire x2="2304" y1="2560" y2="2560" x1="1680" />
            <wire x2="2304" y1="2352" y2="2560" x1="2304" />
        </branch>
        <branch name="XLXN_36">
            <wire x2="2144" y1="224" y2="224" x1="1680" />
            <wire x2="2224" y1="224" y2="224" x1="2144" />
            <wire x2="2224" y1="224" y2="464" x1="2224" />
            <wire x2="2320" y1="464" y2="464" x1="2224" />
            <wire x2="2144" y1="224" y2="2752" x1="2144" />
            <wire x2="2288" y1="2752" y2="2752" x1="2144" />
        </branch>
        <branch name="XLXN_37">
            <wire x2="2064" y1="496" y2="496" x1="1680" />
            <wire x2="2064" y1="496" y2="528" x1="2064" />
            <wire x2="2320" y1="528" y2="528" x1="2064" />
            <wire x2="2064" y1="528" y2="2816" x1="2064" />
            <wire x2="2288" y1="2816" y2="2816" x1="2064" />
        </branch>
        <branch name="XLXN_49">
            <wire x2="2000" y1="2768" y2="2768" x1="1680" />
            <wire x2="2000" y1="2768" y2="2880" x1="2000" />
            <wire x2="2288" y1="2880" y2="2880" x1="2000" />
        </branch>
        <branch name="XLXN_50">
            <wire x2="2288" y1="3056" y2="3056" x1="1680" />
            <wire x2="2288" y1="2944" y2="3056" x1="2288" />
        </branch>
        <branch name="XLXN_51">
            <wire x2="2272" y1="3248" y2="3248" x1="1680" />
            <wire x2="2272" y1="3248" y2="3296" x1="2272" />
        </branch>
        <branch name="XLXN_52">
            <wire x2="2160" y1="3536" y2="3536" x1="1680" />
            <wire x2="2160" y1="3360" y2="3536" x1="2160" />
            <wire x2="2272" y1="3360" y2="3360" x1="2160" />
        </branch>
        <branch name="XLXN_53">
            <wire x2="2272" y1="3792" y2="3792" x1="1680" />
            <wire x2="2272" y1="3424" y2="3792" x1="2272" />
        </branch>
        <branch name="XLXN_39">
            <wire x2="1968" y1="752" y2="752" x1="1680" />
            <wire x2="1968" y1="752" y2="3840" x1="1968" />
            <wire x2="2272" y1="3840" y2="3840" x1="1968" />
            <wire x2="2320" y1="592" y2="592" x1="1968" />
            <wire x2="1968" y1="592" y2="752" x1="1968" />
        </branch>
        <branch name="XLXN_57">
            <wire x2="1744" y1="4048" y2="4048" x1="1680" />
            <wire x2="2272" y1="3904" y2="3904" x1="1744" />
            <wire x2="1744" y1="3904" y2="4048" x1="1744" />
        </branch>
        <instance x="1424" y="3920" name="XLXI_92" orien="R0" />
        <branch name="XLXN_62">
            <wire x2="1696" y1="4304" y2="4304" x1="1680" />
            <wire x2="2272" y1="3968" y2="3968" x1="1696" />
            <wire x2="1696" y1="3968" y2="4304" x1="1696" />
        </branch>
        <branch name="XLXN_64">
            <wire x2="2272" y1="4544" y2="4544" x1="1680" />
            <wire x2="2272" y1="4032" y2="4544" x1="2272" />
        </branch>
        <branch name="XLXN_65">
            <wire x2="2240" y1="4800" y2="4800" x1="1680" />
        </branch>
        <branch name="XLXN_9">
            <wire x2="1328" y1="128" y2="128" x1="480" />
            <wire x2="1328" y1="128" y2="400" x1="1328" />
            <wire x2="1328" y1="400" y2="1184" x1="1328" />
            <wire x2="1328" y1="1184" y2="2192" x1="1328" />
            <wire x2="1328" y1="2192" y2="3216" x1="1328" />
            <wire x2="1328" y1="3216" y2="3472" x1="1328" />
            <wire x2="1328" y1="3472" y2="3984" x1="1328" />
            <wire x2="1328" y1="3984" y2="4240" x1="1328" />
            <wire x2="1328" y1="4240" y2="4480" x1="1328" />
            <wire x2="1328" y1="4480" y2="4736" x1="1328" />
            <wire x2="1328" y1="4736" y2="4992" x1="1328" />
            <wire x2="1424" y1="4992" y2="4992" x1="1328" />
            <wire x2="1424" y1="4736" y2="4736" x1="1328" />
            <wire x2="1424" y1="4480" y2="4480" x1="1328" />
            <wire x2="1424" y1="4240" y2="4240" x1="1328" />
            <wire x2="1424" y1="3984" y2="3984" x1="1328" />
            <wire x2="1424" y1="3472" y2="3472" x1="1328" />
            <wire x2="1424" y1="3216" y2="3216" x1="1328" />
            <wire x2="1424" y1="2192" y2="2192" x1="1328" />
            <wire x2="1424" y1="1184" y2="1184" x1="1328" />
            <wire x2="1424" y1="400" y2="400" x1="1328" />
            <wire x2="1424" y1="128" y2="128" x1="1328" />
        </branch>
        <instance x="1424" y="4928" name="XLXI_80" orien="R0" />
        <branch name="XLXN_79">
            <wire x2="2160" y1="5088" y2="5088" x1="1680" />
            <wire x2="2160" y1="4864" y2="5088" x1="2160" />
            <wire x2="2240" y1="4864" y2="4864" x1="2160" />
        </branch>
        <branch name="XLXN_80">
            <wire x2="2240" y1="5344" y2="5344" x1="1680" />
            <wire x2="2240" y1="4928" y2="5344" x1="2240" />
        </branch>
        <instance x="3184" y="688" name="XLXI_93" orien="R0" />
        <instance x="3152" y="1952" name="XLXI_94" orien="R0" />
        <instance x="3152" y="2416" name="XLXI_95" orien="R0" />
        <instance x="3120" y="2976" name="XLXI_96" orien="R0" />
        <instance x="3104" y="3488" name="XLXI_97" orien="R0" />
        <instance x="3088" y="4048" name="XLXI_98" orien="R0" />
        <instance x="3088" y="4976" name="XLXI_99" orien="R0" />
        <branch name="XLXN_82">
            <wire x2="3184" y1="560" y2="560" x1="2576" />
        </branch>
        <branch name="XLXN_84">
            <wire x2="3152" y1="1824" y2="1824" x1="2560" />
        </branch>
        <branch name="XLXN_85">
            <wire x2="3152" y1="2288" y2="2288" x1="2560" />
        </branch>
        <branch name="XLXN_87">
            <wire x2="3120" y1="2848" y2="2848" x1="2544" />
        </branch>
        <branch name="XLXN_88">
            <wire x2="3104" y1="3360" y2="3360" x1="2528" />
        </branch>
        <branch name="XLXN_89">
            <wire x2="2800" y1="3936" y2="3936" x1="2528" />
            <wire x2="2800" y1="3920" y2="3936" x1="2800" />
            <wire x2="3088" y1="3920" y2="3920" x1="2800" />
        </branch>
        <branch name="XLXN_90">
            <wire x2="2784" y1="4864" y2="4864" x1="2496" />
            <wire x2="2784" y1="4848" y2="4864" x1="2784" />
            <wire x2="3088" y1="4848" y2="4848" x1="2784" />
        </branch>
        <branch name="a">
            <wire x2="3616" y1="592" y2="592" x1="3440" />
        </branch>
        <iomarker fontsize="28" x="3616" y="592" name="a" orien="R0" />
        <branch name="b">
            <wire x2="3600" y1="1856" y2="1856" x1="3408" />
        </branch>
        <iomarker fontsize="28" x="3600" y="1856" name="b" orien="R0" />
        <branch name="c">
            <wire x2="3584" y1="2320" y2="2320" x1="3408" />
        </branch>
        <iomarker fontsize="28" x="3584" y="2320" name="c" orien="R0" />
        <branch name="d">
            <wire x2="3584" y1="2880" y2="2880" x1="3376" />
        </branch>
        <iomarker fontsize="28" x="3584" y="2880" name="d" orien="R0" />
        <branch name="e">
            <wire x2="3584" y1="3392" y2="3392" x1="3360" />
        </branch>
        <iomarker fontsize="28" x="3584" y="3392" name="e" orien="R0" />
        <branch name="f">
            <wire x2="3552" y1="3952" y2="3952" x1="3344" />
        </branch>
        <iomarker fontsize="28" x="3552" y="3952" name="f" orien="R0" />
        <branch name="g">
            <wire x2="3504" y1="4880" y2="4880" x1="3344" />
        </branch>
        <iomarker fontsize="28" x="3504" y="4880" name="g" orien="R0" />
        <instance x="1024" y="5696" name="XLXI_100" orien="R0" />
        <branch name="p">
            <wire x2="3456" y1="5664" y2="5664" x1="1248" />
        </branch>
        <branch name="point">
            <wire x2="1024" y1="5664" y2="5664" x1="272" />
        </branch>
        <iomarker fontsize="28" x="272" y="5664" name="point" orien="R180" />
        <branch name="LE">
            <wire x2="2928" y1="5856" y2="5856" x1="288" />
            <wire x2="3184" y1="624" y2="624" x1="2928" />
            <wire x2="2928" y1="624" y2="1888" x1="2928" />
            <wire x2="3152" y1="1888" y2="1888" x1="2928" />
            <wire x2="2928" y1="1888" y2="2352" x1="2928" />
            <wire x2="3152" y1="2352" y2="2352" x1="2928" />
            <wire x2="2928" y1="2352" y2="2912" x1="2928" />
            <wire x2="3120" y1="2912" y2="2912" x1="2928" />
            <wire x2="2928" y1="2912" y2="3424" x1="2928" />
            <wire x2="3104" y1="3424" y2="3424" x1="2928" />
            <wire x2="2928" y1="3424" y2="3984" x1="2928" />
            <wire x2="3088" y1="3984" y2="3984" x1="2928" />
            <wire x2="2928" y1="3984" y2="4912" x1="2928" />
            <wire x2="3088" y1="4912" y2="4912" x1="2928" />
            <wire x2="2928" y1="4912" y2="5856" x1="2928" />
        </branch>
        <iomarker fontsize="28" x="288" y="5856" name="LE" orien="R180" />
        <iomarker fontsize="28" x="3456" y="5664" name="p" orien="R0" />
    </sheet>
</drawing>