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
            OracleConnection conn = new OracleConnection();
            conn.ConnectionString = "data source=lphlox.yu.ac.kr;user id=team204;password=4321";
            OracleCommand comm = new OracleCommand();
            comm.Connection = conn;
            GridViewRow row = GridView1.SelectedRow;

            try
            {
                conn.Open();
                comm.CommandText = "insert into A_상담시간등록 (신청자학번, 상담장소, 시작시간, 인덱스) values (" + Session["id"] + ", :place, " + StartTime.Text + ",:Index  )";
               // comm.CommandText = "insert into A_튜터신청현황 (강좌번호, 튜터학번, 확정여부, 인덱스, 강좌명) values (:no, " + Session["id"] + ", 0, SEQ1.nextval, :name)";
                comm.Parameters.AddWithValue("Index", row.Cells[1].Text);
                comm.Parameters.AddWithValue("place", row.Cells[5].Text);
                //comm.Parameters.AddWithValue("StartTime", row.Cells[3].Text);


                // Debug.WriteLine(comm.CommandText);
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
