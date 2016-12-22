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
    public partial class confirm_tutor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
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
                comm.CommandText = "update A_튜터신청현황 set 확정여부=1 where 인덱스 = :num";
                comm.Parameters.AddWithValue("num", row.Cells[0].Text);
                Debug.WriteLine(comm.CommandText);
            
                int odr = comm.ExecuteNonQuery();

                Response.Redirect(string.Format("home_professor.aspx"));
                Debug.WriteLine("성공");
            }

            finally
            {
                conn.Close();
            }
        }
    }
}