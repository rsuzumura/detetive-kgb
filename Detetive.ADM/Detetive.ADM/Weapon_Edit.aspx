<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Weapon_Edit.aspx.cs" Inherits="Detetive.ADM.Weapon_Edit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Detetive - Cadastro da Arma
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>
        Cadastro da Arma</h2>
    <table>
        <tr>
            <td>
                <asp:Button ID="btnSave" runat="server" Text="Gravar" OnClick="btnSave_Click" />
                <asp:Button ID="btnBack" runat="server" Text="Voltar" CausesValidation="false" OnClick="btnBack_Click" />
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td align="left">
                <asp:ValidationSummary ID="valSummary" runat="server" HeaderText="Atenção: verifique os seguintes itens:"
                    DisplayMode="List" CssClass="error" />
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td class="label" style="text-align: right;">
                <asp:RequiredFieldValidator ID="rfvName" runat="server" Text="*" ErrorMessage="- O Nome da arma é obrigatório."
                    ControlToValidate="txtName" CssClass="error"></asp:RequiredFieldValidator>
                Nome da Arma:&nbsp;&nbsp;
            </td>
            <td>
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            </td>
            <td class="label" style="text-align: center;">
                Imagem Atual
            </td>
        </tr>
        <tr valign="top">
            <td class="label" style="text-align: right; ">
                Descrição:&nbsp;&nbsp;
            </td>
            <td>
                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine"></asp:TextBox>
                <br />
                <table>
                    <tr>
                        <td>
                            Ativo
                        </td>
                        <td>
                            <asp:CheckBox ID="chkEnabled" runat="server" />
                        </td>
                    </tr>
                </table>
            </td>
            <td align="center">
                <asp:Image ID="imgPhoto" runat="server" Width="150px" />
                <br />
                <div align="center">
                    <asp:FileUpload ID="fileUploadImage" runat="server" />
                </div>
            </td>
        </tr>
    </table>
</asp:Content>
