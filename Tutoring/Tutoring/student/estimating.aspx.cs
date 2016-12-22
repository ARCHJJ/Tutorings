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
    public partial class estimating : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            OracleConnection conn = new OracleConnection();
            conn.ConnectionString = "data source=lphlox.yu.ac.kr;user id=team204;password=4321";
            OracleCommand comm = new OracleCommand();
            comm.Connection = conn;
            try
            {

                conn.Open();
                comm.CommandText = "insert into A_평가 (인덱스, 정성평가, 정량평가, 평가자id, 구분, 튜터id) values (:indexs, :evalu1, :evalu2, :std_id, 1,:tutor_id)";
                comm.Parameters.AddWithValue("indexs", Request.QueryString["index"]);
                comm.Parameters.AddWithValue("evalu1", TextBox1.Text);
                comm.Parameters.AddWithValue("evalu2", DropDownList1.Text);
                comm.Parameters.AddWithValue("std_id", Session["id"]);
                comm.Parameters.AddWithValue("tutor_id", Request.QueryString["tutor_id"]);

                Debug.WriteLine(comm.CommandText);
                int odr = comm.ExecuteNonQuery();

                if (odr == 1)
                {
                    ClientScript.RegisterStartupScript(typeof(Page), "alert", "<script language=javaScript>alert('성공');</script>");
                }
                else
                {
                    ClientScript.RegisterStartupScript(typeof(Page), "alert", "<script language=javaScript>alert('다시 확인해주세요..');</script>");
                }

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