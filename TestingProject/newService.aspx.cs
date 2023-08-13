using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TestingProject
{
    public partial class newService : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void save_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["one"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string name = serviceName.Text;
                string notes = serviceNotes.Text;
                string price = servicePrice.Text;

                string query = "Insert into Services (name,price,notes) VALUES ('" + name + "'," + price + ",'" + notes + "')"; // Start with a basic query

                SqlCommand command = new SqlCommand(query, connection);

                command.ExecuteNonQuery();

                alert.CssClass = "alert alert-success alert-dismissible bg-success text-light border-0 fade show";
            }
        }
    }
}