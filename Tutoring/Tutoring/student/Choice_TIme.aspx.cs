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
    public partial class Choice_TIme : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                // 여기에 사용자 코드를 배치하여 페이지를 초기화합니다.
                //맨 처음 페이지를 읽었을 경우 실행할 구문
            }
            else
            {
                //새로고침이 있을 경우(페이지 접근이 처음이 아닐 때)
            }
        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            // if (GridView1.Rows[i].Cells[6] == GridView1.Rows[i].Cells[7])
            if (row.Cells[6].Text.Equals(row.Cells[7].Text))
            {
                ClientScript.RegisterStartupScript(typeof(Page), "alert", "<script language=javaScript>alert('신청할 수 없습니다');</script>");

            }
            else {

                OracleConnection conn = new OracleConnection();
                conn.ConnectionString = "data source=lphlox.yu.ac.kr;user id=team204;password=4321";
                OracleCommand comm = new OracleCommand();
                OracleCommand comm2 = new OracleCommand();
                OracleCommand comm3 = new OracleCommand();
                comm.Connection = conn;
                comm2.Connection = conn;
                comm3.Connection = conn;


                try
                {
                    conn.Open();
                    comm.CommandText = "select 신청자학번 from A_상담시간등록 where 신청자학번=:ID and 인덱스=:tutorIndex";
                    comm.Parameters.AddWithValue("ID", Session["id"]);
                    comm.Parameters.AddWithValue("tutorIndex", row.Cells[1].Text);
                    OracleDataReader odr = comm.ExecuteReader();
                    if (odr.HasRows)
                    {
                        Page.ClientScript.RegisterStartupScript(typeof(Page), "alert", "<script language=javaScript>alert('이미 등록되었습니다');</script>");
                    }
                    else {                        
                        comm2.CommandText = "insert into A_상담시간등록 (신청자학번, 상담장소, 시작시간, 인덱스) values (:ID,:placeL,TO_DATE(:Sdate,'YYYY-MM-DD HH24:MI'),:Snum )";
                       
                        comm2.Parameters.AddWithValue("ID", Session["id"]);
                        comm2.Parameters.AddWithValue("placeL", row.Cells[5].Text);
                        comm2.Parameters.AddWithValue("Sdate", row.Cells[3].Text);
                        comm2.Parameters.AddWithValue("Snum", int.Parse(row.Cells[1].Text));
                        
                        
                        //comm.Parameters.AddWithValue("StartTime", row.Cells[3].Text);
                        //  comm.CommandText = "insert into A_상담시간등록 (신청자학번, 상담장소, 시작시간, 인덱스) values (" + Session["id"] + ","+ row.Cells[5].Text + ", " + StartTime.Text + ","+ row.Cells[1].Text + ")";

                        Debug.WriteLine(row.Cells[3].Text);
                      // Debug.WriteLine(row.Cells[4].Text);
                        // Debug.WriteLine(row.Cells[5].Text);
                        int ork = comm2.ExecuteNonQuery();
                        if (ork == 0)
                        {
                            Page.ClientScript.RegisterStartupScript(typeof(Page), "alert", "<script language=javaScript>alert('신청 실패!');</script>");
                        }
                        else {
                            String a = "1";
                            String b = (int.Parse(a) + int.Parse(row.Cells[7].Text)).ToString();//인원수 카운터 올리는것
                            comm3.CommandText = "update A_상담시간공지 set 현재신청인원=:nowpeople where 인덱스=:tutorIndex";
                            comm3.Parameters.AddWithValue("nowpeople", b);
                            comm3.Parameters.AddWithValue("tutorIndex", row.Cells[1].Text);

                            int odr1 = comm3.ExecuteNonQuery();
                            if(odr1!=0)
                                Page.ClientScript.RegisterStartupScript(typeof(Page), "alert", "<script language=javaScript>alert('신청 성공!');</script>");

                        }
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
}


