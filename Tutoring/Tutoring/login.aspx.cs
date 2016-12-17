using System;
using System.Collections.Generic;
using System.Data.OracleClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Tutoring
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string id = TextBox1.Text;
            string pw = TextBox2.Text;

            OracleConnection conn = new OracleConnection();
            conn.ConnectionString = "data source=lphlox.yu.ac.kr;user id=team204;password=4321";
            OracleCommand comm = new OracleCommand();
            comm.Connection = conn;
            try
            {
                conn.Open();
                if (RadioButtonList1.SelectedIndex == 0)
                {
                    comm.CommandText = "select passwd from A_학생 where id='" + id + "'";
                }
                else
                {
                    comm.CommandText = "select passwd from A_교수 where id='" + id + "'";
                }
                OracleDataReader odr = comm.ExecuteReader();
                if (odr.HasRows)
                {
                    while (odr.Read())
                    {
                        string pass = odr["passwd"].ToString();
                        if (pass.Equals(pw))
                        {
                            Session["id"] = id;

                            //Name = Context.Session.GetString("Name"),

                            Response.Redirect(string.Format("home.aspx"));
                        }
                        else
                        {
                            warning.Text = "아이디/비밀번호를 확인하세요";
                        }
                        //rbl.Items.Add(val);
                    }

                }
            }
            catch
            {
                //warning.Text = "젠장";
            }
            finally
            {
                conn.Close();
            }
        }
    }
}