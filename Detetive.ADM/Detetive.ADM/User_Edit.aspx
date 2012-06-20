<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="User_Edit.aspx.cs" Inherits="Detetive.ADM.User_Edit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Detetive - Cadastro do Usuário
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        function confirmReset() {
            return confirm('A senha será resetada. Confirma?');
        }
    </script>
    <h2>Cadastro de Usuários</h2>
        <table>
            <tr>
                <td>
                    <asp:Button ID="btnSave" runat="server" Text="Gravar" onclick="btnSave_Click" />
                    <asp:Button ID="btnReset" runat="server" Text="Reiniciar a Senha" CausesValidation="false"
                        OnClick="btnReset_Click" Enabled="false" OnClientClick="return confirmReset();" />
                    <asp:Button ID="btnBack" runat="server" Text="Voltar" CausesValidation="false" OnClick="btnBack_Click" />
                </td>
            </tr>
        </table>
        <table width="80%">
            <colgroup>
                <col width="20%" />
                <col width="80%" />
            </colgroup>
            <tr>
                <td colspan="2" align="center">
                    <table width="300px">
                        <tr>
                            <td align="left">
                                <asp:ValidationSummary ID="validationResume" runat="server" DisplayMode="List" HeaderText="Atenção: verifique os seguintes itens:" CssClass="error" />
                            </td>
                        </tr>
                    </table>                    
                </td>
            </tr>
            <tr>
                <td class="label" style="text-align: right;">
                    <asp:RequiredFieldValidator ID="rfvUsername" runat="server" Text="*" ErrorMessage="- O Usuário é obrigatório."
                        ControlToValidate="txtUsername" CssClass="error"></asp:RequiredFieldValidator>
                    Usuário:&nbsp;&nbsp;
                </td>
                <td>
                    <asp:TextBox ID="txtUsername" runat="server" Width="80%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="label" style="text-align: right;">
                    <asp:RequiredFieldValidator ID="rfvMail" runat="server" Text="*" ErrorMessage="- O Email é obrigatório."
                        ControlToValidate="txtMail" CssClass="error"></asp:RequiredFieldValidator>
                    Email:&nbsp;&nbsp;
                </td>
                <td>
                    <asp:TextBox ID="txtMail" runat="server" Width="80%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="label" style="text-align: right;">Observações:&nbsp;&nbsp;</td>
                <td><asp:TextBox ID="txtNotes" runat="server" Width="80%"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="label" style="text-align: right;">Ativo:&nbsp;&nbsp;</td>
                <td><asp:CheckBox ID="chkApproved" runat="server" /></td>
            </tr>
        </table>
</asp:Content>
