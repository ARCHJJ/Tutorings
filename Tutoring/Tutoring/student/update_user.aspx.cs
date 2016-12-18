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
    public partial class update_user : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                OracleConnection conn = new OracleConnection();
                conn.ConnectionString = "data source=lphlox.yu.ac.kr;user id=team204;password=4321";
                OracleCommand comm = new OracleCommand();
                comm.Connection = conn;

                try
                {
                    conn.Open();
                    comm.CommandText = "select phone, address, email, passwd from A_학생 where id='" + Session["id"] + "'";
                    OracleDataReader odr = comm.ExecuteReader();
                    if (odr.HasRows)
                    {
                        while (odr.Read())
                        {
                            string phone1 = odr["phone"].ToString();
                            string address1 = odr["address"].ToString();
                            string email1 = odr["email"].ToString();
                            string password1 = odr["passwd"].ToString();

                            phone.Text = phone1;
                            address.Text = address1;
                            email.Text = email1;
                            password.Text = password1;
                        }

                    }
                }
                catch
                {
                    //warring.Text = "젠장";
                }
                finally
                {
                    conn.Close();
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string phone1 = phone.Text;
            string address1 = address.Text;
            string email1 = email.Text;
            string password1 = password.Text;

            Debug.WriteLine("debug" + phone.Text);

            OracleConnection conn = new OracleConnection();
            conn.ConnectionString = "data source=lphlox.yu.ac.kr;user id=team204;password=4321";
            OracleCommand comm = new OracleCommand();
            comm.Connection = conn;

            try
            {
                conn.Open();
                comm.CommandText = "update A_학생 set phone='" + phone1 + "', address='" + address1 + "', email='" + email1 + "', passwd='" + password1 + "' where id='" + Session["id"] + "'";
                //comm.Parameters.AddWithValue("@phone", phone.Text);
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