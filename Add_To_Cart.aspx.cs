using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace WebApplication10
{
    public partial class Add_To_Cart : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;

        int uid;

        string s = ConfigurationManager
                    .ConnectionStrings["dbcon"]
                    .ConnectionString;

        void getCon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uid"] == null)
            {
                Label5.Text = "UID Session Not Found";
                return;
            }

            uid = Convert.ToInt32(Session["uid"]);

            if (!IsPostBack)
            {
                Label5.Text = "Welcome, " + Session["UserName"].ToString();

                fillCartDataList();
            }
        }

        void fillCartDataList()
        {
            getCon();

            string query =
                "SELECT c.Cart_Id, p.Id, p.CarImage, p.CarName, " +
                "p.CarModel, p.PricePerDay, c.Quantity " +
                "FROM Add_Car_Products_tbl p " +
                "INNER JOIN Cart_Tbl c ON p.Id = c.Cart_Car_Id " +
                "WHERE c.Cart_User_Id = '" + uid + "'";

            da = new SqlDataAdapter(query, con);

            ds = new DataSet();

            da.Fill(ds);

            GridView1.DataSource = ds;
            GridView1.DataBind();

            decimal total = 0;

            foreach (DataRow row in ds.Tables[0].Rows)
            {
                decimal price =
                    Convert.ToDecimal(row["PricePerDay"]);

                int quantity =
                    Convert.ToInt32(row["Quantity"]);

                total += price * quantity;
            }

            grand_total.Text = "Rs. : " + total.ToString();

            con.Close();
        }

        protected void GridView1_RowCommand(
            object sender,
            GridViewCommandEventArgs e)
        {

        }

        protected void GridView1_RowEditing(
            object sender,
            GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;

            fillCartDataList();
        }

        protected void GridView1_RowUpdating(
            object sender,
            GridViewUpdateEventArgs e)
        {
            int carid =
                Convert.ToInt32(
                    GridView1.DataKeys[e.RowIndex].Value
                );

            GridViewRow row =
                GridView1.Rows[e.RowIndex];

            DropDownList ddlqty =
                (DropDownList)row.FindControl(
                    "DropDownList1"
                );

            int qty =
                Convert.ToInt32(
                    ddlqty.SelectedValue
                );

            getCon();

            cmd = new SqlCommand(
                "UPDATE Cart_Tbl SET Quantity = '" + qty +
                "' WHERE Cart_Car_Id = '" + carid +
                "' AND Cart_User_Id = '" + uid + "'",
                con
            );

            cmd.ExecuteNonQuery();

            GridView1.EditIndex = -1;

            fillCartDataList();

            con.Close();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}