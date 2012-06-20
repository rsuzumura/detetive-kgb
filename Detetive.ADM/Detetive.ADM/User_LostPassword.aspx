<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User_LostPassword.aspx.cs"
    Inherits="Detetive.ADM.User_LostPassword" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Detetive - Recuperação de Senha</title>
    <link rel="Stylesheet" type="text/css" href="Styles/login.css" />
    <script type="text/javascript" src="Scripts/jquery-1.4.1.js"></script>
    <script type="text/javascript" src="Scripts/jquery.msgBox.js"></script>
    <link rel="Stylesheet" type="text/css" href="Styles/msgBoxLight.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div align="center">
        <div id="page" align="center">
            <div style="height: 200px;">
                <br />
            </div>
            <div>
                <table class="btable" style="width: 410px; text-align: center">
                    <tr>
                        <td class="blc">
                            <div class="header" style="border-bottom-style: none;">
                                Recuperação de senha</div>
                            <div class="blkc" style="height: 190px;" align="center">
                                <br />
                                <br />
                                <table cellspacing="4" cellpadding="4">
                                    <tr>
                                        <td colspan="3"><asp:Label ID="lblMensagem" runat="server" Font-Bold="True" Font-Size="11pt"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td class="label">
                                            Pergunta:
                                        </td>
                                        <td style="text-align: left; font-weight: bold;">
                                            <asp:Label ID="lblPergunta" runat="server"></asp:Label>
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td class="label">
                                            Resposta:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtResposta" runat="server" Width="200px"></asp:TextBox>
                                        </td>
                                        <td><asp:Button ID="cmdRecuperar" runat="server" OnClick="cmdRecuperar_Click" Text="Recuperar Senha" /></td>
                                    </tr>
                                    <tr align="center">
                                        <td class="label" colspan="2">
                                            <asp:Label ID="lblSenha" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr align="center">
                                        <td colspan="3">
                                            <asp:HyperLink ID="lnkLogin" runat="server" Font-Bold="true" NavigateUrl="User_Login.aspx">Retornar para o Login</asp:HyperLink>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
