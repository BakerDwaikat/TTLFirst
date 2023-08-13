using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Configuration;

namespace TestingProject
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.RemoveAll();
        }

        protected void LoginBtn_Click(object sender, EventArgs e)
        {
            alert.CssClass = "alert alert-danger alert-dismissible bg-danger text-white border-0 fade show";
            string connStr = ConfigurationManager.ConnectionStrings["one"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            String user = username.Text;
            String pass = password.Text;
            String query = "SELECT * from Credentials where username = '" + user + "' and password = '" + pass + "'";
            SqlCommand sqlCommand = new SqlCommand(query, conn);
            conn.Open();

            SqlDataReader reader = sqlCommand.ExecuteReader();

            reader.Read();
            if (reader.HasRows)
            {
                Session["username"] = user;
                Response.Redirect("Schedule.aspx");
            }
        }
    }
}
