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
    public partial class registertime : System.Web.UI.Page
    {
        String IndexValue;
        String Decision;
        protected void Page_Load(object sender, EventArgs e)
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
                    IndexValue = (odr["인덱스"].ToString());
                    Decision = (odr["확정여부"].ToString());
                    //Response.Redirect(string.Format("registertime.aspx?IndexValue" + IndexValue + "&Decision" + Decision));
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

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {

        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            OracleConnection conn = new OracleConnection();
            conn.ConnectionString = "data source=lphlox.yu.ac.kr;user id=team204;password=4321";
            OracleCommand comm = new OracleCommand();
            comm.Connection = conn;


            try
            {
                conn.Open();//
                comm.CommandText = "insert into A_상담시간공지 (취소가능날짜, 상담장소, 가능인원,종료시간,현재신청인원,시작시간, 인덱스) values (TO_DATE(:Sdate,'YYYY-MM-DD HH24:MI')-:CancelDate,:placeL,:Anum,TO_DATE(:Exdate,'YYYY-MM-DD HH24:MI'),0,TO_DATE(:Sdate,'YYYY-MM-DD HH24:MI'),:IndexValue)";
                //comm.CommandText = "insert into A_상담시간등록 (신청자학번, 상담장소, 시작시간, 인덱스) values (" + Session["id"] + ",:placeL,:Sdate,:Snum )";
                // comm.CommandText = "insert into A_튜터신청현황 (강좌번호, 튜터학번, 확정여부, 인덱스, 강좌명) values (:no, " + Session["id"] + ", 0, SEQ1.nextval, :name)";               
                comm.Parameters.AddWithValue("placeL", TextBox1.Text);
                comm.Parameters.AddWithValue("Anum", DropDownList1.SelectedValue);
                comm.Parameters.AddWithValue("Exdate", TextBox3.Text);
                comm.Parameters.AddWithValue("Sdate", TextBox2.Text);
                comm.Parameters.AddWithValue("IndexValue", Int32.Parse(IndexValue));
                comm.Parameters.AddWithValue("CancelDate", DropDownList2.SelectedValue);
                // comm.Parameters.AddWithValue("StartTime", row.Cells[3].Text);
                //  comm.CommandText = "insert into A_상담시간등록 (신청자학번, 상담장소, 시작시간, 인덱스) values (" + Session["id"] + ","+ row.Cells[5].Text + ", " + StartTime.Text + ","+ row.Cells[1].Text + ")";

                //Debug.WriteLine(comm.CommandText);
                // Debug.WriteLine(row.Cells[4].Text);
                // Debug.WriteLine(row.Cells[5].Text);
                int odr1 = comm.ExecuteNonQuery();
                if(odr1 != 0)
                    Page.ClientScript.RegisterStartupScript(typeof(Page), "alert", "<script language=javaScript>alert('공지 성공!');</script>");
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