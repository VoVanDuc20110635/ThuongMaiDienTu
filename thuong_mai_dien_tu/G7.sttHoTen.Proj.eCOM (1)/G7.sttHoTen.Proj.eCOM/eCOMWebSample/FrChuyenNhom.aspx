<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.master" AutoEventWireup="true" CodeFile="FrChuyenNhom.aspx.cs" Inherits="FrChuyenNhom" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
        }
        .auto-style4 {
            width: 53px;
        }
        .auto-style5 {
            width: 488px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style1">
        <tr>
            <td colspan="3">
                <asp:Label ID="lbT" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="Large" ForeColor="Fuchsia" Text="CHUYỂN MẶT HÀNG TỪ NHÓM NÀY SANG NHÓM KHÁC"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">
                <asp:Label ID="lbNhomS" runat="server" Text="Chọn Nhóm nguồn (Source):"></asp:Label>
                <asp:DropDownList ID="DropDownListS" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceNhomS" DataTextField="tennhom" DataValueField="msnhom" OnSelectedIndexChanged="DropDownListS_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceNhomS" runat="server" ConnectionString="<%$ ConnectionStrings:d16thn2nhauonlineConnectionString %>" SelectCommand="SELECT * FROM [NHOMMH]"></asp:SqlDataSource>
            </td>
            <td class="auto-style4">&nbsp;</td>
            <td>
                <asp:Label ID="lbNhomD" runat="server" Text="Chọn Nhómđích (Destination):"></asp:Label>
                <asp:DropDownList ID="DropDownListD" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceNhomD" DataTextField="tennhom" DataValueField="msnhom" OnSelectedIndexChanged="DropDownListS_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceNhomD" runat="server" ConnectionString="<%$ ConnectionStrings:d16thn2nhauonlineConnectionString %>" SelectCommand="SELECT * FROM [NHOMMH]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">
                <asp:Label ID="lbS" runat="server" Text="Danh sách các MH thuộc Nhóm nguồn (Source):"></asp:Label>
            </td>
            <td class="auto-style4">&nbsp;</td>
            <td>
                <asp:Label ID="lbD" runat="server" Text="Danh sách các MH thuộc Nhóm đích (Destination):"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">
                <asp:ListBox ID="ListBoxS" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceMHS" DataTextField="tenmh" DataValueField="msmh"></asp:ListBox>
                <asp:SqlDataSource ID="SqlDataSourceMHS" runat="server" ConnectionString="<%$ ConnectionStrings:d16thn2nhauonlineConnectionString %>" SelectCommand="SELECT * FROM [MH] WHERE ([msnhom] = @msnhom)" UpdateCommand="UPDATE MH SET msnhom = @msnhom WHERE (msmh = @msmh) OR (msnhom = @msnhom_o)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListS" Name="msnhom" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td class="auto-style4">
                <asp:Button ID="btLR" runat="server" OnClick="btLR_Click" Text="&gt;" />
                <br />
                <asp:Button ID="btRL" runat="server" OnClick="btRL_Click" Text="&lt;" />
                <br />
                <asp:Button ID="btRAL" runat="server" OnClick="btRAL_Click" Text="&gt;&gt;" />
                <br />
                <asp:Button ID="btLAR" runat="server" Text="&lt;&lt;" />
            </td>
            <td>
                <asp:ListBox ID="ListBoxD" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceMHD" DataTextField="tenmh" DataValueField="msmh"></asp:ListBox>
                <asp:SqlDataSource ID="SqlDataSourceMHD" runat="server" ConnectionString="<%$ ConnectionStrings:d16thn2nhauonlineConnectionString %>" SelectCommand="SELECT * FROM [MH] WHERE ([msnhom] = @msnhom)" UpdateCommand="UPDATE MH SET msnhom = @msnhom WHERE (msmh = @msmh) OR (msnhom = @msnhom_o)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListD" Name="msnhom" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style3" colspan="2">
                <asp:Button ID="btE" runat="server" OnClick="btE_Click" Text="Về Trang Quản lý" />
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>

