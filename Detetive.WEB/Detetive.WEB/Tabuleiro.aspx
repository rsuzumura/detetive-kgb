<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Tabuleiro.aspx.cs" Inherits="Detetive.WEB.Tabuleiro" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="Stylesheet" type="text/css" href="Styles/tabuleiro.css" />
    <script type="text/javascript" src="Scripts/jquery-1.4.1.min.js"></script>
    <script type="text/javascript" src="Scripts/jquery-1.4.1-vsdoc.js"></script>
    <script type="text/javascript" src="Scripts/detetive.js"></script>
    <script type="text/javascript">
        function clicker(obj, evt) {
            var id = obj.id;
            var pos = id.split('_');
            var row = pos[0];
            var col = pos[1];

            if (detetive.MAP[row][col] == 2) {
                $("#<%=hdnData.ClientID%>").val(obj.id);
                var button = document.getElementById('<%=btnClicker.ClientID%>');
                button.click();
            } else {
                if (detetive.MAP[row][col] == 81 || detetive.MAP[row][col] == 82 || detetive.MAP[row][col] == 83 || detetive.MAP[row][col] == 84 || detetive.MAP[row][col] == 85 ||
                        detetive.MAP[row][col] == 86 || detetive.MAP[row][col] == 87 || detetive.MAP[row][col] == 88 || detetive.MAP[row][col] == 89) {
                    $("#<%=hdnData.ClientID%>").val(obj.id);
                    $("#<%=hdnRoom.ClientID%>").val(detetive.MAP[row][col]);
                    var buttonAccuse = document.getElementById('<%=btnAccuse.ClientID%>');
                    buttonAccuse.click();
                }
            }
        }

        function makeSugestion() {
            var message = "";
            var actor = 0;
            var weapon = 0;
            var button = document.getElementById('<%=btnMakeAccuse.ClientID%>');
            var rdoActors = document.getElementsByName("susp");
            var rdoWeapons = document.getElementsByName("weap");
            for (var i = 0; i < rdoActors.length; i++) {
                if (rdoActors[i].checked) {
                    actor = parseInt(rdoActors[i].value);
                    break;
                }
            }

            for (var i = 0; i < rdoWeapons.length; i++) {
                if (rdoWeapons[i].checked) {
                    weapon = parseInt(rdoWeapons[i].value);
                    break;
                }
            }

            if (actor > 0 && weapon > 0) {
                if (confirm("Confirma a Acusação?")) {
                    hideAccuse();
                    var act = document.getElementById('<%=hdnActor.ClientID%>');
                    var wea = document.getElementById('<%=hdnWeapon.ClientID%>');
                    act.value = actor.toString();
                    wea.value = weapon.toString();
                    button.click();
                }
            } else {
                var msg = "";
                msg += actor > 0 ? "" : "- Escolha um personagem.\n";
                msg += weapon > 0 ? "" : "- Escolha uma arma.\n";
                alert(msg);
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:Timer ID="TimerUpdateGame" runat="server" Interval="10000" OnTick="TimerUpdateGame_Tick">
    </asp:Timer>
    <div>
        <asp:UpdatePanel ID="UpdatePanelTable" runat="server">
            <ContentTemplate>
                <asp:HiddenField ID="hdnData" runat="server" Value="" />
                <asp:HiddenField ID="hdnEvent" runat="server" Value="" />
                <asp:HiddenField ID="hdnPlayer1" runat="server" Value="" />
                <asp:HiddenField ID="hdnRoom" runat="server" Value="" />

                <asp:HiddenField ID="hdnActor" runat="server" Value="" />
                <asp:HiddenField ID="hdnWeapon" runat="server" Value="" />
                <div align="center">
                    <div class="body">
                        <asp:Button ID="btnClicker" runat="server" Text="" Width="0" Height="0" OnClick="btnClicker_Click" />
                        <asp:Button ID="btnAccuse" runat="server" Text="" Width="0" Height="0" OnClick="btnAccuse_Click" />
                        <asp:Button ID="btnMakeAccuse" runat="server" Text="" Width="0" Height="0" OnClick="btnMakeAccuse_Click" />
                        <div align="center">
                            <div class="top">
                            </div>
                            <div style="width: 1024px;">
                                <div style="float: left;">
                                    <div class="table">
                                        <table cellpadding="0" cellspacing="0" class="gameArea">
                                            <tr id="ln_1">
                                                <td class="room" id="t0_0" onclick="clicker(this, event);" runat="server">
                                                </td>
                                                <td class="room" id="0_1" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="0_2" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="0_3" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="0_4" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="0_5" onclick="clicker(this, event);">
                                                </td>
                                                <td class="null" id="0_6" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="0_7" onclick="clicker(this, event);">
                                                </td>
                                                <td class="null" id="0_8" onclick="clicker(this, event);">
                                                </td>
                                                <td class="null" id="0_9" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="0_10" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="0_11" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="0_12" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="0_13" onclick="clicker(this, event);">
                                                </td>
                                                <td class="null" id="0_14" onclick="clicker(this, event);">
                                                </td>
                                                <td class="null" id="0_15" onclick="clicker(this, event);">
                                                </td>
                                                <td class="yellow" id="0_16" onclick="clicker(this, event);">
                                                </td>
                                                <td class="null" id="0_17" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="0_18" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="0_19" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="0_20" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="0_21" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="0_22" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="0_23" onclick="clicker(this, event);">
                                                </td>
                                            </tr>
                                            <tr id="ln_2">
                                                <td class="room" id="1_0" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="1_1" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="1_2" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="1_3" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="1_4" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="1_5" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="1_6" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="1_7" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="1_8" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="1_9" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="1_10" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="1_11" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="1_12" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="1_13" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="1_14" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="1_15" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="1_16" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="1_17" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="1_18" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="1_19" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="1_20" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="1_21" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="1_22" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="1_23" onclick="clicker(this, event);">
                                                </td>
                                            </tr>
                                            <tr id="ln_3">
                                                <td class="room" id="2_0" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="2_1" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="2_2" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="2_3" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="2_4" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="2_5" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="2_6" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="2_7" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="2_8" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="2_9" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="2_10" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="2_11" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="2_12" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="2_13" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="2_14" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="2_15" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="2_16" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="2_17" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="2_18" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="2_19" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="2_20" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="2_21" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="2_22" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="2_23" onclick="clicker(this, event);">
                                                </td>
                                            </tr>
                                            <tr id="ln_4">
                                                <td class="room" id="3_0" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="3_1" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="3_2" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="3_3" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="3_4" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="3_5" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="3_6" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="3_7" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="3_8" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="3_9" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="3_10" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="3_11" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="3_12" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="3_13" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="3_14" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="3_15" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="3_16" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="3_17" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="3_18" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="3_19" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="3_20" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="3_21" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="3_22" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="3_23" onclick="clicker(this, event);">
                                                </td>
                                            </tr>
                                            <tr id="ln_5">
                                                <td class="null" id="4_0" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="4_1" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="4_2" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="4_3" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="4_4" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="4_5" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="4_6" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="4_7" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="4_8" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="4_9" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="4_10" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="4_11" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="4_12" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="4_13" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="4_14" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="4_15" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="4_16" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="4_17" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="4_18" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="4_19" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="4_20" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="4_21" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="4_22" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="4_23" onclick="clicker(this, event);">
                                                </td>
                                            </tr>
                                            <tr id="ln_6">
                                                <td class="white" id="5_0" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="5_1" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="5_2" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="5_3" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="5_4" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="5_5" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="5_6" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="5_7" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="5_8" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="5_9" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="5_10" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="5_11" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="5_12" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="5_13" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="5_14" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="5_15" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="5_16" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="5_17" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="5_18" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="5_19" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="5_20" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="5_21" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="5_22" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="5_23" onclick="clicker(this, event);">
                                                </td>
                                            </tr>
                                            <tr id="ln_7">
                                                <td class="null" id="6_0" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="6_1" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="6_2" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="6_3" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="6_4" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="6_5" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="6_6" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="6_7" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="6_8" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="6_9" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="6_10" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="6_11" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="6_12" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="6_13" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="6_14" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="6_15" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="6_16" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="6_17" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="6_18" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="6_19" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="6_20" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="6_21" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="6_22" onclick="clicker(this, event);">
                                                </td>
                                                <td class="null" id="6_23" onclick="clicker(this, event);">
                                                </td>
                                            </tr>
                                            <tr id="ln_8">
                                                <td class="room" id="7_0" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="7_1" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="7_2" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="7_3" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="7_4" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="7_5" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="7_6" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="7_7" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="7_8" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="7_9" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="7_10" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="7_11" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="7_12" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="7_13" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="7_14" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="7_15" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="7_16" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="7_17" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="7_18" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="7_19" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="7_20" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="7_21" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="7_22" onclick="clicker(this, event);">
                                                </td>
                                                <td class="purple" id="7_23" onclick="clicker(this, event);">
                                                </td>
                                            </tr>
                                            <tr id="ln_9">
                                                <td class="room" id="8_0" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="8_1" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="8_2" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="8_3" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="8_4" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="8_5" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="8_6" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="8_7" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="8_8" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="8_9" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="8_10" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="8_11" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="8_12" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="8_13" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="8_14" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="8_15" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="8_16" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="8_17" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="8_18" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="8_19" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="8_20" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="8_21" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="8_22" onclick="clicker(this, event);">
                                                </td>
                                                <td class="null" id="8_23" onclick="clicker(this, event);">
                                                </td>
                                            </tr>
                                            <tr id="ln_10">
                                                <td class="room" id="9_0" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="9_1" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="9_2" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="9_3" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="9_4" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="9_5" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="9_6" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="9_7" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="9_8" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="9_9" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="9_10" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="9_11" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="9_12" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="9_13" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="9_14" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="9_15" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="9_16" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="9_17" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="9_18" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="9_19" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="9_20" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="9_21" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="9_22" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="9_23" onclick="clicker(this, event);">
                                                </td>
                                            </tr>
                                            <tr id="ln_11">
                                                <td class="null" id="10_0" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="10_1" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="10_2" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="10_3" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="10_4" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="10_5" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="10_6" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="10_7" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="10_8" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="10_9" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="10_10" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="10_11" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="10_12" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="10_13" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="10_14" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="10_15" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="10_16" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="10_17" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="10_18" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="10_19" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="10_20" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="10_21" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="10_22" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="10_23" onclick="clicker(this, event);">
                                                </td>
                                            </tr>
                                            <tr id="ln_12">
                                                <td class="null" id="11_0" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="11_1" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="11_2" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="11_3" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="11_4" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="11_5" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="11_6" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="11_7" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="11_8" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="11_9" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="11_10" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="11_11" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="11_12" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="11_13" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="11_14" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="11_15" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="11_16" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="11_17" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="11_18" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="11_19" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="11_20" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="11_21" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="11_22" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="11_23" onclick="clicker(this, event);">
                                                </td>
                                            </tr>
                                            <tr id="ln_13">
                                                <td class="room" id="12_0" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="12_1" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="12_2" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="12_3" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="12_4" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="12_5" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="12_6" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="12_7" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="12_8" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="12_9" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="12_10" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="12_11" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="12_12" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="12_13" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="12_14" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="12_15" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="12_16" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="12_17" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="12_18" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="12_19" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="12_20" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="12_21" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="12_22" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="12_23" onclick="clicker(this, event);">
                                                </td>
                                            </tr>
                                            <tr id="ln_14">
                                                <td class="room" id="13_0" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="13_1" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="13_2" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="13_3" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="13_4" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="13_5" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="13_6" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="13_7" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="13_8" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="13_9" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="13_10" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="13_11" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="13_12" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="13_13" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="13_14" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="13_15" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="13_16" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="13_17" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="13_18" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="13_19" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="13_20" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="13_21" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="13_22" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="13_23" onclick="clicker(this, event);">
                                                </td>
                                            </tr>
                                            <tr id="ln_15">
                                                <td class="room" id="14_0" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="14_1" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="14_2" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="14_3" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="14_4" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="14_5" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="14_6" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="14_7" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="14_8" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="14_9" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="14_10" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="14_11" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="14_12" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="14_13" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="14_14" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="14_15" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="14_16" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="14_17" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="14_18" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="14_19" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="14_20" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="14_21" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="14_22" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="14_23" onclick="clicker(this, event);">
                                                </td>
                                            </tr>
                                            <tr id="ln_16">
                                                <td class="room" id="15_0" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="15_1" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="15_2" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="15_3" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="15_4" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="15_5" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="15_6" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="15_7" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="15_8" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="15_9" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="15_10" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="15_11" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="15_12" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="15_13" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="15_14" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="15_15" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="15_16" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="15_17" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="15_18" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="15_19" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="15_20" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="15_21" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="15_22" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="15_23" onclick="clicker(this, event);">
                                                </td>
                                            </tr>
                                            <tr id="ln_17">
                                                <td class="room" id="16_0" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="16_1" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="16_2" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="16_3" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="16_4" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="16_5" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="16_6" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="16_7" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="16_8" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="16_9" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="16_10" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="16_11" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="16_12" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="16_13" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="16_14" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="16_15" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="16_16" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="16_17" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="16_18" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="16_19" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="16_20" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="16_21" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="16_22" onclick="clicker(this, event);">
                                                </td>
                                                <td class="null" id="16_23" onclick="clicker(this, event);">
                                                </td>
                                            </tr>
                                            <tr id="ln_18">
                                                <td class="null" id="17_0" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="17_1" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="17_2" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="17_3" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="17_4" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="17_5" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="17_6" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="17_7" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="17_8" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="17_9" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="17_10" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="17_11" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="17_12" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="17_13" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="17_14" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="17_15" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="17_16" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="17_17" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="17_18" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="17_19" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="17_20" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="17_21" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="17_22" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="17_23" onclick="clicker(this, event);">
                                                </td>
                                            </tr>
                                            <tr id="ln_19">
                                                <td class="blue" id="18_0" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="18_1" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="18_2" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="18_3" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="18_4" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="18_5" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="18_6" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="18_7" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="18_8" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="18_9" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="18_10" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="18_11" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="18_12" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="18_13" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="18_14" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="18_15" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="18_16" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="18_17" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="18_18" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="18_19" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="18_20" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="18_21" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="18_22" onclick="clicker(this, event);">
                                                </td>
                                                <td class="null" id="18_23" onclick="clicker(this, event);">
                                                </td>
                                            </tr>
                                            <tr id="ln_20">
                                                <td class="null" id="19_0" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="19_1" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="19_2" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="19_3" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="19_4" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="19_5" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="19_6" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="19_7" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="19_8" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="19_9" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="19_10" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="19_11" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="19_12" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="19_13" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="19_14" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="19_15" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="19_16" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="19_17" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="19_18" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="19_19" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="19_20" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="19_21" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="19_22" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="19_23" onclick="clicker(this, event);">
                                                </td>
                                            </tr>
                                            <tr id="ln_21">
                                                <td class="room" id="20_0" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="20_1" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="20_2" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="20_3" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="20_4" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="20_5" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="20_6" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="20_7" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="20_8" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="20_9" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="20_10" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="20_11" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="20_12" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="20_13" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="20_14" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="20_15" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="20_16" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="20_17" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="20_18" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="20_19" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="20_20" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="20_21" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="20_22" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="20_23" onclick="clicker(this, event);">
                                                </td>
                                            </tr>
                                            <tr id="ln_22">
                                                <td class="room" id="21_0" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="21_1" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="21_2" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="21_3" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="21_4" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="21_5" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="21_6" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="21_7" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="21_8" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="21_9" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="21_10" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="21_11" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="21_12" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="21_13" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="21_14" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="21_15" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="21_16" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="21_17" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="21_18" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="21_19" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="21_20" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="21_21" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="21_22" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="21_23" onclick="clicker(this, event);">
                                                </td>
                                            </tr>
                                            <tr id="ln_23">
                                                <td class="room" id="22_0" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="22_1" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="22_2" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="22_3" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="22_4" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="22_5" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="22_6" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="22_7" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="22_8" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="22_9" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="22_10" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="22_11" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="22_12" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="22_13" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="22_14" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="22_15" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="22_16" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="22_17" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="22_18" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="22_19" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="22_20" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="22_21" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="22_22" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="22_23" onclick="clicker(this, event);">
                                                </td>
                                            </tr>
                                            <tr id="ln_24">
                                                <td class="room" id="23_0" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="23_1" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="23_2" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="23_3" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="23_4" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="23_5" onclick="clicker(this, event);">
                                                </td>
                                                <td class="null" id="23_6" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="23_7" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="23_8" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="23_9" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="23_10" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="23_11" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="23_12" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="23_13" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="23_14" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="23_15" onclick="clicker(this, event);">
                                                </td>
                                                <td class="step" id="23_16" onclick="clicker(this, event);">
                                                </td>
                                                <td class="null" id="23_17" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="23_18" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="23_19" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="23_20" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="23_21" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="23_22" onclick="clicker(this, event);">
                                                </td>
                                                <td class="room" id="23_23" onclick="clicker(this, event);">
                                                </td>
                                            </tr>
                                            <tr id="ln_25">
                                                <td class="null" id="24_0" onclick="clicker(this, event);">
                                                </td>
                                                <td class="null" id="24_1" onclick="clicker(this, event);">
                                                </td>
                                                <td class="null" id="24_2" onclick="clicker(this, event);">
                                                </td>
                                                <td class="null" id="24_3" onclick="clicker(this, event);">
                                                </td>
                                                <td class="null" id="24_4" onclick="clicker(this, event);">
                                                </td>
                                                <td class="null" id="24_5" onclick="clicker(this, event);">
                                                </td>
                                                <td class="null" id="24_6" onclick="clicker(this, event);">
                                                </td>
                                                <td class="null" id="24_7" onclick="clicker(this, event);">
                                                </td>
                                                <td class="null" id="24_8" onclick="clicker(this, event);">
                                                </td>
                                                <td class="pink" id="24_9" onclick="clicker(this, event);">
                                                </td>
                                                <td class="null" id="24_10" onclick="clicker(this, event);">
                                                </td>
                                                <td class="null" id="24_11" onclick="clicker(this, event);">
                                                </td>
                                                <td class="null" id="24_12" onclick="clicker(this, event);">
                                                </td>
                                                <td class="null" id="24_13" onclick="clicker(this, event);">
                                                </td>
                                                <td class="green" id="24_14" onclick="clicker(this, event);">
                                                </td>
                                                <td class="null" id="24_15" onclick="clicker(this, event);">
                                                </td>
                                                <td class="null" id="24_16" onclick="clicker(this, event);">
                                                </td>
                                                <td class="null" id="24_17" onclick="clicker(this, event);">
                                                </td>
                                                <td class="null" id="24_18" onclick="clicker(this, event);">
                                                </td>
                                                <td class="null" id="24_19" onclick="clicker(this, event);">
                                                </td>
                                                <td class="null" id="24_20" onclick="clicker(this, event);">
                                                </td>
                                                <td class="null" id="24_21" onclick="clicker(this, event);">
                                                </td>
                                                <td class="null" id="24_22" onclick="clicker(this, event);">
                                                </td>
                                                <td class="null" id="24_23" onclick="clicker(this, event);">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <div style="float: right;">
                                    <div align="left" class="menu">
                                        <div align="center">
                                            <table style="width: 240px;">
                                                <colgroup>
                                                    <col width="200px" align="left" />
                                                    <col width="10px" />
                                                    <col width="10px" />
                                                    <col width="10px" />
                                                    <col width="10px" />
                                                </colgroup>
                                                <tr>
                                                    <td align="center">
                                                        <div class="titleMenu">
                                                            SUSPEITOS</div>
                                                    </td>
                                                </tr>
                                            </table>
                                            <table style="width: 230px;" class="gridCheck" cellpadding="0" cellspacing="0">
                                                <colgroup>
                                                    <col width="200px" align="left" />
                                                    <col width="10px" />
                                                    <col width="10px" />
                                                    <col width="10px" />
                                                </colgroup>
                                                <thead>
                                                    <tr>
                                                        <td class="headTitle">
                                                            &nbsp;
                                                        </td>
                                                        <td class="headTitle">
                                                            ?
                                                        </td>
                                                        <td class="headTitle">
                                                            S
                                                        </td>
                                                        <td class="headTitle">
                                                            NS
                                                        </td>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td class="check">
                                                            <asp:Literal ID="actor_1" runat="server">Suspeito 1</asp:Literal>
                                                        </td>
                                                        <td class="check">
                                                            <input type="checkbox" id="questionActor_1" />
                                                        </td>
                                                        <td class="check">
                                                            <input type="checkbox" id="suspectActor_1" />
                                                        </td>
                                                        <td class="check">
                                                            <input type="checkbox" id="notSuspectActor_1" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="check">
                                                            <asp:Literal ID="actor_2" runat="server">Suspeito 2</asp:Literal>
                                                        </td>
                                                        <td class="check">
                                                            <input type="checkbox" id="questionActor_2" />
                                                        </td>
                                                        <td class="check">
                                                            <input type="checkbox" id="suspectActor_2" />
                                                        </td>
                                                        <td class="check">
                                                            <input type="checkbox" id="notSuspectActor_2" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="check">
                                                            <asp:Literal ID="actor_3" runat="server">Suspeito 3</asp:Literal>
                                                        </td>
                                                        <td class="check">
                                                            <input type="checkbox" id="questionActor_3" />
                                                        </td>
                                                        <td class="check">
                                                            <input type="checkbox" id="suspectActor_3" />
                                                        </td>
                                                        <td class="check">
                                                            <input type="checkbox" id="notSuspectActor_3" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="check">
                                                            <asp:Literal ID="actor_4" runat="server">Suspeito 4</asp:Literal>
                                                        </td>
                                                        <td class="check">
                                                            <input type="checkbox" id="questionActor_4" />
                                                        </td>
                                                        <td class="check">
                                                            <input type="checkbox" id="suspectActor_4" />
                                                        </td>
                                                        <td class="check">
                                                            <input type="checkbox" id="notSuspectActor_4" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="check">
                                                            <asp:Literal ID="actor_5" runat="server">Suspeito 5</asp:Literal>
                                                        </td>
                                                        <td class="check">
                                                            <input type="checkbox" id="questionActor_5" />
                                                        </td>
                                                        <td class="check">
                                                            <input type="checkbox" id="suspectActor_5" />
                                                        </td>
                                                        <td class="check">
                                                            <input type="checkbox" id="notSuspectActor_5" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="check">
                                                            <asp:Literal ID="actor_6" runat="server">Suspeito 6</asp:Literal>
                                                        </td>
                                                        <td class="check">
                                                            <input type="checkbox" id="questionActor_6" />
                                                        </td>
                                                        <td class="check">
                                                            <input type="checkbox" id="suspectActor_6" />
                                                        </td>
                                                        <td class="check">
                                                            <input type="checkbox" id="notSuspectActor_6" />
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            <br />
                                            <table style="width: 240px;">
                                                <colgroup>
                                                    <col width="200px" align="left" />
                                                    <col width="10px" />
                                                    <col width="10px" />
                                                    <col width="10px" />
                                                    <col width="10px" />
                                                </colgroup>
                                                <tr>
                                                    <td align="center" class="titleMenu">
                                                        ARMAS
                                                    </td>
                                                </tr>
                                            </table>
                                            <table style="width: 230px;" class="gridCheck" cellpadding="0" cellspacing="0">
                                                <colgroup>
                                                    <col width="200px" align="left" />
                                                    <col width="10px" />
                                                    <col width="10px" />
                                                    <col width="10px" />
                                                </colgroup>
                                                <thead>
                                                    <tr>
                                                        <td class="headTitle">
                                                            &nbsp;
                                                        </td>
                                                        <td class="headTitle">
                                                            ?
                                                        </td>
                                                        <td class="headTitle">
                                                            S
                                                        </td>
                                                        <td class="headTitle">
                                                            NS
                                                        </td>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td class="check">
                                                            <asp:Literal ID="weapon_1" runat="server">Arma 1</asp:Literal>
                                                        </td>
                                                        <td class="check">
                                                            <input type="checkbox" id="questionWeapon_1" />
                                                        </td>
                                                        <td class="check">
                                                            <input type="checkbox" id="suspectWeapon_1" />
                                                        </td>
                                                        <td class="check">
                                                            <input type="checkbox" id="notSuspectWeapon_1" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="check">
                                                            <asp:Literal ID="weapon_2" runat="server">Arma 2</asp:Literal>
                                                        </td>
                                                        <td class="check">
                                                            <input type="checkbox" id="questionWeapon_2" />
                                                        </td>
                                                        <td class="check">
                                                            <input type="checkbox" id="suspectWeapon_2" />
                                                        </td>
                                                        <td class="check">
                                                            <input type="checkbox" id="notSuspectWeapon_2" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="check">
                                                            <asp:Literal ID="weapon_3" runat="server">Arma 3</asp:Literal>
                                                        </td>
                                                        <td class="check">
                                                            <input type="checkbox" id="questionWeapon_3" />
                                                        </td>
                                                        <td class="check">
                                                            <input type="checkbox" id="suspectWeapon_3" />
                                                        </td>
                                                        <td class="check">
                                                            <input type="checkbox" id="notSuspectWeapon_3" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="check">
                                                            <asp:Literal ID="weapon_4" runat="server">Arma 4</asp:Literal>
                                                        </td>
                                                        <td class="check">
                                                            <input type="checkbox" id="questionWeapon_4" />
                                                        </td>
                                                        <td class="check">
                                                            <input type="checkbox" id="suspectWeapon_4" />
                                                        </td>
                                                        <td class="check">
                                                            <input type="checkbox" id="notSuspectWeapon_4" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="check">
                                                            <asp:Literal ID="weapon_5" runat="server">Arma 5</asp:Literal>
                                                        </td>
                                                        <td class="check">
                                                            <input type="checkbox" id="questionWeapon_5" />
                                                        </td>
                                                        <td class="check">
                                                            <input type="checkbox" id="suspectWeapon_5" />
                                                        </td>
                                                        <td class="check">
                                                            <input type="checkbox" id="notSuspectWeapon_5" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="check">
                                                            <asp:Literal ID="weapon_6" runat="server">Arma 6</asp:Literal>
                                                        </td>
                                                        <td class="check">
                                                            <input type="checkbox" id="questionWeapon_6" />
                                                        </td>
                                                        <td class="check">
                                                            <input type="checkbox" id="suspectWeapon_6" />
                                                        </td>
                                                        <td class="check">
                                                            <input type="checkbox" id="notSuspectWeapon_6" />
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            <br />
                                            <table style="width: 240px;">
                                                <colgroup>
                                                    <col width="200px" align="left" />
                                                    <col width="10px" />
                                                    <col width="10px" />
                                                    <col width="10px" />
                                                    <col width="10px" />
                                                </colgroup>
                                                <tr>
                                                    <td align="center" class="titleMenu">
                                                        LOCAL
                                                    </td>
                                                </tr>
                                            </table>
                                            <table style="width: 230px;" class="gridCheck" cellpadding="0" cellspacing="0">
                                                <colgroup>
                                                    <col width="200px" align="left" />
                                                    <col width="10px" />
                                                    <col width="10px" />
                                                    <col width="10px" />
                                                </colgroup>
                                                <thead>
                                                    <tr>
                                                        <td class="headTitle">
                                                            &nbsp;
                                                        </td>
                                                        <td class="headTitle">
                                                            ?
                                                        </td>
                                                        <td class="headTitle">
                                                            S
                                                        </td>
                                                        <td class="headTitle">
                                                            NS
                                                        </td>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr class="lineCheck">
                                                        <td class="check">
                                                            <asp:Literal ID="room_1" runat="server">Banheiro</asp:Literal>
                                                        </td>
                                                        <td class="check">
                                                            <input type="checkbox" id="questionRoom_1" />
                                                        </td>
                                                        <td class="check">
                                                            <input type="checkbox" id="suspectRoom_1" />
                                                        </td>
                                                        <td class="check">
                                                            <input type="checkbox" id="notSuspectRoom_1" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="check">
                                                            <asp:Literal ID="room_2" runat="server">Cozinha</asp:Literal>
                                                        </td>
                                                        <td class="check">
                                                            <input type="checkbox" id="questionRoom_2" />
                                                        </td>
                                                        <td class="check">
                                                            <input type="checkbox" id="suspectRoom_2" />
                                                        </td>
                                                        <td class="check">
                                                            <input type="checkbox" id="notSuspectRoom_2" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="check">
                                                            <asp:Literal ID="room_3" runat="server">Hall</asp:Literal>
                                                        </td>
                                                        <td class="check">
                                                            <input type="checkbox" id="questionRoom_3" />
                                                        </td>
                                                        <td class="check">
                                                            <input type="checkbox" id="suspectRoom_3" />
                                                        </td>
                                                        <td class="check">
                                                            <input type="checkbox" id="notSuspectRoom_3" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="check">
                                                            <asp:Literal ID="room_4" runat="server">Quarto de Hóspedes</asp:Literal>
                                                        </td>
                                                        <td class="check">
                                                            <input type="checkbox" id="questionRoom_4" />
                                                        </td>
                                                        <td class="check">
                                                            <input type="checkbox" id="suspectRoom_4" />
                                                        </td>
                                                        <td class="check">
                                                            <input type="checkbox" id="notSuspectRoom_4" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="check">
                                                            <asp:Literal ID="room_5" runat="server">Quarto</asp:Literal>
                                                        </td>
                                                        <td class="check">
                                                            <input type="checkbox" id="questionRoom_5" />
                                                        </td>
                                                        <td class="check">
                                                            <input type="checkbox" id="suspectRoom_5" />
                                                        </td>
                                                        <td class="check">
                                                            <input type="checkbox" id="notSuspectRoom_5" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="check">
                                                            <asp:Literal ID="room_6" runat="server">Sala de Estar</asp:Literal>
                                                        </td>
                                                        <td class="check">
                                                            <input type="checkbox" id="questionRoom_6" />
                                                        </td>
                                                        <td class="check">
                                                            <input type="checkbox" id="suspectRoom_6" />
                                                        </td>
                                                        <td class="check">
                                                            <input type="checkbox" id="notSuspectRoom_6" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="check">
                                                            <asp:Literal ID="room_7" runat="server">Sala de Estudos</asp:Literal>
                                                        </td>
                                                        <td class="check">
                                                            <input type="checkbox" id="questionRoom_7" />
                                                        </td>
                                                        <td class="check">
                                                            <input type="checkbox" id="suspectRoom_7" />
                                                        </td>
                                                        <td class="check">
                                                            <input type="checkbox" id="notSuspectRoom_7" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="check">
                                                            <asp:Literal ID="room_8" runat="server">Sala de Jantar</asp:Literal>
                                                        </td>
                                                        <td class="check">
                                                            <input type="checkbox" id="questionRoom_8" />
                                                        </td>
                                                        <td class="check">
                                                            <input type="checkbox" id="suspectRoom_8" />
                                                        </td>
                                                        <td class="check">
                                                            <input type="checkbox" id="notSuspectRoom_8" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="check">
                                                            <asp:Literal ID="room_9" runat="server">Salão de Jogos</asp:Literal>
                                                        </td>
                                                        <td class="check">
                                                            <input type="checkbox" id="questionRoom_9" />
                                                        </td>
                                                        <td class="check">
                                                            <input type="checkbox" id="suspectRoom_9" />
                                                        </td>
                                                        <td class="check">
                                                            <input type="checkbox" id="notSuspectRoom_9" />
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div>
                                        <asp:Button ID="btnDice" runat="server" Text="Jogar Dado" OnClick="btnDice_Click" />
                                        <asp:Button ID="btnAcusar" runat="server" Text="Fazer acusação" OnClick="btnAcusar_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br />
                    <div style="clear: both;" align="center">
                        <asp:Literal ID="ltImages" runat="server" Text="" ></asp:Literal>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    </form>
</body>
</html>
