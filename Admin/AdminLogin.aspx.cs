
using System;
using System.Web.UI;

namespace WebApplication10.Admin
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (txtUsername.Text == "admin" && txtPassword.Text == "admin123")
            {
                Response.Redirect("AdminPanel.aspx");
            }
            else
            {
                lblMessage.Text = "Invalid Username or Password";
            }
        }
        protected void btnWebsite_Click(object sender, EventArgs e)
        {
            Response.Redirect("../WebForm1.aspx");
        }
    }

}
