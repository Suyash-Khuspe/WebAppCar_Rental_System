using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppCRMS.View
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        string constr = "Data Source=DESKTOP-HOUFVO5\\SQLEXPRESS02; Initial Catalog=CRMS; Integrated Security=True";
        public SqlConnection GetConnection()
        {
            return new SqlConnection(constr);
        }

        public static string CName = "";
        public static int CustId;
        protected void btnlogin_Click(object sender, EventArgs e)
        {
            if(AdminRadio.Checked)
            {
                if(UserNameTb.Text=="Admin" && PassTb.Text == "Admin123")
                {
                    CName = "Admin";
                    Response.Redirect("Admin/Home.aspx");
                    
                }
                else
                {
                    msginfo.Text = "Invalid Admin...!!";
                }

            }
            else
            {
                SqlConnection con = GetConnection();
                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }
                string checkcmd = "Select CustName,CustPassword,Custid from Customer where CustName=@cname AND CustPassword=@cpass";
                SqlCommand cmd = new SqlCommand(checkcmd, con);
                cmd.Parameters.AddWithValue("@cname", UserNameTb.Text);
                cmd.Parameters.AddWithValue("@cpass", PassTb.Text);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count == 0)
                {
                    msginfo.Text = "Invalid Customer...!!";
                }
                else
                {
                    CName = dt.Rows[0]["CustName"].ToString();
                    CustId = Convert.ToInt32(dt.Rows[0]["CustId"].ToString());
                    Session["CustName"] = CName;
                    Response.Redirect("Customer/CustCars.aspx");
                }
                con.Close();

            }
        }
    }
}