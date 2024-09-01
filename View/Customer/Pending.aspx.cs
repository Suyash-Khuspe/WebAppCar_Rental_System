using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppCRMS.View.Customer
{
    public partial class Pending : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            showcars();
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
            SqlDataAdapter da = new SqlDataAdapter("select * from Rent where Customer='" + Login.CustId + "'", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
        string constr = "Data Source=DESKTOP-HOUFVO5\\SQLEXPRESS02; Initial Catalog=CRMS; Integrated Security=True";
        public SqlConnection GetConnection()
        {
            return new SqlConnection(constr);
        }
    }
}