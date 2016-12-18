using System;
using System.Collections.Generic;
using System.Data.OracleClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Tutoring
{
    public partial class Choice_TIme : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            // if (GridView1.Rows[i].Cells[6] == GridView1.Rows[i].Cells[7])
            if (row.Cells[6] == row.Cells[7])
            {
                ClientScript.RegisterStartupScript(typeof(Page), "alert", "<script language=javaScript>alert('신청할 수 없습니다');</script>");
            }
            else {
                OracleConnection conn = new OracleConnection();
                conn.ConnectionString = "data source=lphlox.yu.ac.kr;user id=team204;password=4321";
                OracleCommand comm = new OracleCommand();
                comm.Connection = conn;


                try
                {
                    conn.Open();
                    comm.CommandText = "insert into A_상담시간등록 (신청자학번, 상담장소, 시작시간, 인덱스) values (" + Session["id"] + ",:placeL,TO_DATE(:Sdate,'YYYY-MM-DD AM HH12:MI:SS'),:Snum )";
                    //comm.CommandText = "insert into A_상담시간등록 (신청자학번, 상담장소, 시작시간, 인덱스) values (" + Session["id"] + ",:placeL,:Sdate,:Snum )";
                    // comm.CommandText = "insert into A_튜터신청현황 (강좌번호, 튜터학번, 확정여부, 인덱스, 강좌명) values (:no, " + Session["id"] + ", 0, SEQ1.nextval, :name)";
                    comm.Parameters.AddWithValue("Snum", row.Cells[1].Text);
                    comm.Parameters.AddWithValue("Sdate", row.Cells[3].Text);
                    comm.Parameters.AddWithValue("placeL", row.Cells[5].Text);
                    //comm.Parameters.AddWithValue("StartTime", row.Cells[3].Text);
                    //  comm.CommandText = "insert into A_상담시간등록 (신청자학번, 상담장소, 시작시간, 인덱스) values (" + Session["id"] + ","+ row.Cells[5].Text + ", " + StartTime.Text + ","+ row.Cells[1].Text + ")";

                    Debug.WriteLine(comm.CommandText);
                    Debug.WriteLine(row.Cells[4].Text);
                    // Debug.WriteLine(row.Cells[5].Text);
                    int odr = comm.ExecuteNonQuery();

                    // Response.Redirect(string.Format("home.aspx"));
                    // Debug.WriteLine("성공");
                }

                finally
                {
                    conn.Close();
                }
            }

        }
    }
}
