<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Actor_View.aspx.cs" Inherits="Detetive.ADM.Actor_View" %>
<%@ Import Namespace="System.Data.SqlTypes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Detetive - Gerenciamento de Personagens
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        function confirmDelete() {
            return confirm('O registro selecionado será removido. Confirma?');
        }
    </script>
    <h2>
        Personagens</h2>
    <table>
        <tr>
            <td>
                <asp:Button ID="btnNew" runat="server" Text="Novo" OnClick="btnNew_Click" />
            </td>
        </tr>
    </table>
    <asp:GridView ID="grdActors" runat="server" Width="90%" AutoGenerateColumns="false">
        <RowStyle CssClass="gridrow" />
        <HeaderStyle CssClass="gridheader" />
        <AlternatingRowStyle CssClass="gridalt" />
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Nome do Personagem" />
            <asp:BoundField DataField="Description" HeaderText="Descrição" />
            <asp:TemplateField HeaderText="Status" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:CheckBox ID="chkEnabled" runat="server" Checked='<%# ((SqlBoolean)Eval("Enabled")).Value %>' Enabled="false" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Editar" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:ImageButton ID="imgEdit" runat="server" ImageUrl="~/images/Pen.gif" AlternateText="Editar"
                        OnClick="imgEdit_Click" CommandArgument='<%# Eval("ActorId") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Excluir" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:ImageButton ID="imgDelete" runat="server" ImageUrl="~/images/icon_recyclebin_16px.gif"
                        OnClick="imgDelete_Click" AlternateText="Excluir" CommandArgument='<%# Eval("ActorId") %>'
                        OnClientClick="return confirmDelete();" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
