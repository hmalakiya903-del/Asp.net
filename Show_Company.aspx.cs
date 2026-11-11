using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication10
{
    public partial class Show_Company : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                showcompany();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void showcompany()
        {
            getcon();

            da = new SqlDataAdapter("select * from CarCompany", con);

            ds = new DataSet();

            da.Fill(ds);

            DataList1.DataSource = ds;
            DataList1.DataBind();

            con.Close();
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "cmd_cid")
            {
                Response.Redirect("Show_Cars.aspx?C_Id=" + e.CommandArgument.ToString());
            }
        }
    }
}