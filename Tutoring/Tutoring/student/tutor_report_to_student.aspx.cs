using System;
using System.Collections.Generic;
using System.Data.OracleClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Tutoring.student
{
    public partial class tutor_report_to_student : System.Web.UI.Page
    {
        int tutor_index;       
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                // 여기에 사용자 코드를 배치하여 페이지를 초기화합니다.
                //맨 처음 페이지를 읽었을 경우 실행할 구문
                OracleConnection conn = new OracleConnection();
                conn.ConnectionString = "data source=lphlox.yu.ac.kr;user id=team204;password=4321";
                OracleCommand comm = new OracleCommand();
                comm.Connection = conn;
                conn.Open();
                comm.CommandText = "select 인덱스 from A_튜터신청현황 where 튜터학번=:ID";
                comm.Parameters.AddWithValue("ID", Session["id"]);
                OracleDataReader odr = comm.ExecuteReader();
                if (odr.HasRows)
                {
                    while (odr.Read())
                    {
                        tutor_index = int.Parse(odr["인덱스"].ToString());                    
                    }

                }             
            }
            else
            {
                //새로고침이 있을 경우(페이지 접근이 처음이 아닐 때)
            }
           
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            OracleConnection conn = new OracleConnection();
            conn.ConnectionString = "data source=lphlox.yu.ac.kr;user id=team204;password=4321";
            OracleCommand comm = new OracleCommand();
            comm.Connection = conn;
            conn.Open();
            


            try
            {                
                comm.CommandText = "insert into A_튜터활동내용 (인덱스, 학생학번, 시작시간, 종료시간,상담내용,결석유무) values (:tutor_Index,:Student_id,TO_DATE(:Sdate,'YYYY-MM-DD HH24:MI'),TO_DATE(:Fdate,'YYYY-MM-DD HH24:MI'),:contents,:absent )";
                comm.Parameters.AddWithValue("tutor_Index", tutor_index);
                comm.Parameters.AddWithValue("Student_id", int.Parse(TextBox3.Text));
                comm.Parameters.AddWithValue("Sdate", TextBox5.Text +" "+ TextBox4.Text);
                comm.Parameters.AddWithValue("Fdate", TextBox5.Text +" "+TextBox2.Text);
                comm.Parameters.AddWithValue("contents", TextBox6.Text);
                comm.Parameters.AddWithValue("absent", DropDownList1.SelectedValue);
                
                int ork =comm.ExecuteNonQuery();
                if (ork == 0)
                {
                    Page.ClientScript.RegisterStartupScript(typeof(Page), "alert", "<script language=javaScript>alert('저장 실패!');</script>");
                }
                else {
                    Page.ClientScript.RegisterStartupScript(typeof(Page), "alert", "<script language=javaScript>alert('저장 성공!');</script>");
                }

                
            }

            finally
            {
                conn.Close();
            }
        }

    
    }
}