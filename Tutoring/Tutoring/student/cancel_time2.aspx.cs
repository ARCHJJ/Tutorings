using System;
using System.Collections.Generic;
using System.Data.OracleClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Tutoring.student
{
    public partial class cancel_time2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Page.ClientScript.RegisterStartupScript(typeof(Page), "alert", "<script language=javaScript>alert('123123123123123');</script>");
            GridViewRow row = GridView1.SelectedRow;
            OracleConnection conn = new OracleConnection();
            conn.ConnectionString = "data source=lphlox.yu.ac.kr;user id=team204;password=4321";
            OracleCommand comm = new OracleCommand();
            OracleCommand comm2 = new OracleCommand();
            comm.Connection = conn;
            comm2.Connection = conn;


            try
            {
                
                conn.Open();
                comm.CommandText = "delete from A_상담시간등록 where 신청자학번=" + Session["id"] + " and 인덱스= :Snum";
                //comm.CommandText = "insert into A_상담시간등록 (신청자학번, 상담장소, 시작시간, 인덱스) values (" + Session["id"] + ",:placeL,:Sdate,:Snum )";
                // comm.CommandText = "insert into A_튜터신청현황 (강좌번호, 튜터학번, 확정여부, 인덱스, 강좌명) values (:no, " + Session["id"] + ", 0, SEQ1.nextval, :name)";
                comm.Parameters.AddWithValue("Snum", int.Parse(row.Cells[1].Text));
                ////Page.ClientScript.RegisterStartupScript(typeof(Page), "alert", "<script language=javaScript>alert('456456456456456');</script>");
                //comm.Parameters.AddWithValue("StartTime", row.Cells[3].Text);
                //  comm.CommandText = "insert into A_상담시간등록 (신청자학번, 상담장소, 시작시간, 인덱스) values (" + Session["id"] + ","+ row.Cells[5].Text + ", " + StartTime.Text + ","+ row.Cells[1].Text + ")";
                
                Debug.WriteLine(comm.CommandText);
                Debug.WriteLine(row.Cells[4].Text);
                // Debug.WriteLine(row.Cells[5].Text);
                int odr = comm.ExecuteNonQuery();
                if (odr == 0)
                {
                    Page.ClientScript.RegisterStartupScript(typeof(Page), "alert", "<script language=javaScript>alert('삭제할 정보가 없습니다');</script>");
                }
                else {                    
                        String a = "1";
                        String b = (int.Parse(row.Cells[7].Text)-int.Parse(a) ).ToString();//인원수 카운터 올리는것
                        comm2.CommandText = "update A_상담시간공지 set 현재신청인원=:nowpeople where 인덱스=:tutorIndex";
                        comm2.Parameters.AddWithValue("nowpeople", b);
                        comm2.Parameters.AddWithValue("tutorIndex", row.Cells[1].Text);

                        int odr1 = comm2.ExecuteNonQuery();
                        if (odr1 != 0)
                        Page.ClientScript.RegisterStartupScript(typeof(Page), "alert", "<script language=javaScript>alert('삭제 성공!');</script>");


                    // Response.Redirect(string.Format("home.aspx"));
                    // Debug.WriteLine("성공");
                }         
                
               
            }

            finally
            {
                conn.Close();
            }
           
        }
       
    }
   
}
