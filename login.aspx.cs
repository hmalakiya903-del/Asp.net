using System;
using System.Configuration;
using System.Data.SqlClient;

namespace WebApplication10
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (txtEmail.Text == "admin" && txtPassword.Text == "admin123")
            {
                Session["admin"] = "admin";

                Response.Redirect("Admin/AdminPanel.aspx");
            }
            else
            {
                getcon();

                cmd = new SqlCommand(
                    "select * from Users where Email='" +
                    txtEmail.Text +
                    "' and Password='" +
                    txtPassword.Text + "'",
                    con
                );

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    dr.Read();

                    Session["uid"] = dr["Id"].ToString();
                    Session["UserName"] = dr["FullName"].ToString();
                    Session["UserEmail"] = dr["Email"].ToString();

                    Response.Redirect("WebForm1.aspx");
                }
                else
                {
                    lblMessage.Text = "Invalid Email or Password";
                }

                con.Close();
            }
        }
    }
}