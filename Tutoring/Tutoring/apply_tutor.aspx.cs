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
    public partial class apply_tutor : System.Web.UI.Page
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

            try
            {
                conn.Open();
                comm.CommandText = "insert into A_튜터신청현황 (강좌번호, 튜터학번, 확정여부, 인덱스) values (#no, " + Session["id"] + ", 0, SEQ1.nextval";
                //comm.Parameters.AddWithValue("@no", GridView1.DataKeys[e.].Value);
                int odr = comm.ExecuteNonQuery();

                Response.Redirect(string.Format("home.aspx"));
                Debug.WriteLine("성공");
            }

            finally
            {
                conn.Close();
            }
        }
    }
}