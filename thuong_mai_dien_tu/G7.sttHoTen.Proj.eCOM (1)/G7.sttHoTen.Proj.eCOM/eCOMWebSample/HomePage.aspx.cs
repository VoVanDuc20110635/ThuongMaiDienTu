using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class HomePage : System.Web.UI.Page
{
    static DataTable tbl = new DataTable(); // BIẾN LƯU "GIỎ HÀNG": BIẾN TOÀN CỤC, CẤP PHÁT TĨNH 
    
    //CHẠY KHI TRANG WEB ĐƯỢC TẢI LÊN TRÌNH DUYỆT
    protected void Page_Load(object sender, EventArgs e)
    {
        //TẠO LẬP "GIỎ HÀNG" ĐỂ KHÁCH HÀNG CHUẨN BỊ MUA HÀNG (BỎ HÀNG VÀO GIỎ = LẤY LÊN "BÀN NHẬU")
        if (!IsPostBack) // Chỉ chạy đoạn mã lệnh tạo giỏ hàng mới khi lần đầu mở HomePage, nếu đã sáng trang web khác và quay lại (Postback) thì ko làm gì thêm => chương trình nhanh hơn
        {
            if (Session["giohang"] != null) // "Giỏ hàng" đã có sẵn trong Session
            {
                //tbl = (DataTable)Session["giohang"]; 
                tbl = Session["giohang"] as DataTable; // Lấy "giỏ hàng" từ Session xuống để mua tiếp
            }
            else //Chưa có "giỏ hàng" trên Session, lập mới một "giỏ hàng" để chuẩn bị mua
            {
                tbl.Columns.Clear(); // Xóa tất cả các cột (để tránh các cột rác)
                tbl.Rows.Clear(); // Xóa tất cả các dòng (để tránh các dòng rác)
                tbl.Columns.Add("msmh", typeof(string)); //định nghĩa cột msmh 
                tbl.Columns.Add("tenmh", typeof(string)); //định nghĩa cột tenmh
                tbl.Columns.Add("dvt", typeof(string)); //định nghĩa cột dvt 
                tbl.Columns.Add("gia", typeof(float)); //định nghĩa cột giá
                tbl.Columns.Add("sl", typeof(float)); //định nghĩa cột số lượng
                tbl.Columns.Add("tien", typeof(float), "sl * gia"); //định nghĩa cột thành tiền = số lượng * đơn giá (sử dụng ĐÚNG chuỗi)
            }
        }
    }


    //BỎ HÀNG VÀO "GIỎ" = "LẤY LÊN BÀN NHẬU": KHI NSD BẤM NÚT "LẤY LÊN BÀN NHẬU" CỦA MÓN HÀNG / DATALIST / TRANG TRƯNG BÀY HH
    protected void DataListMH_ItemCommand(object source, DataListCommandEventArgs e)//tham số e = lưu giữ các thông tin cơ bản về Item mà NSD đang chọn
    {
        if(e.CommandName == "chon")// NSD (KH) bấm nút "Lấy lên bàn nhậu"
        {
          //B1: LẤY CÁC THÔNG TIN CỦA MÓN HÀNG [ITEM] MÀ KH ĐANG CHỌN MUA = LẤY LÊN BÀN NHẬU
            string msmh = DataListMH.DataKeys[e.Item.ItemIndex].ToString(); //mã hàng = khóa chính=>nên có thể lấy theo cách dùng DataKey
            //string msmh = ((Label)e.Item.FindControl("msmhLabel")).Text.Trim(); //mã hàng
            string tenmh = ((Label)e.Item.FindControl("tenmhLabel")).Text.Trim(); // tên hàng
            string dvt = ((Label)e.Item.FindControl("dvtLabel")).Text.Trim(); // đvt
            float gia = float.Parse(((Label)e.Item.FindControl("giaLabel")).Text.Trim()); //đơn giá 
            float sl = float.Parse(((TextBox)e.Item.FindControl("TextBox1")).Text.Trim());//số lượng mua
            //tien = thành tiền: sẽ được DataTable tự tính theo biểu thức "sl * gia" đã có trong Page_load(..)

        // B2: KIỂM TRA XEM ITEM (MÓN HÀNG MÀ KH VỪA CHỌN ĐÃ CÓ TRONG "GIỎ " (BÀN NHẬU) CHƯA: NÊU ĐÃ CÓ THÌ CHỈ TĂNG SỐ LƯỢNG
           foreach(DataRow rw in tbl.Rows)//dò lần lược tất cả các mh đã có trong "giỏ"
            {
                if((string)rw["msmh"] == msmh)//MH mà KH đang chọn đã có sẵn trong "giỏ" 
                {
                    rw["sl"] = (float)rw["sl"] + sl;//Tăng số lượng của MH mà KH vừa chọn
                    goto kt; //dừng foreach(...) vì đã có mh trong "giỏ" và đã tăng sl
                }
            }//nếu hết foreach(..) mà if(...) KHÔNG được thực hiện lần nào => MH mà KH đang chọn mua CHƯA có trong "giỏ "

        //B3: THÊM MH MỚI VÀO "GIỎ" VÌ MH MÀ KH ĐANG CHỌN MUA CHƯA CÓ TRONG "GIỎ"
            tbl.Rows.Add(msmh, tenmh, dvt, gia, sl);//thêm MH mới (KH vừa chọn) vào "Giỏ"

            //B4:GỬI GIỎ HÀNG tbl LÊN Session ĐỂ CHUYỂN SANG CÁC TRANG KHÁC SỬ DỤNG (SAU KHI ĐÃ THÊM HÀNG VÀO "GIỎ")
            kt:
            Session["giohang"] = tbl;

            //B5:THÔNG BÁO KẾT QUẢ CHỌN MUA CỦA KH LÊN TRÊN TRANG NÀY = TRƯNG BÀY HH = HOMEPAGE: Tổng số Món đã chọn + Tổng số tiền hiện tại trên bàn nhậu
            lbKQ.Text = "BÀN NHẬU CỦA QUÍ VỊ HIỆN CÓ : " + tbl.Compute("Count(msmh)", "").ToString() + " MÓN, TỔNG TIỀN = " + tbl.Compute("Sum(tien)", "").ToString() + " Đồng"; 
        }
    }
    
    //XEM BÀN NHẬU = GIỎ HÀNG
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~\\Cart.aspx");
    }
}