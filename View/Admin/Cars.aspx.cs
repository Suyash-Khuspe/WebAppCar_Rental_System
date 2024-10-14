using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppCRMS.View.Admin
{
    public partial class Cars : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            showcars();

        }
        public void clrfield()
        {
            LNoTB.Text = "";
            BrandTB.Text = "";
            ModelTB.Text = "";
            PriceTB.Text = "";
            ColorTB.Text = "";
        }
        public void showcars()
        {
            DataSet ds = GetDataSet();
            carlist.DataSource = ds;
            carlist.DataBind();
        }
        private DataSet GetDataSet()
        {
            SqlConnection con = GetConnection();
            SqlDataAdapter da = new SqlDataAdapter("select * from car_details", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        string constr = "Data Source=DESKTOP-HOUFVO5\\SQLEXPRESS02; Initial Catalog=CRMS; Integrated Security=True";
        public SqlConnection GetConnection()
        {
         return new SqlConnection(constr);   
        }
        protected void Btnadd_Click(object sender, EventArgs e)
        {
            if (LNoTB.Text == "" || BrandTB.Text == "" || ModelTB.Text == "" || PriceTB.Text == "" || ColorTB.Text == "")
            {
                errormsg.Text = "missing information";
            }
            else
            {
                string cno = LNoTB.Text;
                string brand = BrandTB.Text;
                string model = ModelTB.Text;
                int price = int.Parse(PriceTB.Text);
                string color = ColorTB.Text;
                string status = DropDownList1.Text;

                SqlConnection con = GetConnection();
                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("sp_addcar", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@CPlateNum", cno);
                cmd.Parameters.AddWithValue("@Brand", brand);
                cmd.Parameters.AddWithValue("@Model", model);
                cmd.Parameters.AddWithValue("@Price", price);
                cmd.Parameters.AddWithValue("@Color", color);
                cmd.Parameters.AddWithValue("@Cstatus", status);

                int x = cmd.ExecuteNonQuery();
                if (x > 0)
                {
                    errormsg.Text = "Car Added Successfully...!";
                }
                else
                {
                    errormsg.Text = "missing information";
                }
                con.Close();
                showcars();
                clrfield();
            }
            
        }
        

        string key = "";
        protected void carlist_SelectedIndexChanged(object sender, EventArgs e)
        {
            LNoTB.Text = carlist.SelectedRow.Cells[1].Text;
            BrandTB.Text = carlist.SelectedRow.Cells[2].Text;
            ModelTB.Text = carlist.SelectedRow.Cells[3].Text;
            PriceTB.Text = carlist.SelectedRow.Cells[4].Text;
            ColorTB.Text = carlist.SelectedRow.Cells[5].Text;
            DropDownList1.SelectedValue = carlist.SelectedRow.Cells[6].Text;
        }

        protected void Btndelete_Click(object sender, EventArgs e)
        {
            if (LNoTB.Text == "")
            {
                errormsg.Text = "missing information";
            }
            else
            {
                string cno = LNoTB.Text;

                SqlConnection con = GetConnection();
                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("sp_deletecar", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@CPlateNum", cno);

                int x = cmd.ExecuteNonQuery();
                if (x > 0)
                {
                    errormsg.Text = "Car Deleted Successfully...!";
                }
                else
                {
                    errormsg.Text = "missing information";
                }
                con.Close();
                showcars();
                clrfield();
            }
        }

        protected void Btnedit_Click(object sender, EventArgs e)
        {
            if (LNoTB.Text == "" || BrandTB.Text == "" || ModelTB.Text == "" || PriceTB.Text == "" || ColorTB.Text == "")
            {
                errormsg.Text = "missing information";
            }
            else
            {
                string originalCno = carlist.SelectedRow.Cells[1].Text;

                string cno = LNoTB.Text;
                string brand = BrandTB.Text;
                string model = ModelTB.Text;
                int price = int.Parse(PriceTB.Text);
                string color = ColorTB.Text;
                string status = DropDownList1.Text;

                SqlConnection con = GetConnection();
                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("sp_updatecar", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@OriginalCPlateNum", originalCno);
                cmd.Parameters.AddWithValue("@CPlateNum", cno);
                cmd.Parameters.AddWithValue("@Brand", brand);
                cmd.Parameters.AddWithValue("@Model", model);
                cmd.Parameters.AddWithValue("@Price", price);
                cmd.Parameters.AddWithValue("@Color", color);
                cmd.Parameters.AddWithValue("@Cstatus", status);

                int x = cmd.ExecuteNonQuery();
                if (x > 0)
                {
                    errormsg.Text = "Car Edited Successfully...!";
                }
                else
                {
                    errormsg.Text = "Car not Edited";
                }
                con.Close();
                showcars();
                clrfield();
            }
        }
    }
}