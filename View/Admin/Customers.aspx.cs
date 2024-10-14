using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppCRMS.View.Admin
{
    public partial class Customers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            showcust();
        }
        public void clrfield()
        {
            CustNameTb.Text = "";
            AddTb.Text = "";
            PhoneTb.Text = "";
            PassTb.Text = "";
        }
        private DataSet GetDataSet()
        {
            SqlConnection con = GetConnection();
            SqlDataAdapter da = new SqlDataAdapter("select * from customer", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
        public void showcust()
        {
            DataSet ds = GetDataSet();
            custlist.DataSource = ds;
            custlist.DataBind();
        }

        string constr = "Data Source=DESKTOP-HOUFVO5\\SQLEXPRESS02; Initial Catalog=CRMS; Integrated Security=True";
        public SqlConnection GetConnection()
        {
            return new SqlConnection(constr);
        }

        protected void Btnadd_Click(object sender, EventArgs e)
        {
           if (CustNameTb.Text == "" || AddTb.Text == "" || PhoneTb.Text == "" || PassTb.Text == "")
            {
                errormsg.Text = "missing information";
            }
            else
            {
                string cname = CustNameTb.Text;
                string add = AddTb.Text;
                string phone = PhoneTb.Text;
                string pass = PassTb.Text;

                SqlConnection con = GetConnection();
                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("sp_addcustomer", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@CustName", cname);
                cmd.Parameters.AddWithValue("@CustAdd", add);
                cmd.Parameters.AddWithValue("@CustPhone", phone);
                cmd.Parameters.AddWithValue("@CustPassword", pass);

                int x = cmd.ExecuteNonQuery();
                if (x > 0)
                {
                    errormsg.Text = "Customer Added Successfully...!";
                }
                else
                {
                    errormsg.Text = "Customer not Added";
                }
                con.Close();
                showcust();
                clrfield();
            }
        }
        int key = 0;
        protected void carlist_SelectedIndexChanged(object sender, EventArgs e)
        {
            CustNameTb.Text = custlist.SelectedRow.Cells[2].Text;
            AddTb.Text = custlist.SelectedRow.Cells[3].Text;
            PhoneTb.Text = custlist.SelectedRow.Cells[4].Text;
            PassTb.Text = custlist.SelectedRow.Cells[5].Text;
            if (CustNameTb.Text == "")
            {
                key = 0;
            }
            else
            {
                key = Convert.ToInt32(custlist.SelectedRow.Cells[1].Text);
            }

        }

        protected void Btndelete_Click(object sender, EventArgs e)
        {
            if (CustNameTb.Text == "")
            {
                errormsg.Text = "missing information";
            }
            else
            {
               
                int custid = Convert.ToInt32(custlist.SelectedRow.Cells[1].Text);
                SqlConnection con = GetConnection();
                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("sp_deletecustomer", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Custid", custid);

                int x = cmd.ExecuteNonQuery();
                if (x > 0)
                {
                    errormsg.Text = "Customer Deleted Successfully...!";
                }
                else
                {
                    errormsg.Text = "Customer not deleted...!!";
                }
                con.Close();
                showcust();
                clrfield();
            }
        }

        protected void Btnedit_Click(object sender, EventArgs e)
        {
            if (CustNameTb.Text == "" || AddTb.Text == "" || PhoneTb.Text == "" || PassTb.Text == "")
            {
                errormsg.Text = "missing information";
            }
            else
            {
                int custid = Convert.ToInt32(custlist.SelectedRow.Cells[1].Text);
                string cname = CustNameTb.Text;
                string add = AddTb.Text;
                string phone = PhoneTb.Text;
                string pass = PassTb.Text;

                SqlConnection con = GetConnection();
                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("sp_updatecustomer", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Custid", custid);
                cmd.Parameters.AddWithValue("@CustName", cname);
                cmd.Parameters.AddWithValue("@CustAdd", add);
                cmd.Parameters.AddWithValue("@CustPhone", phone);
                cmd.Parameters.AddWithValue("@CustPassword", pass);

                int x = cmd.ExecuteNonQuery();
                if (x > 0)
                {
                    errormsg.Text = "Customer Edited Successfully...!";
                }
                else
                {
                    errormsg.Text = "Customer not Edited";
                }
                con.Close();
                showcust();
                clrfield();
            }
        }
    
    }
}