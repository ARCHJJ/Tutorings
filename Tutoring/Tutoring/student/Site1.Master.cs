using System;
using System.Collections.Generic;
using System.Data.OracleClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Tutoring.student
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            Response.Redirect(string.Format("login.aspx"));
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            OracleConnection conn = new OracleConnection();
            conn.ConnectionString = "data source=lphlox.yu.ac.kr;user id=team204;password=4321";
            OracleCommand comm = new OracleCommand();
            comm.Connection = conn;


            try
            {
                conn.Open();
                comm.CommandText = "select 인덱스,확정여부 from A_튜터신청현황 where 튜터학번=:id";
                comm.Parameters.AddWithValue("id", Session["id"]);
                OracleDataReader odr = comm.ExecuteReader();

                if (odr.HasRows)
                {
                    odr.Read();
                    String IndexValue = (odr["인덱스"].ToString());
                    String Decision = (odr["확정여부"].ToString());
                    Response.Redirect(string.Format("registertime.aspx?IndexValue" + IndexValue + "+Decision" + Decision));
                }
                else {
                    Page.ClientScript.RegisterStartupScript(typeof(Page), "alert", "<script language=javaScript>alert('튜터가 아닙니다');</script>");

                }
            }
            finally
            {
                conn.Close();
            }

        }
    }
}