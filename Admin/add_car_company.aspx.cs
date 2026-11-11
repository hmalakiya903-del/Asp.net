using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication10.Admin
{
    public partial class add_car_company : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;
        string fnm;

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void imgupload()
        {
            fnm = "~/Car_Company_Images/" + fuCompanyLogo.FileName;
            fuCompanyLogo.SaveAs(Server.MapPath(fnm));
        }

        void clear()
        {
            txtCompanyName.Text = "";
            txtCompanyDescription.Text = "";
        }

        protected void btnAddCompany_Click(object sender, EventArgs e)
        {
            getcon();

            imgupload();

            cmd = new SqlCommand("insert into CarCompany(CompanyName,CompanyDescription,CompanyLogo) values('" + txtCompanyName.Text + "','" + txtCompanyDescription.Text + "','" + fnm + "')", con);

            cmd.ExecuteNonQuery();

            clear();

            Label1.Text = "Company Added Successfully!";

            con.Close();
        }
    }
}