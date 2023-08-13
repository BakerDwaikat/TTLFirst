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
    public partial class newEmployee : System.Web.UI.Page
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

                string name = empName.Text;
                string notes = empNotes.Text;
                string login = loginNumber.Text;
                string cell1 = cellular1.Text;
                string cell2 = cellular2.Text;
                string address = empAddress.Text;
                string spec = speciality.Text;
                string dob = formatDate(birthDate.Text);
                bool act = empActive.Checked;
                int active;
                if (act)
                {
                    active = 1;
                } else
                {
                    active = 0;
                }

                string query = "Insert into Employees (Name,regnum,cellone,cell2,address,speciality,dateofbirth,notes,active) VALUES ('" + name + "','" + login + "','" + cell1 + "','" + cell2 + "','" + address + "','" + spec + "','" + dob + "','" + notes + "'," + active + ")"; // Start with a basic query

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

        protected void sendsms_Click(object sender, EventArgs e)
        {

        }
    }
}