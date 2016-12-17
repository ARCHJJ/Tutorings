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
    public partial class TutorActing : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            OracleConnection con = new OracleConnection("Data Source=lphlox.yu.ac.kr;User ID=team204;Password=4321;");
            OracleCommand cmd = new OracleCommand("select ID from 학생 where 학번 =2016001");
            //OracleDataAdapter sda = new OracleDataAdapter("Select Count(*) from 사용자 where 아이디='" + TextBox1.Text + "'and 암호='" + TextBox2.Text + "'", con);
            Response.Write(Calendar1.SelectedDate.ToShortDateString() + "< hr />");
        }

        protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
    }
}