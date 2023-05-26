using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Order : System.Web.UI.Page
{
    //Biến toàn cục lưu thông tin "Giỏ hàng" phải khai báo tĩnh : static
    static DataTable tbl = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    
    //1. KHÁCH HÀNG
    protected void btnTim_Click(object sender, EventArgs e)
    {// 1.TÌM KH + 2.NHẬP KH MỚI + 3.LUU THÔNG TIN KH MỚI VỪA NHẬP + 4. CHỌN KH
        if (btnTim.Text == "Tìm KH")// [1] TÌM KHÁCH HÀNG
        {
            GridViewKH.DataBind(); // Tải KQ tìm 
            if(GridViewKH.Rows.Count<=0) // Không tìm thấy KH nào
            {
                btnTim.Text = "Nhập KH mới";
            }
        }
        else if(btnTim.Text == "Nhập KH mới") // [2] NHẬP KH MỚI
        {
            //1. Hiển thị các ô nhập thông tin KH mới
            lbKHnew.Visible = true;
            lbMaKH.Visible = true;
            lbHoTenKH.Visible = true;
            lbDC.Visible = true;
            lbSoDT.Visible = true;
            txtMaKH.Visible = true;
            txtHoTenKH.Visible = true;
            txtDC.Visible = true;
            txtSoDT.Visible = true;
            //2. Xóa trống các ô textbox để chuẩn bị nhập KH mới
            txtMaKH.Text ="";
            txtHoTenKH.Text = "";
            txtDC.Text = "";
            txtSoDT.Text = "";
            //3. Đổi nhãn nút lệnh: "Lưu thông tin KH"
            btnTim.Text = "Lưu thông tin KH";
        }
        else if(btnTim.Text == "Lưu thông tin KH")// [3] LƯU THÔNG TIN KH MỚI VỪA NHẬP
        {
            //1. Lưu thông tin KH mới đã nhập vào DB
            SqlDataSourceKH.Insert();
            //2. Tải KH vừa nhập mới lên 
            txtTim.Text = txtMaKH.Text; // Gán MSKH mới vào ô textbox "Tìm"
            GridViewKH.DataBind();
            //3. Ẩn các ô nhập thông tin KH mới            
            lbKHnew.Visible = false;
            lbMaKH.Visible = false;
            lbHoTenKH.Visible = false;
            lbDC.Visible = false;
            lbSoDT.Visible = false;
            txtMaKH.Visible = false;
            txtHoTenKH.Visible = false;
            txtDC.Visible = false;
            txtSoDT.Visible = false;

            //4. Đổi nhãn nút lệnh: "Chọn KH" và tự động chọn 
            btnTim.Text = "Chọn KH";
            btnTim.Enabled = false; // không cho "chọn" lại
        }
        else if(btnTim.Text == "Chọn KH") // [4] CHỌN KH TRONG GRIDVIEW TÌM THẤY (TẠI VỊ TRÍ vt ĐÃ CHỌN TRÊN GIRDVIEW)
        {       //1. Gán mã KH vào Ô TextBox tìm
                txtTim.Text = GridViewKH.Rows[vt].Cells[1].Text.Trim();//Gán MSKH đã chọn vào ô textbox "Tìm"
                txtMaKH.Text = GridViewKH.Rows[vt].Cells[1].Text.Trim();//Gán MSKH đã chọn vào ô textbox mã KH
                txtHoTenKH.Text = GridViewKH.Rows[vt].Cells[2].Text.Trim();//Gán HoTenKH đã chọn vào ô textbox "Nhập tên KH mới "
                txtDC.Text = GridViewKH.Rows[vt].Cells[3].Text.Trim();//Gán Đia chỉ KH đã chọn vào ô textbox "Nhập ĐC KH mới "
                txtSoDT.Text = GridViewKH.Rows[vt].Cells[4].Text.Trim();//Gán So ĐT KH đã chọn vào ô textbox "Nhập So ĐT KH mới "

                GridViewKH.DataBind();

                //2. Không cho chọn lại
                btnTim.Enabled = false; // không cho "chọn" lại
               //3. Hiển thị thông tin Đơn hàng
                DateTime t = System.DateTime.Now;
                lbDDH.Visible = true;
                lbtbMSDDH.Visible = true;
                lbtbDate.Visible = true;
                lbtbShipDate.Visible = true;
                lbtbNguoiNhan.Visible = true;
                lbtbDiaChiGiao.Visible = true;
                lbtbSoDTGiao.Visible = true;
                lbtbghiChu.Visible = true;
                btnAccept.Visible = true;

                //msddh
                lbMSDDH.Text = txtTim.Text.Trim() + t.Year.ToString().Substring(2, 2) + t.Month.ToString().Trim() + t.Day.ToString().Trim() + t.Hour.ToString().Trim() + t.Minute.ToString().Trim() + t.Second.ToString().Trim(); // Cùng 1 KH đặt 2 đơn hàng phải cách nhau ít nhất 1 s
                lbMSDDH.Visible = true;
                //ngaylap
                lbDate.Text = t.ToShortDateString();
                lbDate.Visible = true;
                //han giao hàng
                lbShipDate.Text = lbDate.Text; // Mặc định hạn giao hàng là ngày đặt hàng [Giao trong ngày]
                lbShipDate.Visible = true;
                btnDeadLine.Visible = true; // KH có thể chọn lại hạn giao hàng
                                            //người nhận hàng
                txtNguoiNhan.Text = txtHoTenKH.Text; //Mặc định Người nhận là KH
                txtNguoiNhan.Visible = true;
                //địa chỉ giao hàng
                txtDCGiao.Text = txtDC.Text; // Mặc định địa chỉ giao hàng chính là địa chỉ của KH; nếu người người nhận hàng KHÁc người mua thì KH nhập lại vào ô này
                txtDCGiao.Visible = true;
                //So ĐT giao hàng
                txtSoDTGiao.Text = txtSoDT.Text; // Mặc định Số ĐT giao hàng chính là Số ĐT của KH; nếu người người nhận hàng KHÁc người mua thì KH nhập lại vào ô này
                txtSoDTGiao.Visible = true;
                //Ghi chú về giao hàng
                txtGhiChu.Visible = true;
            //4. Hiển thị thông tin GIỎ hàng
                //B1: LẤY GIỎ HÀNG TỪ Session XUỐNG
                tbl = Session["giohang"] as DataTable;
                //B2: GÁN GIỎ HÀNG VÀO GridView :  QUANG TRỌNG NHẤT
                GridViewCTDDH.DataSource = tbl;
                //B3: TẢI DỮ LIỆU TỪ tbl LÊN GridView
                GridViewCTDDH.DataBind();
                //B4: TÍNH TOÁN: SỐ LƯỢNG MÓN + TỔNG TIỀN
                lbSUM.Text = "BÀN NHẬU HIỆN CÓ : " + tbl.Compute("Count(msmh)", "").ToString() + " MÓN, TỔNG TIỀN = " + tbl.Compute("Sum(tien)", "").ToString() + " Đồng";
                lbCTDDH.Visible = true;
                lbSUM.Visible = true;
                GridViewCTDDH.Visible = true;
        }
    }

    static int vt = 0; //BIẾN TOÀN CỤC: LƯU VỊ TRÍ ĐÃ CHỌN / GRIDVIEW DS KH TÌM THẤY
    
    // GHI NHẬN VỊ TRÍ KH vt ĐÃ CHỌN TRÊN GRIDVIEW DS KH TÌM THẤY
    protected void GridViewKH_SelectedIndexChanged(object sender, EventArgs e)
    {
        vt = GridViewKH.SelectedIndex; // Giữ vị trí đã chọn
        btnTim.Text = "Chọn KH";
    }

    // HỦY : TÌM hoặc NHẬP KH MỚI
    protected void btnHuy_Click(object sender, EventArgs e)
    {
        //1. Cho "Tìm lại"
        btnTim.Enabled = true;
        btnTim.Text = "Tìm KH";
        //2. Ẩn các ô nhập thông tin KH mới            
        lbKHnew.Visible = false;
        lbMaKH.Visible = false;
        lbHoTenKH.Visible = false;
        lbDC.Visible = false;
        lbSoDT.Visible = false;
        txtMaKH.Visible = false;
        txtHoTenKH.Visible = false;
        txtDC.Visible = false;
        txtSoDT.Visible = false;
        //3. Xóa trống TextBox nhập thông tin tim, để nhập lại
        txtTim.Text = "";
        //4. Nạp lại (trống) GridView ds KH
        GridViewKH.DataBind();
        //5. Ẩn nút "Chấp nhận ĐĐH"
        btnAccept.Visible = false;
        //6. Hủy thông tin Mã số ĐĐH        
        lbDDH.Visible = false;
        lbtbMSDDH.Visible = false;
        lbtbDate.Visible = false;
        lbtbShipDate.Visible = false;
        lbtbNguoiNhan.Visible = false;
        lbtbDiaChiGiao.Visible = false;
        lbtbSoDTGiao.Visible = false;
        lbtbghiChu.Visible = false;
        //msddh
        lbMSDDH.Text = ""; // Huy msddhs
        lbMSDDH.Visible = false;
        //ngaylap        
        lbDate.Visible = false;
        //han giao hàng        
        lbShipDate.Visible = false;
        btnDeadLine.Visible = false; // KH có thể chọn lại hạn giao hàng
        //người nhận hàng        
        txtNguoiNhan.Visible = false;
        CalendarDeadline.Visible = false;
        //địa chỉ giao hàng
        txtDCGiao.Text = ""; 
        txtDCGiao.Visible = false;
        //So ĐT giao hàng
        txtSoDTGiao.Text = "";
        txtSoDTGiao.Visible = false;
        //Ghi chú về giao hàng
        txtGhiChu.Visible = false;
        //7. Hủy thông tin CTĐĐH = GH        
        lbCTDDH.Visible = false;
        lbSUM.Visible = false;
        GridViewCTDDH.Visible = false;
    }

    //CHỌN LẠI THỜI HẠN GIAO HÀNG
    protected void btnDeadLine_Click(object sender, EventArgs e)
    {
        //if (btnDeadLine.Text == "Chọn hạn giao hàng")
        //{
            CalendarDeadline.Visible = true; //lịch chọn
            CalendarDeadline.SelectedDate = DateTime.Parse(lbShipDate.Text.Trim()); //mặc định lịch là ngày đã có sẵn trên lbdeadline
        //    btnDeadLine.Text = "Đồng ý Chọn thời hạn giao";
        //}
    }
    //CHẤP NHẬN CHỌN NGÀY THỜI HÀN GIAO HÀNG
    protected void CalendarDeadline_SelectionChanged(object sender, EventArgs e)
    {
        lbShipDate.Text = CalendarDeadline.SelectedDate.ToShortDateString();//gán ngày đã chọn vào lbShipDate
        CalendarDeadline.Visible = false; //Ẩn lịch
    }
    //ĐỒNG Ý ĐẶT HÀNG 
    protected void btnAccept_Click(object sender, EventArgs e)
    {//1. Khóa ALL các nút lệnh (không làm gì thêm)
        txtTim.Enabled = false;
        btnTim.Enabled = false;
        btnHuy.Enabled = false;
        btnDeadLine.Enabled = false;
        btnAccept.Enabled = false;
        //2. LƯU DDH vào DB
        SqlDataSourceDDH.Insert();
        //3. LƯU CTDDH vào DB
        foreach(DataRow r in tbl.Rows)
        {
            SqlDataSourceCTDDH.InsertParameters.Clear();
            SqlDataSourceCTDDH.InsertParameters.Add("msddh", lbMSDDH.Text.Trim());
            SqlDataSourceCTDDH.InsertParameters.Add("msmh", r["msmh"].ToString().Trim());
            SqlDataSourceCTDDH.InsertParameters.Add("sl",r["sl"].ToString().Trim());
            SqlDataSourceCTDDH.Insert();
        }
        this.Title = "THÊM XONG";
    }
}