<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.master" AutoEventWireup="true" CodeFile="ProductMan.aspx.cs" Inherits="ProductMan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            width: 301px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <table class="auto-style1">
            <tr>
                <td colspan="2">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="Blue" Text="TRANG QUẢN LÝ HÀNG HÓA"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label2" runat="server" Text="Chọn Nhóm mặt hàng:"></asp:Label>
                    <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSourceNhomMH" DataTextField="tennhom" DataValueField="msnhom" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                        <asp:ListItem Value="*">Tất cả</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceNhomMH" runat="server" ConnectionString="workstation id=d16thn2nhauonline.mssql.somee.com;packet size=4096;user id=ufm16dthn2_SQLLogin_1;pwd=c84um1w4qq;data source=d16thn2nhauonline.mssql.somee.com;persist security info=False;initial catalog=d16thn2nhauonline" SelectCommand="SELECT * FROM [NHOMMH]"></asp:SqlDataSource>
                </td>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="Mã nhóm:"></asp:Label>
                    <asp:Label ID="lbmaNhom" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="Label3" runat="server" Text="Danh sách các mặt hàng thuộc Nhóm:"></asp:Label>
                    <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" OnCheckedChanged="CheckBox1_CheckedChanged" Text="Hiện hình mẫu" />
                &nbsp;<asp:Button ID="btnThemMH" runat="server" OnClick="btnThemMH_Click" Text="Thêm MH mới" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="lbMahang" runat="server" Text="Mã hàng:" Visible="False"></asp:Label>
                    <asp:TextBox ID="txtMahang" runat="server" Visible="False" Width="58px"></asp:TextBox>
&nbsp;<asp:Label ID="lbTenhang" runat="server" Text="Tên hàng:" Visible="False"></asp:Label>
                    <asp:TextBox ID="txtTenhang" runat="server" Visible="False" Width="58px"></asp:TextBox>
&nbsp;<asp:Label ID="lbGia" runat="server" Text="Giá:" Visible="False"></asp:Label>
                    <asp:TextBox ID="txtGia" runat="server" Visible="False" Width="58px"></asp:TextBox>
                    <asp:Label ID="lbD" runat="server" Text="Đ" Visible="False"></asp:Label>
&nbsp;<asp:Label ID="lbDVT" runat="server" Text="ĐVT:" Visible="False"></asp:Label>
                    <asp:TextBox ID="txtDVT" runat="server" Visible="False" Width="58px"></asp:TextBox>
&nbsp;<asp:Label ID="lbMota" runat="server" Text="Mô tả:" Visible="False"></asp:Label>
                    <asp:TextBox ID="txtMota" runat="server" Visible="False" Width="58px"></asp:TextBox>
&nbsp;<asp:Label ID="lbHinh" runat="server" Text="Chọn hình:" Visible="False"></asp:Label>
                    <asp:FileUpload ID="FileUpload1" runat="server" Visible="False" />
                    <asp:Button ID="btnhuy" runat="server" Text="Hủy" Visible="False" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="msmh" DataSourceID="SqlDataSourceMH" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:CommandField SelectText="chọn" ShowSelectButton="True" />
                            <asp:BoundField DataField="msmh" HeaderText="Mã hàng" ReadOnly="True" SortExpression="msmh" />
                            <asp:BoundField DataField="tenmh" HeaderText="Tên hàng" SortExpression="tenmh" />
                            <asp:BoundField DataField="gia" HeaderText="Giá" SortExpression="gia" />
                            <asp:BoundField DataField="dvt" HeaderText="ĐVT" SortExpression="dvt" />
                            <asp:BoundField DataField="mota" HeaderText="Mô tả" SortExpression="mota" />
                            <asp:TemplateField HeaderText="Hình mẫu" SortExpression="hinh" Visible="False">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("hinh") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("hinh") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField CancelText="Hủy" EditText="Sửa" ShowEditButton="True" UpdateText="Cập nhật" />
                            <asp:CommandField DeleteText="Xóa" ShowDeleteButton="True" />
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSourceMH" runat="server" ConnectionString="workstation id=d16thn2nhauonline.mssql.somee.com;packet size=4096;user id=ufm16dthn2_SQLLogin_1;pwd=c84um1w4qq;data source=d16thn2nhauonline.mssql.somee.com;persist security info=False;initial catalog=d16thn2nhauonline" SelectCommand="SELECT * FROM [MH] WHERE ([msnhom] = @msnhom)" DeleteCommand="DELETE FROM MH WHERE (msmh = @msmh)" UpdateCommand="UPDATE MH SET tenmh = @tenmh, gia = @gia, dvt = @dvt, mota = @mota WHERE (msmh = @msmh)" InsertCommand="INSERT INTO MH(msmh, tenmh, gia, dvt, mota, hinh, msnhom) VALUES (@msmh, @tenmh, @gia, @dvt, @mota, @hinh, @msnhom)">
                        <DeleteParameters>
                            <asp:ControlParameter ControlID="GridView1" Name="msmh" PropertyName="SelectedValue" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:ControlParameter ControlID="txtMahang" Name="msmh" PropertyName="Text" />
                            <asp:ControlParameter ControlID="txtTenhang" Name="tenmh" PropertyName="Text" />
                            <asp:ControlParameter ControlID="txtGia" DbType="Double" Name="gia" PropertyName="Text" />
                            <asp:ControlParameter ControlID="txtDVT" Name="dvt" PropertyName="Text" />
                            <asp:ControlParameter ControlID="txtMota" Name="mota" PropertyName="Text" />
                            <asp:ControlParameter ControlID="DropDownList1" Name="msnhom" PropertyName="SelectedValue" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList1" Name="msnhom" PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:ControlParameter ControlID="GridView1" Name="tenmh" PropertyName="SelectedValue[2]" />
                            <asp:ControlParameter ControlID="GridView1" Name="gia" PropertyName="SelectedValue[3]" />
                            <asp:ControlParameter ControlID="GridView1" Name="dvt" PropertyName="SelectedValue[4]" />
                            <asp:ControlParameter ControlID="GridView1" Name="mota" PropertyName="SelectedValue[5]" />
                            <asp:ControlParameter ControlID="GridView1" Name="msmh" PropertyName="SelectedValue" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td colspan="2">&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="GridViewTONKHO" runat="server" AutoGenerateColumns="False" Caption="MH QUÝ VỊ CẦN XÓA CÒN TÔN TRONG CÁC KHO SAU, CẦN PHẢI XỬ LÝ" CellPadding="4" DataKeyNames="mskho,msmh" DataSourceID="SqlDataSourceTONKHO" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="mskho" HeaderText="Mã kho" ReadOnly="True" SortExpression="mskho" />
                            <asp:BoundField DataField="msmh" HeaderText="Mã hàng" ReadOnly="True" SortExpression="msmh" />
                            <asp:BoundField DataField="slton" HeaderText="Số lượng tồn" SortExpression="slton" />
                            <asp:CommandField DeleteText="Thanh lý" ShowDeleteButton="True" />
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSourceTONKHO" runat="server" ConnectionString="workstation id=d16thn2nhauonline.mssql.somee.com;packet size=4096;user id=ufm16dthn2_SQLLogin_1;pwd=c84um1w4qq;data source=d16thn2nhauonline.mssql.somee.com;persist security info=False;initial catalog=d16thn2nhauonline" SelectCommand="SELECT * FROM [TONKHO] WHERE ([msmh] = @msmh)" DeleteCommand="DELETE FROM TONKHO WHERE (mskho = @mskho) AND (msmh = @msmhx)" ProviderName="<%$ ConnectionStrings:16DTHNhauOnlineConnectionString.ProviderName %>">
                        <DeleteParameters>
                            <asp:ControlParameter ControlID="GridViewTONKHO" Name="mskho" PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="GridView1" Name="msmhx" PropertyName="SelectedValue" />
                        </DeleteParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="GridView1" Name="msmh" PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td>
                    <asp:Button ID="btnTLAllTonKho" runat="server" OnClick="btnTLAllTonKho_Click" Text="Thanh lý tất cả" />
                </td>
            </tr>
            <tr>
                <td colspan="2">&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="GridViewCTDDH" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" Caption="MH QUÝ VỊ CẦN XÓA ĐANG ĐƯỢC ĐẶT HÀNG TRONG CÁC ĐƠN HÀNG SAU, CẦN PHẢI XỬ LÝ" CellPadding="3" CellSpacing="1" DataKeyNames="msddh,msmh" DataSourceID="SqlDataSourceCTDDH" GridLines="None">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="msddh" HeaderText="Mã đơn hàng" ReadOnly="True" SortExpression="msddh" />
                            <asp:BoundField DataField="msmh" HeaderText="Mã hàng" ReadOnly="True" SortExpression="msmh" />
                            <asp:BoundField DataField="sl" HeaderText="Số lượng" SortExpression="sl" />
                            <asp:CommandField CancelText="Hủy" EditText="Đổi hàng" ShowEditButton="True" UpdateText="Cập nhật" />
                            <asp:CommandField DeleteText="Từ chối mua" ShowDeleteButton="True" />
                        </Columns>
                        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#594B9C" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#33276A" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSourceCTDDH" runat="server" ConnectionString="workstation id=d16thn2nhauonline.mssql.somee.com;packet size=4096;user id=ufm16dthn2_SQLLogin_1;pwd=c84um1w4qq;data source=d16thn2nhauonline.mssql.somee.com;persist security info=False;initial catalog=d16thn2nhauonline" SelectCommand="SELECT * FROM [CTDDH] WHERE ([msmh] = @msmh)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="GridView1" Name="msmh" PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox2" runat="server" AutoPostBack="True" OnCheckedChanged="CheckBox2_CheckedChanged" Text="Chọn ĐĐH để đổi hàng" />
&nbsp;<asp:DropDownList ID="DropDownListDDH" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceDDH" DataTextField="msddh" DataValueField="msddh" Visible="False">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceDDH" runat="server" ConnectionString="workstation id=d16thn2nhauonline.mssql.somee.com;packet size=4096;user id=ufm16dthn2_SQLLogin_1;pwd=c84um1w4qq;data source=d16thn2nhauonline.mssql.somee.com;persist security info=False;initial catalog=d16thn2nhauonline" SelectCommand="SELECT * FROM [DDH]"></asp:SqlDataSource>
                    <br />
                    <asp:Button ID="btnTCAllDDH" runat="server" Text="Từ chối tất cả các Đơn hàng" />
                </td>
            </tr>
        </table>
    </p>
</asp:Content>

