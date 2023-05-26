using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Management : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    
    //GỌI TRANG : QUẢN LÝ HÀNG HÓA
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~\\ProductMan.aspx");
    }
    //GỌI TRANG : CHUYỂN NHÓM
    protected void Button8_Click(object sender, EventArgs e)
    {
        Response.Redirect("~\\FrChuyenNhom.aspx");
    }
}