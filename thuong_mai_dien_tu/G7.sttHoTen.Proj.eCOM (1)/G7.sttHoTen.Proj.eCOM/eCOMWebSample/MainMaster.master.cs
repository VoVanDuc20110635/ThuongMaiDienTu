using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MainMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    //NSD CHỌN MỘT MỤC (ITEM) TRONG THỰC ĐƠN (Menu)
    protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
    {
        if(e.Item.Value == "ql" || e.Item.Value == "dn")//NSD chọn mục "Quản lý/Value-ql hoặc "Đăng nhập"/Value-dn
        {
            Login1.Visible = true; //Hiện Login
        }
        else // NSD chọn các mục khác
        {
            Login1.Visible = false; // Ẩn Login 
        }
    }

    //XỬ LÝ ĐĂNG NHẬP 
    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {    //Nếu NSD đăng nhập với tên Admin và mật khẩu Admin#vn Hoặc .... 
        if((Login1.UserName == "Admin" && Login1.Password == "Admin@vn") || (Login1.UserName == "Guest" && Login1.Password == "Guest@vn"))
        {
            e.Authenticated = true; //Đăng nhập thành công (sẽ mở trang Management đã gán .Destina..url)
        }
        else
        {
            e.Authenticated = false; // Đăng nhập ko thành công
        }
    }
}
