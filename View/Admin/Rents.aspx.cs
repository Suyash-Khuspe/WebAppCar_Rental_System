using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppCRMS.View.Admin
{
    public partial class Rents : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                showrents();
            }
        }
        public void showrents()
        {
            DataSet ds = GetDataSet();
            Rentlist.DataSource = ds;
            Rentlist.DataBind();
        }
        private DataSet GetDataSet()
        {
            SqlConnection con = GetConnection();
            SqlDataAdapter da = new SqlDataAdapter("select * from Rent", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
        string constr = "Data Source=DESKTOP-HOUFVO5\\SQLEXPRESS02; Initial Catalog=CRMS; Integrated Security=True";
        public SqlConnection GetConnection()
        {
            return new SqlConnection(constr);
        }

        string LicensePlate;
        protected void Rentlist_SelectedIndexChanged(object sender, EventArgs e)
        {
            LicensePlate = Rentlist.SelectedRow.Cells[2].Text;
        }

        
        protected void btnrtn_Click(object sender, EventArgs e)
        {
            try
            {
                if (Rentlist.SelectedRow == null)
                {
                    msginfo.Text = "Select a Rent";
                    return;
                }

                int rentid = Convert.ToInt32(Rentlist.SelectedRow.Cells[1].Text);
                string licensePlate = Rentlist.SelectedRow.Cells[2].Text;
                int customerId = Convert.ToInt32(Rentlist.SelectedRow.Cells[3].Text);
                string rentDate = Rentlist.SelectedRow.Cells[4].Text;
                int delay = Convert.ToInt32(DelayTB.Text);
                int fine = Convert.ToInt32(FineTB.Text);

                InsertCarReturn(rentid,licensePlate, customerId, rentDate, delay, fine);

                
                UpdateCarStatus(licensePlate);

                
                DeleteRentRecord(rentid);

                msginfo.Text = "Car returned successfully!";
                showrents();
            }
            catch (Exception ex)
            {
                msginfo.Text = ex.Message;
            }
        }

        private void InsertCarReturn(int rentid, string licensePlate, int customerId, string rentDate, int delay, int fine)
        {
            using (SqlConnection con = GetConnection())
            {
                con.Open();
                string insertCmd = "INSERT INTO CReturn (RentId, Car, Customer, RDate, CDelay, Fine) VALUES (@RentId, @Car, @Customer, @Rentdate, @delay, @fine)";


                using (SqlCommand cmd = new SqlCommand(insertCmd, con))
                {
                    cmd.Parameters.AddWithValue("@RentId", rentid);
                    cmd.Parameters.AddWithValue("@Car", licensePlate);
                    cmd.Parameters.AddWithValue("@Customer", customerId);
                    cmd.Parameters.AddWithValue("@Rentdate", rentDate);
                    cmd.Parameters.AddWithValue("@Delay", delay);
                    cmd.Parameters.AddWithValue("@Fine", fine);

                    cmd.ExecuteNonQuery();
                }
            }
        }

        private void UpdateCarStatus(string licensePlate)
        {
            using (SqlConnection con = GetConnection())
            {
                con.Open();
                string updateCmd = "UPDATE Car_details SET Cstatus = 'Available' WHERE CPlateNum = @LicenseNumber";

                using (SqlCommand cmd = new SqlCommand(updateCmd, con))
                {
                    cmd.Parameters.AddWithValue("@LicenseNumber", licensePlate);
                    cmd.ExecuteNonQuery();
                }
            }
        }

        private void DeleteRentRecord(int rentid)
        {
            using (SqlConnection con = GetConnection())
            {
                con.Open();
                string deleteRentCmd = "DELETE FROM Rent WHERE RentId = @rentid";
                using (SqlCommand cmd = new SqlCommand(deleteRentCmd, con))
                {
                    cmd.Parameters.AddWithValue("@rentid", rentid);
                    cmd.ExecuteNonQuery();

                }
            }
        }
    }
}