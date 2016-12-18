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
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            OracleConnection conn = new OracleConnection();
            conn.ConnectionString = "data source=lphlox.yu.ac.kr;user id=team204;password=4321";
            OracleCommand comm = new OracleCommand();
            comm.Connection = conn;

            try
            {
                conn.Open();
                
                comm.CommandText = "select name, email from A_학생 where id=:id";
                comm.Parameters.AddWithValue("id", TextBox1.Text);
                OracleDataReader odr = comm.ExecuteReader();
                if (odr.HasRows)
                {
                    while (odr.Read())
                    {
                        string name = odr["name"].ToString();
                        string email = odr["email"].ToString();
                        if (name.Equals(TextBox2.Text) && email.Equals(TextBox3.Text))
                        {
                            comm.CommandText = "update A_학생 set passwd=:passwd where id=:id";
                            comm.Parameters.AddWithValue("id", TextBox1.Text);
                            comm.Parameters.AddWithValue("passwd", TextBox4.Text);
                            int odr2 = comm.ExecuteNonQuery();
                            Response.Redirect(string.Format("login.aspx"));
                        }
                        else
                        {
                            warning.Text = "학번, 이름, 이메일을 확인하세요";
                        }
                        //rbl.Items.Add(val);
                    }

                }
            }

            finally
            {
                conn.Close();
            }
        }
    }
}