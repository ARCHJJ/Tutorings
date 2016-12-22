using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Tutoring.professor
{
    public partial class tutor_evaluate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            int index = Int32.Parse(row.Cells[0].Text);
            int tutor_id = Int32.Parse(row.Cells[5].Text);
            Response.Redirect(string.Format("evaluating.aspx?index="+index+"&tutor_id="+tutor_id));
        }
    }
}