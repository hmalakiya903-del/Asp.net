using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication10.Admin
{
    public partial class Add_Car_Products : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;

        string fnm;

        string s = ConfigurationManager
                    .ConnectionStrings["dbcon"]
                    .ConnectionString;

        void getCon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void clear()
        {
            pnm.Text = "";
            pmdl.Text = "";
            pdecs.Text = "";
            txtPrice.Text = "";
            txtSeats.Text = "";

            drpcid.SelectedIndex = 0;
            drpFuel.SelectedIndex = 0;
            drpTransmission.SelectedIndex = 0;
        }

        void fileUpload()
        {
            if (fimg.HasFile)
            {
                fnm = "Car_Images/" + fimg.FileName;

                string path = Server.MapPath("~/" + fnm);

                fimg.SaveAs(path);
            }
        }

        void fillCombo()
        {
            getCon();

            da = new SqlDataAdapter(
                "SELECT * FROM CarCompany",
                con
            );

            ds = new DataSet();

            da.Fill(ds);

            drpcid.Items.Clear();

            drpcid.Items.Add("--Select Company--");

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                drpcid.Items.Add(
                    ds.Tables[0].Rows[i]["CompanyName"].ToString()
                );
            }

            con.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (drpcid.SelectedIndex == 0)
            {
                Label1.Text = "Please Select Company";
                return;
            }

            if (!fimg.HasFile)
            {
                Label1.Text = "Please Select Car Image";
                return;
            }

            getCon();

            fileUpload();

            da = new SqlDataAdapter(
                "SELECT * FROM CarCompany WHERE CompanyName='" +
                drpcid.SelectedItem.Text + "'",
                con
            );

            ds = new DataSet();

            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                int cid = Convert.ToInt32(
                    ds.Tables[0].Rows[0]["C_Id"]
                );

                cmd = new SqlCommand(
                "INSERT INTO Add_Car_Products_tbl " +
                "(CompanyId, CarName, CarModel, CarDescription, PricePerDay, FuelType, Transmission, NumberOfSeats, CarImage) " +
                "VALUES (" +
                "'" + cid + "'," +
                "'" + pnm.Text + "'," +
                "'" + pmdl.Text + "'," +
                "'" + pdecs.Text + "'," +
                "'" + txtPrice.Text + "'," +
                "'" + drpFuel.SelectedItem.Text + "'," +
                "'" + drpTransmission.SelectedItem.Text + "'," +
                "'" + txtSeats.Text + "'," +
                "'" + fnm + "'" +
                ")",
                con
                );

                cmd.ExecuteNonQuery();

                Label1.Text = "Car Added Successfully!";

                clear();
            }

            con.Close();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillCombo();
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("add_car_company.aspx");
        }
    }
}