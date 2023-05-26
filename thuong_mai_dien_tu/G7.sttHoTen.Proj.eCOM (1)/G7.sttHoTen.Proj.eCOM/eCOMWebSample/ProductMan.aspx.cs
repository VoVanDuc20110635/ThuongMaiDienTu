using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProductMan : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedValue == "*")//chọn Tất cả *
        {
            SqlDataSourceMH.SelectCommand = "SELECT * FROM [MH]";
            btnThemMH.Visible = false;// Không được Thêm MH mới; vì đang chọn 'Tất cả"
            DropDownList1.ToolTip = "Phải chọn Nhóm MH cụ thể để thêm MH mới";
        }
        else //Thêm được
        {
            btnThemMH.Visible = true;// Thêm được
            DropDownList1.ToolTip = "";
        }
        lbmaNhom.Text = DropDownList1.SelectedValue; // HIỂN THỊ MÃ NHÓM KẾ BÊN

        ////Ẩn các nút liên quan xử lý RBTV DL khi xóa MH
        ////XL tồn kho
        //if (GridViewTONKHO.Rows.Count <= 0) { btnTLAllTonKho.Visible = false; }
        //else { btnTLAllTonKho.Visible = true; }
        ////XL CTDDH
        //if (GridViewCTDDH.Rows.Count <= 0)
        //{
        //btnTCAllDDH.Visible = false;
        //CheckBox2.Visible = false;
        //}
        //else
        //{
        //    btnTCAllDDH.Visible = true;
        //    CheckBox2.Visible = true;
        //}

        //btnTLAllTonKho.Visible = false;
        //btnTCAllDDH.Visible = false;
        //CheckBox2.Visible = false;

        btnTLAllTonKho.Visible = GridViewTONKHO.Visible;
        btnTCAllDDH.Visible = GridViewCTDDH.Visible;
        CheckBox2.Visible = GridViewCTDDH.Visible;


    }

    //HIỆN / ẨN HÌNH MẪU
    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        GridView1.Columns[6].Visible = !GridView1.Columns[6].Visible;
    }

    //THAY ĐỔI LỰA CHỌN TRONG DROPDOWNLIST
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(DropDownList1.SelectedValue == "*")//chọn Tất cả *
        {
            SqlDataSourceMH.SelectCommand = "SELECT * FROM [MH]";
            btnThemMH.Visible = false;// Không được Thêm MH mới; vì đang chọn 'Tất cả"
            DropDownList1.ToolTip = "Phải chọn Nhóm MH cụ thể để thêm MH mới";
        }
        else //Đã chọn Nhóm MH, nên Thêm mới được
        {
            btnThemMH.Visible = true;// Thêm được 
            DropDownList1.ToolTip = "";
        }
        lbmaNhom.Text = DropDownList1.SelectedValue; // HIỂN THỊ MÃ NHÓM KẾ BÊN
    }

    //THÊM MH MỚI
    protected void btnThemMH_Click(object sender, EventArgs e)
    {//Ẩn - hiện các ô nhập thông tin MH mới
        lbMahang.Visible = !lbMahang.Visible;
        lbTenhang.Visible = !lbTenhang.Visible;
        lbDVT.Visible = !lbDVT.Visible;
        lbGia.Visible = !lbGia.Visible;
        lbD.Visible = !lbD.Visible;
        lbMota.Visible = !lbMota.Visible;
        lbHinh.Visible = !lbHinh.Visible;
        txtMahang.Visible = !txtMahang.Visible;
        txtTenhang.Visible = !txtTenhang.Visible;
        txtDVT.Visible = !txtDVT.Visible;
        txtGia.Visible = !txtGia.Visible;
        txtMota.Visible = !txtMota.Visible;
        FileUpload1.Visible = !FileUpload1.Visible;
        btnhuy.Visible = !btnhuy.Visible;

        //Đổi nhãn "Thêm mới..." -> "Lưu...
        if(btnThemMH.Text == "Thêm MH mới")
        {// xóa trống các txt.. để NSD chuẩn bị nhập thông tin MH mới
            txtMahang.Text = "";
            txtTenhang.Text = "";
            txtDVT.Text = "";
            txtGia.Text = "";
            txtMota.Text = "";
            //đổi nhãn nút Thêm -. Lưu
            btnThemMH.Text = "Lưu MH mới nhập";
        }
        else // Lưu -> Thêm MH mới
        {
            //bổ sung tham số Hinh
            SqlDataSourceMH.InsertParameters.Add("hinh", "~\\Images\\" + System.IO.Path.GetFileName(FileUpload1.FileName));
            //Lưu file hình đã chọn vào Thư mục ~\Images\
            FileUpload1.SaveAs("D:\\bt.asp.net2n2\\Images\\" + System.IO.Path.GetFileName(FileUpload1.FileName));

            try
            {
                SqlDataSourceMH.Insert(); // lƯU mh MỚI VÀO db

            }catch(System.Exception ex) { this.Title = "CÓ LỖI =" + ex.Message; }

            //Tải dữ liệu sau khi thêm MH mới lên GridView
            GridView1.DataBind();

            btnThemMH.Text = "Thêm MH mới";
        }

    }

    //ĐỔI HÀNG CỦA CÁC DDH CỦA CÁC MH CẦN XÓA
    protected void CheckBox2_CheckedChanged(object sender, EventArgs e)
    {
        DropDownListDDH.Visible = CheckBox2.Checked;
    }
    //thanh LÝ ALL TỒN KHO CỦA MH CẦN XÓA
    protected void btnTLAllTonKho_Click(object sender, EventArgs e)
    {
        SqlDataSourceTONKHO.DeleteParameters.Clear();
        SqlDataSourceTONKHO.DeleteCommand = "DELETE FROM TONKHO WHERE msmh = @msmh";
        SqlDataSourceTONKHO.DeleteParameters.Add("msmh",GridView1.SelectedValue.ToString());
        try
        {
            SqlDataSourceTONKHO.Delete();
        }catch(System.Exception ex) { this.Title = "có lỗi = " + ex.Message; }
        
    }

    //thAY ĐỔI LỰA CHỌN MH
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.Title = GridViewTONKHO.Rows.Count.ToString() + " :  " + GridViewCTDDH.Rows.Count.ToString();
        //Ẩn các nút liên quan xử lý RBTV DL khi xóa MH
        //XL tồn kho
        //if (GridViewTONKHO.Rows.Count <= 0)
        //{ btnTLAllTonKho.Visible = false; }
        //else
        //{ btnTLAllTonKho.Visible = true; }
        //XL CTDDH
        //if (GridViewCTDDH.Rows.Count <= 0)
        //{
        //    btnTCAllDDH.Visible = false;
        //    CheckBox2.Visible = false;
        //}
        //else
        //{
        //    btnTCAllDDH.Visible = true;
        //    CheckBox2.Visible = true;
        //}

        btnTLAllTonKho.Visible = GridViewTONKHO.Visible;
        btnTCAllDDH.Visible = GridViewCTDDH.Visible;
        CheckBox2.Visible = GridViewCTDDH.Visible;

    }
}