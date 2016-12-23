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
                    comm.CommandText = "select passwd, to_char(sysdate,'yyyy') as year,to_char(sysdate,'mm') as month  from A_학생 where id='" + id + "'";
                }
                else
                {
                    comm.CommandText = "select passwd, to_char(sysdate,'yyyy') as year,to_char(sysdate,'mm') as month from A_교수 where id='" + id + "'";
                }
                OracleDataReader odr = comm.ExecuteReader();
                if (odr.HasRows)
                {
                    while (odr.Read())
                    {
                        string pass = odr["passwd"].ToString();
                        int year = Int32.Parse(odr["year"].ToString());
                        int month = Int32.Parse(odr["month"].ToString());
                        int semester;
                        if (month > 8)
                            semester = 2;
                        else
                            semester = 1;
                        if (pass.Equals(pw))
                        {
                            Session["id"] = id;
                            Session["year"] = year;
                            Session["semester"] = semester;

                            Debug.WriteLine("debug: "+Session["year"] + "         " +Session["semester"]);
                            //Name = Context.Session.GetString("Name"),
                            if (RadioButtonList1.SelectedIndex == 0)
                            {
                                Response.Redirect(string.Format("student/home.aspx"));
                            }
                            else if(id.Equals("0"))
                            {
                                Response.Redirect(string.Format("admin/home_admin.aspx"));

                            }else
                            {
                                Response.Redirect(string.Format("professor/home_professor.aspx"));
                            }
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
                warning.Text = "아이디/비밀번호를 다시 확인해주세요.";
            }
            finally
            {
                conn.Close();
            }
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}