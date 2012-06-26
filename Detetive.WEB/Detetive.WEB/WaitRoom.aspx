<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WaitRoom.aspx.cs" Inherits="Detetive.WEB.WaitRoom" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="Stylesheet" type="text/css" href="Styles/master.css" />
    <script type="text/javascript" src="Scripts/jquery-1.4.1.js"></script>
    <script type="text/javascript" src="Scripts/jquery.msgBox.js"></script>
    <link rel="Stylesheet" type="text/css" href="Styles/msgBoxLight.css" />
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanelTable" runat="server">
        <ContentTemplate>
            <asp:Timer ID="timerUpdate" runat="server" Interval="10000" OnTick="timerUpdate_Tick">
            </asp:Timer>
            <asp:HiddenField ID="hdnEvent" runat="server" Value="" />
            <div align="center">
                <div id="page">
                    <div id="header">
                        <div id="title">
                        </div>
                        <table cellpadding="0" cellspacing="0" style="width: 100%;">
                            <tr>
                                <td style="width: 100px;">
                                    &nbsp;
                                </td>
                                <td>
                                    <div id="logindisplay">
                                        Bem vindo,
                                        <%: Page.User.Identity.Name %>!&nbsp;&nbsp;
                                    </div>
                                </td>
                                <td style="width: 100px;">
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br />
                    <div>
                        <table>
                            <tr>
                                <td class="label">
                                    Selecione o seu personagem:
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlActors" runat="server" DataTextField="Name" DataValueField="ActorId"
                                        AutoPostBack="true" OnSelectedIndexChanged="ddlActors_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Image ID="imgPhoto" runat="server" Width="150px" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:HiddenField ID="hdnUpdate" runat="server" Value="0" />
                                    <asp:Button ID="btnSelect" runat="server" Text="SELECIONAR" CssClass="btn" Width="150px" OnClick="btnSelect_Click" />
                                    <asp:LinkButton ID="LinkButton1" runat="server"></asp:LinkButton>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Button ID="btnExitRoom" runat="server" Text="SAIR DA SALA" CssClass="btn" Width="150px" OnClick="btnExitRoom_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Button ID="btnBeginGame" runat="server" Text="INICIAR JOGO" CssClass="btn" Width="150px" OnClick="btnBeginGame_Click" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    </form>
</body>
</html>
