<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.master" AutoEventWireup="true" CodeFile="Management.aspx.cs" Inherits="Management" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style1">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="Blue" Text="ĐÂY LÀ TRANG QUẢN LÝ"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Font-Bold="True" ForeColor="Blue" Text="1. CÁC CHỨC NĂNG QUẢN LÝ BÊN BÁN"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Quản lý hàng hóa" />
                <asp:Button ID="Button2" runat="server" Text="Quản lý Kho hàng" />
                <asp:Button ID="Button3" runat="server" Text="Quản lý tồn kho" />
                <asp:Button ID="Button4" runat="server" Text="Quản lý nhân viên" />
                <asp:Button ID="Button5" runat="server" Text="Phân công giao hàng" />
                <asp:Button ID="Button6" runat="server" Text="Quản lý chuyên môn" />
                <asp:Button ID="Button8" runat="server" OnClick="Button8_Click" Text="Chuyển Nhóm" />
                <asp:Button ID="Button7" runat="server" Text="Quản lý khu vực giao hàng" />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Font-Bold="True" ForeColor="Blue" Text="1. CÁC CHỨC NĂNG QUẢN LÝ BÊN MUA"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>

