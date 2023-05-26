<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.master" AutoEventWireup="true" CodeFile="Order.aspx.cs" Inherits="Order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style1">
        <tr>
            <td>
                <asp:Label ID="lbTitle" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="Large" ForeColor="#CC0099" Text="TRANG THÔNG TIN ĐẶT HÀNG"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="lbTKH" runat="server" Font-Bold="True" ForeColor="Blue" Text="1. THÔNG TIN KHÁCH HÀNG"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbTim" runat="server" Text="Nhập Mã hoặc Họ tên hoặc Số điện thoại hoặc địa chỉ: "></asp:Label>
                <asp:TextBox ID="txtTim" runat="server"></asp:TextBox>
                <asp:Button ID="btnTim" runat="server" OnClick="btnTim_Click" Text="Tìm KH" />
                <asp:Button ID="btnHuy" runat="server" OnClick="btnHuy_Click" Text="Hủy" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbKHnew" runat="server" ForeColor="Blue" Text="NHẬP THÔNG TIN KHÁCH HÀNG MỚI:" Visible="False"></asp:Label>
                <br />
                <asp:Label ID="lbMaKH" runat="server" Text="Mã KH:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtMaKH" runat="server" Visible="False" Width="70px"></asp:TextBox>
                <asp:Label ID="lbHoTenKH" runat="server" Text="Họ tên:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtHoTenKH" runat="server" Visible="False" Width="160px" charshet="utf-8"></asp:TextBox>
                <asp:Label ID="lbDC" runat="server" Text="Địa chỉ:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtDC" runat="server" Visible="False" Width="181px" charshet="utf-8"></asp:TextBox>
                <asp:Label ID="lbSoDT" runat="server" Text="Số ĐT:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtSoDT" runat="server" Visible="False" Width="70px"></asp:TextBox>
                <asp:GridView ID="GridViewKH" runat="server" AutoGenerateColumns="False" Caption="CHỌN KHÁCH HÀNG" CellPadding="4" DataKeyNames="mskh" DataSourceID="SqlDataSourceKH" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridViewKH_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField SelectText="chọn" ShowSelectButton="True" />
                        <asp:BoundField DataField="mskh" HeaderText="Mã KH" ReadOnly="True" SortExpression="mskh" />
                        <asp:BoundField DataField="tenkh" HeaderText="Họ tên" SortExpression="tenkh" />
                        <asp:BoundField DataField="dc" HeaderText="Địa chỉ" SortExpression="dc" />
                        <asp:BoundField DataField="soll" HeaderText="Số ĐT" SortExpression="soll" />
                        <asp:BoundField DataField="diem" HeaderText="Điểm" SortExpression="diem" />
                    </Columns>
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSourceKH" runat="server" ConnectionString="<%$ ConnectionStrings:16DTHNhauOnlineConnectionString %>" InsertCommand="INSERT INTO KH(mskh, tenkh, dc, soll, diem) VALUES (@mskh, @tenkh, @dc, @soll, @diem)" SelectCommand="SELECT mskh, tenkh, dc, soll, diem FROM KH WHERE (mskh = @mskh) OR (tenkh = @tenkh) OR (dc = @dc) OR (soll = @soll)">
                    <InsertParameters>
                        <asp:ControlParameter ControlID="txtMaKH" Name="mskh" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtHoTenKH" Name="tenkh" PropertyName="Text" DbType="String" />
                        <asp:ControlParameter ControlID="txtDC" Name="dc" PropertyName="Text" DbType="String" />
                        <asp:ControlParameter ControlID="txtSoDT" Name="soll" PropertyName="Text" />
                        <asp:Parameter DefaultValue="0" Name="diem" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtTim" Name="mskh" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtTim" Name="tenkh" PropertyName="Text" DbType="String" />
                        <asp:ControlParameter ControlID="txtTim" Name="dc" PropertyName="Text" DbType="String" />
                        <asp:ControlParameter ControlID="txtTim" Name="soll" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbDDH" runat="server" Font-Bold="True" ForeColor="Blue" Text="2. THÔNG TIN ĐƠN HÀNG" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbtbMSDDH" runat="server" Text="Mã đơn hàng:" Visible="False"></asp:Label>
                <asp:Label ID="lbMSDDH" runat="server" Font-Bold="True" ForeColor="Blue" Visible="False"></asp:Label>
&nbsp;
                <asp:Label ID="lbtbDate" runat="server" Text="Ngày lập:" Visible="False"></asp:Label>
                <asp:Label ID="lbDate" runat="server" Font-Bold="True" ForeColor="Blue" Visible="False"></asp:Label>
&nbsp;<asp:Label ID="lbtbShipDate" runat="server" Text="Thời hạn giao hàng:" Visible="False"></asp:Label>
                <asp:Label ID="lbShipDate" runat="server" Font-Bold="True" ForeColor="Blue" Visible="False"></asp:Label>
                <asp:Button ID="btnDeadLine" runat="server" OnClick="btnDeadLine_Click" Text="Chọn hạn giao hàng" Visible="False" />
                <asp:Calendar ID="CalendarDeadline" runat="server" BackColor="White" BorderColor="#999999" Caption="CHỌN HẠN GIAO HÀNG" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" OnSelectionChanged="CalendarDeadline_SelectionChanged" ToolTip="Chọn hạn giao hàng là bằng hoặc SAU ngày đặt hàng" Visible="False" Width="200px">
                    <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                    <NextPrevStyle VerticalAlign="Bottom" />
                    <OtherMonthDayStyle ForeColor="#808080" />
                    <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                    <SelectorStyle BackColor="#CCCCCC" />
                    <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                    <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <WeekendDayStyle BackColor="#FFFFCC" />
                </asp:Calendar>
                <asp:Label ID="lbtbNguoiNhan" runat="server" Text="Người nhận hàng:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtNguoiNhan" runat="server" Visible="False" charshet="utf-8"></asp:TextBox>
            &nbsp;
                <asp:Label ID="lbtbDiaChiGiao" runat="server" Text="Địa chỉ giao hàng:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtDCGiao" runat="server" Visible="False" Width="145px" charshet="utf-8"></asp:TextBox>
            &nbsp;
                <asp:Label ID="lbtbSoDTGiao" runat="server" Text="Số ĐT nhận hàng:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtSoDTGiao" runat="server" Visible="False"></asp:TextBox>
            &nbsp;
                <asp:Label ID="lbtbghiChu" runat="server" Text="Ghi chú nhận hàng:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtGhiChu" runat="server" Visible="False" charshet="utf-8"></asp:TextBox>
            &nbsp;
                <asp:Button ID="btnAccept" runat="server" Text="Đồng ý" Visible="False" Font-Bold="True" Font-Size="Large" ForeColor="#FF33CC" OnClick="btnAccept_Click" />
                <asp:SqlDataSource ID="SqlDataSourceDDH" runat="server" ConnectionString="<%$ ConnectionStrings:16DTHNhauOnlineConnectionString %>" InsertCommand="INSERT INTO DDH(msddh, ngaylap, thoihan, mskh, nguoinhan, dcgiao, sollnhan, ghichu) VALUES (@msddh, @ngaylap, @thoihan, @mskh, @nguoinhan, @dcgiao, @sollnhan, @ghichu)">
                    <InsertParameters>
                        <asp:ControlParameter ControlID="lbMSDDH" Name="msddh" PropertyName="Text" />
                        <asp:ControlParameter ControlID="lbDate" DbType="Date" Name="ngaylap" PropertyName="Text" />
                        <asp:ControlParameter ControlID="lbShipDate" DbType="Date" Name="thoihan" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtTim" Name="mskh" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtNguoiNhan" Name="nguoinhan" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtDCGiao" Name="dcgiao" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtSoDTGiao" Name="sollnhan" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtGhiChu" Name="ghichu" PropertyName="Text" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbCTDDH" runat="server" Font-Bold="True" ForeColor="Blue" Text="3. THÔNG TIN GIỎ HÀNG" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridViewCTDDH" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Visible="False">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="msmh" HeaderText="Mã hàng" />
                        <asp:BoundField DataField="tenmh" HeaderText="Tên hàng" />
                        <asp:BoundField DataField="sl" HeaderText="Số lượng" />
                        <asp:BoundField DataField="dvt" HeaderText="ĐVT" />
                        <asp:BoundField DataField="gia" HeaderText="Giá" />
                        <asp:BoundField DataField="tien" HeaderText="Thành tiền" />
                    </Columns>
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbSUM" runat="server" Font-Bold="True" Visible="False"></asp:Label>
                <asp:SqlDataSource ID="SqlDataSourceCTDDH" runat="server" ConnectionString="<%$ ConnectionStrings:16DTHNhauOnlineConnectionString %>" InsertCommand="INSERT INTO CTDDH(msddh, msmh, sl) VALUES (@msddh, @msmh, @sl)"></asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

