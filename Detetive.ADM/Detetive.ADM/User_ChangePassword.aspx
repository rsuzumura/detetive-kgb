<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User_ChangePassword.aspx.cs" Inherits="Detetive.ADM.User_ChangePassword" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Detetive - Alteração de Senha</title>
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
                                Troca de Senha</div>
                            <div class="blkc" style="height: 190px;" align="center">
                                <br />
                                <br />
                                <table cellspacing="4" cellpadding="4">
                                    <tr>
                                        <td class="label">
                                            Senha Atual:
                                        </td>
                                        <td style="text-align: left; font-weight: bold;">
                                            <asp:TextBox ID="txtPassword" runat="server" Width="200px" TextMode="Password"></asp:TextBox>
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td class="label">
                                            Nova Senha:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtNewPassword" runat="server" Width="200px" TextMode="Password"></asp:TextBox>
                                        </td>
                                        <td><asp:Button ID="cmdChange" runat="server" OnClick="cmdChange_Click" Text="Alterar Senha" /></td>
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
