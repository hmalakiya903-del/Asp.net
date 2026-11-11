
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication10
{
    public partial class WebForm1 : System.Web.UI.Page
    {

        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;
        string fnm;

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            fillgrid();

        }

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

        void clear()
        {
            txtFullName.Text = "";
            txtEmail.Text = "";
            txtPhone.Text = "";
            txtPassword.Text = "";

        }


        protected void btnRegister_Click(object sender, EventArgs e)
        {

            getcon();
            cmd = new SqlCommand("insert into Users(FullName,Email,Phone,Password) values('" + txtFullName.Text + "','" + txtEmail.Text + "','" + txtPhone.Text + "','" + txtPassword.Text + "')", con);
            cmd.ExecuteNonQuery();
            fillgrid();
            clear();

            Response.Redirect("WebForm1.aspx");

        }

        protected void gvUsers_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            fillgrid();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            fillgrid();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

            TextBox t1 = (TextBox)GridView1.Rows[e.RowIndex].Cells[1].Controls[0];
            TextBox t2 = (TextBox)GridView1.Rows[e.RowIndex].Cells[2].Controls[0];
            TextBox t3 = (TextBox)GridView1.Rows[e.RowIndex].Cells[3].Controls[0];
            TextBox t4 = (TextBox)GridView1.Rows[e.RowIndex].Cells[4].Controls[0];

            getcon();

            cmd = new SqlCommand("update Users set FullName='" + t1.Text + "',Email='" + t2.Text + "',Phone='" + t3.Text + "',Password='" + t4.Text + "' where Id=" + id, con);

            cmd.ExecuteNonQuery();

            GridView1.EditIndex = -1;

            fillgrid();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

            getcon();

            cmd = new SqlCommand("delete from Users where Id=" + id, con);

            cmd.ExecuteNonQuery();

            fillgrid();
        }
    }
}

