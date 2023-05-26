<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
    <asp:Label ID="lbTittle" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Fuchsia"></asp:Label>
        <asp:Button ID="ButtonOrder" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="Large" ForeColor="Fuchsia" OnClick="ButtonOrder_Click" Text="Đặt hàng" />
</p>
<p>
    <asp:GridView ID="GridView1" runat="server">
    </asp:GridView>
</p>
<p>
    <asp:Label ID="lbKQ" runat="server" Font-Bold="True" ForeColor="Blue"></asp:Label>
</p>
</asp:Content>

