<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User_Login.aspx.cs" Inherits="Detetive.ADM.User_Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login - Detetive (Administração)</title>
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
                <table>
                    <tr>
                        <td align="left">
                            <asp:ValidationSummary ID="valSummary" runat="server" HeaderText="Atenção: verifique os seguintes itens:"
                                ValidationGroup="Login1" DisplayMode="List" CssClass="error" />
                        </td>
                    </tr>
                </table>
                <br />
                <table class="btable" style="width: 410px; text-align: center">
                    <tr>
                        <td class="blc">
                            <div class="header" style="border-bottom-style: none;">
                                Login - Detetive KGB</div>
                            <div class="blkc" style="height: 190px;" align="center">
                                <br />
                                <asp:Login ID="Login1" runat="server" FailureText="Usuário ou senha incorretos.">
                                    <LayoutTemplate>
                                        <table cellspacing="4" cellpadding="4">
                                            <tr>
                                                <td align="right">
                                                    <asp:Label ID="UserNameLabel" runat="server" CssClass="label" AssociatedControlID="UserName">Nome de usuário</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="UserName" runat="server" Width="150px"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                                        ErrorMessage="- O nome do usuário é obrigatório." ToolTip="O nome do usuário é obrigatório."
                                                        ValidationGroup="Login1" CssClass="error">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <asp:Label ID="PasswordLabel" runat="server" CssClass="label" AssociatedControlID="Password">Senha de acesso</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="Password" runat="server" TextMode="Password" Width="150px"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                                        CssClass="error" ErrorMessage="- A senha é obrigatória." ToolTip="A senha é obrigatória."
                                                        ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" colspan="3" style="color: red">
                                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="false"></asp:Literal>
                                                </td>
                                            </tr>
                                            <tr align="center">
                                                <td colspan="3">
                                                    <asp:Button ID="LoginButton" runat="server" CommandName="Login" ValidationGroup="Login1"
                                                        ToolTip="Entrar" Text="Entrar" />
                                                </td>
                                            </tr>
                                            <tr align="center">
                                                <td colspan="3">
                                                    <asp:Button ID="ChangePassword" runat="server" Text="Alterar Senha" OnClick="ChangePassword_Click" />
                                                    <asp:Button ID="ForgetPassword" runat="server" Text="Recuperar Senha" OnClick="ForgetPassword_Click" />
                                                </td>
                                            </tr>
                                        </table>
                                    </LayoutTemplate>
                                </asp:Login>
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
