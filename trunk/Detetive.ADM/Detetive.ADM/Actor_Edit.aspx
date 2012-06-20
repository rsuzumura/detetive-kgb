<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Actor_Edit.aspx.cs" Inherits="Detetive.ADM.Actor_Edit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Detetive - Cadastro de Personagem
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        function changeColor(obj) {
            var selected = obj.options[obj.selectedIndex].value;
            $("#" + obj.id).removeClass();
            switch (selected) {
                case "91":
                    $("#" + obj.id).addClass("pink");
                    break;
                case "92":
                    $("#" + obj.id).addClass("blue");
                    break;
                case "93":
                    $("#" + obj.id).addClass("white");
                    break;
                case "94":
                    $("#" + obj.id).addClass("yellow");
                    break;
                case "95":
                    $("#" + obj.id).addClass("purple");
                    break;
                case "96":
                    $("#" + obj.id).addClass("green");
                    break;
            }
        }
    </script>
    <h2>
        Cadastro da Personagem</h2>
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
            <td class="label" style="text-align: right; ">
                <asp:RequiredFieldValidator ID="rfvName" runat="server" Text="*" CssClass="error"
                    ErrorMessage="- O nome do personagem é obrigatório." ControlToValidate="txtName"></asp:RequiredFieldValidator>
                Nome do Personagem:&nbsp;&nbsp;
            </td>
            <td>
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td class="label" style="text-align: right; ">Cor:&nbsp;&nbsp;</td>
            <td>
                <asp:DropDownList ID="ddlColor" runat="server" onchange="changeColor(this);">
                    <asp:ListItem Text="Rosa" Value="91"></asp:ListItem>
                    <asp:ListItem Text="Azul" Value="92"></asp:ListItem>
                    <asp:ListItem Text="Branco" Value="93"></asp:ListItem>
                    <asp:ListItem Text="Amarelo" Value="94"></asp:ListItem>
                    <asp:ListItem Text="Roxo" Value="95"></asp:ListItem>
                    <asp:ListItem Text="Verde" Value="96"></asp:ListItem>
                </asp:DropDownList>
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
