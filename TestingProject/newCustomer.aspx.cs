using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TestingProject
{
    public partial class newCustomer : System.Web.UI.Page
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

                string name = custName.Text;
                string notes = custNotes.Text;
                string age = custAge.Text;
                string cell1 = cellular1.Text;
                string cell2 = cellular2.Text;
                string address = custAddress.Text;
                string dob = formatDate(birthDate.Text);

                string query = "Insert into Customer (Name,age,cellone,cell2,address,dateofbirth,notes) VALUES ('" + name + "'," + age + ",'" + cell1 + "','" + cell2 + "','" + address  + "','" + dob + "','" + notes + "')"; // Start with a basic query

                SqlCommand command = new SqlCommand(query, connection);

                command.ExecuteNonQuery();

                alert.CssClass = "alert alert-success alert-dismissible bg-success text-light border-0 fade show";
            }
        }
        private string formatDate(string date)
        {
            string MM = date.Split('/')[0];
            string DD = date.Split('/')[1];
            string YY = date.Split('/')[2];

            return YY + "-" + MM + "-" + DD;
        }
    }
}