using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppCRMS.View.Customer
{
    public partial class CustCars : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            showcars();
            Customer = Login.CustId;
        }

        public void showcars()
        {
            DataSet ds = GetDataSet();
            carlist.DataSource = ds;
            carlist.DataBind();
            lblcname.Text=Login.CName;
        }
        private DataSet GetDataSet()
        {
            string status = "Available";
            SqlConnection con = GetConnection();
            SqlDataAdapter da = new SqlDataAdapter("select * from car_details where Cstatus='"+status+"'", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
        string constr = "Data Source=DESKTOP-HOUFVO5\\SQLEXPRESS02; Initial Catalog=CRMS; Integrated Security=True";
        public SqlConnection GetConnection()
        {
            return new SqlConnection(constr);
        }
        private void UpdateCar(string lno)
        {
            {
                
                SqlConnection con = GetConnection();
                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }
                string status = "Booked";
                string updatecmd = "update car_details set Cstatus=@status where CPlateNum=@LicenseNumber";
                SqlCommand cmd = new SqlCommand(updatecmd, con);

                cmd.Parameters.AddWithValue("@status", status);
                cmd.Parameters.AddWithValue("@LicenseNumber", lno);
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }

        protected void btnbook_Click(object sender, EventArgs e)
        {
            try 
            {
                int DPrice;
                DateTime rentDate;
                DateTime retDate;
                if (carlist.SelectedRow != null)
                {
                    LNoTB = carlist.SelectedRow.Cells[1].Text;
                    lblinfo.Text = "Selected License Plate: " + LNoTB;
                    RentDate = DateTime.Today.Date.ToString();
                    bool isDateValid = DateTime.TryParse(DateTb.Text, out retDate);
                    if (!isDateValid)
                    {
                        lblinfo.Text = "Please enter a valid return date.";
                        return;
                    }
                    RetDate = retDate.ToString("yyyy-MM-dd");
                    DPrice = Convert.ToInt32(carlist.SelectedRow.Cells[4].Text);



                    TimeSpan DDays = retDate - DateTime.Today.Date;
                    int Days = DDays.Days;
                    int Fees = DPrice * Days;

                    if (string.IsNullOrEmpty(LNoTB))
                    {
                        lblinfo.Text = "Car parameter is missing or empty";
                        return;
                    }
                    else
                    {

                        SqlConnection con = GetConnection();
                        if (con.State != ConnectionState.Open)
                        {
                            con.Open();
                        }
                        string insertcmd = "insert into Rent (Car, Customer, Rentdate, Returndate, Fees) values (@Car, @Customer, @Rentdate, @Returndate, @Fees)";
                        SqlCommand cmd = new SqlCommand(insertcmd, con);

                        cmd.Parameters.AddWithValue("@Car", LNoTB);
                        cmd.Parameters.AddWithValue("@Customer", Customer);
                        cmd.Parameters.AddWithValue("@Rentdate", RentDate);
                        cmd.Parameters.AddWithValue("@Returndate", RetDate);
                        cmd.Parameters.AddWithValue("@Fees", Fees);

                        int x = cmd.ExecuteNonQuery();
                        if (x > 0)
                        {
                            lblinfo.Text = "Car Rented";

                        }
                        else
                        {
                            lblinfo.Text = "Car not Rented";
                        }

                        con.Close();
                        UpdateCar(LNoTB);
                        showcars();
                    }
                }
            }
            catch(Exception ex)
            {
                lblinfo.Text = ex.Message;
            }
        }

        string LNoTB;
        string RentDate, RetDate;
        int DPrice,Customer;
       
        protected void carlist_SelectedIndexChanged(object sender, EventArgs e)
        {
            LNoTB = carlist.SelectedRow.Cells[1].Text;
            RentDate = DateTime.Today.Date.ToString("yyy-mm-dd");
            DateTime retDate;
            bool isDateValid = DateTime.TryParse(DateTb.Text, out retDate);
            if (isDateValid)
            {
                RetDate = retDate.ToString("yyyy-MM-dd");
            }
            else
            {
                RetDate = "";
            }

            DPrice = Convert.ToInt32(carlist.SelectedRow.Cells[4].Text);
        }
    }
}