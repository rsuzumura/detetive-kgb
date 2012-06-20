<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true"
    CodeBehind="User_View.aspx.cs" Inherits="Detetive.ADM.User_View" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Detetive - Gerenciamento de Usuários
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        function confirmDelete() {
            return confirm('O registro selecionado será removido. Confirma?');
        }
    </script>
    <h2>
        Usuários</h2>
    <table>
        <tr>
            <td>
                <asp:Button ID="btnNew" runat="server" Text="Novo" OnClick="btnNew_Click" />
            </td>
        </tr>
    </table>
    <asp:GridView ID="grdUsers" runat="server" Width="90%" AutoGenerateColumns="false">
        <RowStyle CssClass="gridrow" />
        <HeaderStyle CssClass="gridheader" />
        <AlternatingRowStyle CssClass="gridalt" />
        <Columns>
            <asp:BoundField DataField="Username" HeaderText="Login" />
            <asp:BoundField DataField="Email" HeaderText="Email" />
            <asp:BoundField DataField="CreationDate" HeaderText="Data de Criação" DataFormatString="{0:dd/MM/yyyy}"
                ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="LastActivityDate" HeaderText="Último Login" DataFormatString="{0:dd/MM/yyyy}"
                ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" />
            <asp:CheckBoxField DataField="IsApproved" HeaderText="Ativo" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-HorizontalAlign="Center" />
            <asp:TemplateField HeaderText="Editar" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:ImageButton ID="imgEdit" runat="server" ImageUrl="~/images/Pen.gif" AlternateText="Editar"
                        OnClick="imgEdit_Click" CommandArgument='<%# Eval("Username") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Excluir" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:ImageButton ID="imgDelete" runat="server" ImageUrl="~/images/icon_recyclebin_16px.gif"
                        OnClick="imgDelete_Click" AlternateText="Excluir" CommandArgument='<%# Eval("Username") %>'
                        OnClientClick="return confirmDelete();" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
