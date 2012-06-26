<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="Rooms.aspx.cs" Inherits="Detetive.WEB.Rooms" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanelRooms" runat="server">
        <ContentTemplate>
            <asp:Timer ID="TimerUpdate" runat="server" Interval="5000" OnTick="TimerUpdate_Tick">
            </asp:Timer>
            <div>
                <table cellspacing="20">
                    <tr>
                        <td class="room">
                            JOGADORES:&nbsp;<asp:Literal ID="ltPlayers_1" runat="server"></asp:Literal>
                            <br />
                            <br />
                            <asp:Literal ID="ltStartedGame1" runat="server">JOGO NÃO INICIADO!</asp:Literal>
                            <br />
                            <asp:Button ID="btnEnter1" runat="server" Text="PARTICIPAR" class="btn" OnClick="btnEnter_Click"
                                CommandArgument="1" />
                        </td>
                        <td class="room">
                            JOGADORES:&nbsp;<asp:Literal ID="ltPlayers_2" runat="server"></asp:Literal>
                            <br />
                            <br />
                            <asp:Literal ID="ltStartedGame2" runat="server">JOGO NÃO INICIADO!</asp:Literal>
                            <br />
                            <asp:Button ID="btnEnter2" runat="server" Text="PARTICIPAR" class="btn" OnClick="btnEnter_Click"
                                CommandArgument="2" />
                        </td>
                        <td class="room">
                            JOGADORES:&nbsp;<asp:Literal ID="ltPlayers_3" runat="server"></asp:Literal>
                            <br />
                            <br />
                            <asp:Literal ID="ltStartedGame3" runat="server">JOGO NÃO INICIADO!</asp:Literal>
                            <br />
                            <asp:Button ID="btnEnter3" runat="server" Text="PARTICIPAR" class="btn" OnClick="btnEnter_Click"
                                CommandArgument="3" />
                        </td>
                    </tr>
                </table>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
