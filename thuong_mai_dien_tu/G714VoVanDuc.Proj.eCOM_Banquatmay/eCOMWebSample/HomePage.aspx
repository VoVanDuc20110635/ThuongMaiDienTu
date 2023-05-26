<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.master" AutoEventWireup="true" CodeFile="HomePage.aspx.cs" Inherits="HomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
    <asp:Label ID="lbTitle" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="Large" ForeColor="Fuchsia" Text="ĐÂY LÀ TIỆM NHẬU TRỰC TUYẾN DO 16DTH LÀM CHỦ. NHẬU DZO, NHẬU DZO !"></asp:Label>
</p>
    <p>
        <asp:Label ID="lbKQ" runat="server" Font-Bold="True" ForeColor="Blue"></asp:Label>
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Xem &quot;Bàn nhậu&quot;" />
</p>
<p>
    <asp:DataList ID="DataListMH" runat="server" DataKeyField="msmh" DataSourceID="SqlDataSourceMH" RepeatColumns="3" OnItemCommand="DataListMH_ItemCommand">
        <ItemTemplate>
            Mã hàng:
            <asp:Label ID="msmhLabel" runat="server" Text='<%# Eval("msmh") %>' />
            <br />
            Tên hàng:
            <asp:Label ID="tenmhLabel" runat="server" Text='<%# Eval("tenmh") %>' />
            <br />
            Gia:
            <asp:Label ID="giaLabel" runat="server" Text='<%# Eval("gia") %>' />
            &nbsp;đ /
            <asp:Label ID="dvtLabel" runat="server" Text='<%# Eval("dvt") %>' />
            <br />
            Mô tả:
            <asp:Label ID="motaLabel" runat="server" Text='<%# Eval("mota") %>' />
            <br />
            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("hinh") %>' />
            <br />
            Số lượng:<asp:TextBox ID="TextBox1" runat="server" Height="19px" Width="24px">1</asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="Mang lên bàn &quot;nhậu&quot;" CommandName="chon" />
<br />
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSourceMH" runat="server" ConnectionString="<%$ ConnectionStrings:16DTHNhauOnlineConnectionString %>" SelectCommand="SELECT * FROM [MH]" ProviderName="<%$ ConnectionStrings:16DTHNhauOnlineConnectionString.ProviderName %>"></asp:SqlDataSource>
</p>
</asp:Content>

