using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FrChuyenNhom : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DropDownListS_SelectedIndexChanged(sender, e); // KIỂM TRA: NẾU 2 BÊN Dropdownlist CỦA S VÀ D GIỐNG NHAU: KHÔNG CHUYỂN [MỞ CÁC NÚT LỆNH ]
    }

    // CHUYỂN 1 MH TỪ NHÓM "NGUỒN" SANG NHÓM "ĐÍCH" : LEFT to RIGHT
    protected void btLR_Click(object sender, EventArgs e)
    {   // gọi Update() bên Nguồn (S) đề chuyển
        SqlDataSourceMHS.UpdateParameters.Clear(); //Xóa tất cả các tham số trước đó (tránh nhầm lẫn)
        SqlDataSourceMHS.UpdateParameters.Add("msnhom", DropDownListD.SelectedValue.Trim()); // Set... msnhom mới cho MH bên Nguồn theo bên Đích
        SqlDataSourceMHS.UpdateParameters.Add("msmh", ListBoxS.SelectedValue.Trim()); // where... theo msmh đang chọn trong Listbox bên Nguồn (chuyển 1 MH) 
        SqlDataSourceMHS.UpdateParameters.Add("msnhom_o", ""); // không cần điều kiện thứ 2 (không quan tâm)
        SqlDataSourceMHS.Update(); // Chạy Update...
        //Tải DL sau khi chuyển lên 2 ListBox
        ListBoxS.DataBind();
        ListBoxD.DataBind();
    }

    // CHUYỂN 1 MH TỪ NHÓM "ĐÍCH" SANG NHÓM "NGUỒN" : RIGHT to LEFT
    protected void btRL_Click(object sender, EventArgs e)
    {   // gọi Update() bên Đích (D) đề chuyển
        SqlDataSourceMHD.UpdateParameters.Clear(); //Xóa tất cả các tham số trước đó (tránh nhầm lẫn)
        SqlDataSourceMHD.UpdateParameters.Add("msnhom", DropDownListS.SelectedValue.Trim()); // Set... msnhom mới cho MH bên Nguồn theo bên Nguồn
        SqlDataSourceMHD.UpdateParameters.Add("msmh", ListBoxD.SelectedValue.Trim()); // where... theo msmh đang chọn trong Listbox bên Đích (chuyển 1 MH) 
        SqlDataSourceMHD.UpdateParameters.Add("msnhom_o", ""); // không cần điều kiện thứ 2 (không quan tâm)
        SqlDataSourceMHD.Update(); // Chạy Update...
        //Tải DL sau khi chuyển lên 2 ListBox
        ListBoxS.DataBind();
        ListBoxD.DataBind();
    }

    // CHUYỂN ALL MH TỪ NHÓM "NGUỒN" SANG NHÓM "ĐÍCH" : LEFT to RIGHT
    protected void btRAL_Click(object sender, EventArgs e)
    {   // gọi Update() bên Nguồn (S) đề chuyển
        SqlDataSourceMHS.UpdateParameters.Clear(); //Xóa tất cả các tham số trước đó (tránh nhầm lẫn)
        SqlDataSourceMHS.UpdateParameters.Add("msnhom", DropDownListD.SelectedValue.Trim()); // Set... msnhom mới cho MH bên Nguồn theo bên Đích
        SqlDataSourceMHS.UpdateParameters.Add("msmh", ""); // không cần điều kiện thứ 1 (không quan tâm) 
        SqlDataSourceMHS.UpdateParameters.Add("msnhom_o", DropDownListS.SelectedValue.Trim());// where... theo msnhom đang chọn trong Dropdownlist bên Nguồn (chuyển ALL MH) 
        SqlDataSourceMHS.Update(); // Chạy Update...        
        //Tải DL sau khi chuyển lên 2 ListBox
        ListBoxS.DataBind();
        ListBoxD.DataBind();
    }

    // TRỞ VỀ PAGE QUẢN LÝ
    protected void btE_Click(object sender, EventArgs e)
    {
        Response.Redirect("~\\Management.aspx");
    }

    // KIỂM TRA: NẾU 2 BÊN Dropdownlist CỦA S VÀ D GIỐNG NHAU: KHÔNG CHUYỂN [MỞ CÁC NÚT LỆNH ]
    protected void DropDownListS_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(DropDownListS.SelectedValue.Trim() == DropDownListD.SelectedValue.Trim()) // 2 Bên đã chọn giống nhau
        {
            btLR.Enabled = false;
            btRL.Enabled = false;
            btLAR.Enabled = false;
            btRAL.Enabled = false;
            DropDownListS.ToolTip = DropDownListD.ToolTip = "2 Bên phải chọn Khác nhau thì mới CHUYỂN được";
        }
        else // 2 bên đã chọn KHÁC nhau
        {
            btLR.Enabled = true;
            btRL.Enabled = true;
            btLAR.Enabled = true;
            btRAL.Enabled = true;
            DropDownListS.ToolTip = DropDownListD.ToolTip = "";
        }
    }
}