using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace WebApplication10.Admin
{
    public partial class AdminPanel : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void fillgrid()
        {
            getcon();

            da = new SqlDataAdapter("select * from Users", con);

            ds = new DataSet();
            da.Fill(ds);

            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillgrid();
            }
        }
        protected void btnAddCompany_Click(object sender, EventArgs e)
        {
            Response.Redirect("add_car_company.aspx");
        }

        protected void btnAddCarProduct_Click(object sender, EventArgs e)
        {
            Response.Redirect("Add_Car_Products.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminLogin.aspx");
        }
        protected void btnWebsite_Click(object sender, EventArgs e)
        {
            Response.Redirect("../WebForm1.aspx");
        }
    }
}