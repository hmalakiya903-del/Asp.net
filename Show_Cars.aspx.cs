using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace WebApplication10
{
    public partial class Show_Cars : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;

        string s = ConfigurationManager
                    .ConnectionStrings["dbcon"]
                    .ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                filldata();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void filldata()
        {
            getcon();

            string cid = Request.QueryString["C_Id"];

            da = new SqlDataAdapter(
                "SELECT * FROM Add_Car_Products_tbl " +
                "WHERE CompanyId='" + cid + "'",
                con
            );

            ds = new DataSet();

            da.Fill(ds);

            DataList1.DataSource = ds;
            DataList1.DataBind();

            con.Close();
        }

        protected void btnBookCar_Click(object sender, EventArgs e)
        {
            if (Session["uid"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            Button btn = (Button)sender;

            int carId = Convert.ToInt32(btn.CommandArgument);

            int uid = Convert.ToInt32(Session["uid"]);

            getcon();

            cmd = new SqlCommand(
                "SELECT * FROM Cart_Tbl WHERE Cart_Car_Id='" +
                carId +
                "' AND Cart_User_Id='" +
                uid + "'",
                con
            );

            da = new SqlDataAdapter(cmd);

            ds = new DataSet();

            da.Fill(ds);

            if (ds.Tables[0].Rows.Count == 0)
            {
                cmd = new SqlCommand(
                    "INSERT INTO Cart_Tbl(Cart_Car_Id,Cart_User_Id,Quantity) " +
                    "VALUES('" +
                    carId + "','" +
                    uid + "','1')",
                    con
                );

                cmd.ExecuteNonQuery();
            }

            con.Close();

            Response.Redirect("Add_To_Cart.aspx");
        }
    }
}