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
                string insertcmd = "insert into customer values (@cname,@add,@phone,@pass)";
                SqlCommand cmd = new SqlCommand(insertcmd, con);
                cmd.Parameters.AddWithValue("@cname", cname);
                cmd.Parameters.AddWithValue("@add", add);
                cmd.Parameters.AddWithValue("@phone", phone);
                cmd.Parameters.AddWithValue("@pass", pass);
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
                key = Convert.ToInt32(custlist.SelectedRow.Cells[1].Text);
                SqlConnection con = GetConnection();
                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }
                string deletecmd = "delete from Customer where custid=@cid";
                SqlCommand cmd = new SqlCommand(deletecmd, con);
                cmd.Parameters.AddWithValue("@cid", Convert.ToInt32(key));

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
                string originalCid = custlist.SelectedRow.Cells[1].Text;

                string cname = CustNameTb.Text;
                string add = AddTb.Text;
                string phone = PhoneTb.Text;
                string pass = PassTb.Text;

                SqlConnection con = GetConnection();
                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }
                string editcmd = "update customer set CustName=@cname,CustAdd=@add,CustPhone=@phone,CustPassword=@pass where Custid=@originalCid";
                SqlCommand cmd = new SqlCommand(editcmd, con);
                cmd.Parameters.AddWithValue("@cname", cname);
                cmd.Parameters.AddWithValue("@add", add);
                cmd.Parameters.AddWithValue("@phone", phone);
                cmd.Parameters.AddWithValue("@pass", pass);
                cmd.Parameters.AddWithValue("@originalCid", originalCid);

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