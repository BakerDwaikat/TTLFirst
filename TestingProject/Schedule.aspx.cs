using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TestingProject
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        System.Data.DataTable dt = new System.Data.DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("Default.aspx");
            }

            if (!IsPostBack)
            {
                bindGridView();
                FillServices();
                all.CssClass = "btn btn-outline-primary active m-1";
            }
            

        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            bindGridView(); //bindgridview will get the data source and bind it again
        }

        private void bindGridView()
        {
            string connStr = ConfigurationManager.ConnectionStrings["one"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);

            String query = "SELECT * from Visits";
            SqlCommand sqlCommand = new SqlCommand(query, conn);
            conn.Open();

            SqlDataReader reader = sqlCommand.ExecuteReader();

           
                dt.Columns.AddRange(new System.Data.DataColumn[10] {
                new System.Data.DataColumn("Customer"),
                new System.Data.DataColumn("Date"),
                new System.Data.DataColumn("time"),
                new System.Data.DataColumn("Service"),
                new System.Data.DataColumn("employee"),
                new System.Data.DataColumn("Notes"),
                new System.Data.DataColumn("price"),
                new System.Data.DataColumn("paid"),
                new System.Data.DataColumn("rest"),
                new System.Data.DataColumn("picture")});

                while (reader.Read())
                {
                    DataRow row = dt.NewRow();
                    row["Customer"] = reader["Customer"];
                    row["Date"] = reader["Date"];
                    row["time"] = reader["time"];
                    row["Service"] = reader["Service"];
                    row["employee"] = reader["employee"];
                    row["Notes"] = reader["Notes"];
                    row["price"] = reader["price"];
                    row["paid"] = reader["paid"];
                    row["rest"] = reader["rest"];
                    row["picture"] = reader["picture"];
                    dt.Rows.Add(row);
                }
                GridView1.DataSource = dt;
                GridView1.DataBind();
                conn.Close();
            }

        protected void refreshTable_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["one"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                String fromDate = formatDate(fromDatePicker.Text);
                String toDate = formatDate(toDatePicker.Text);
                String service = ServicesDropList.Text;
                String employee = EmployeeDropList.Text;
                String typeOfReservation = getActive();

                string query = "SELECT * FROM Visits WHERE 1=1"; // Start with a basic query

                // Apply filters based on parameters
                if (!string.IsNullOrEmpty(fromDate))
                {
                    query += " AND Date >= @FromDate";
                }

                if (!string.IsNullOrEmpty(toDate))
                {
                    query += " AND Date <= @ToDate";
                }

                if (!string.IsNullOrEmpty(service) && service != "0")
                {
                    query += " AND Service = @Service";
                }

                if (!string.IsNullOrEmpty(employee) && employee != "0")
                {
                    query += " AND employee = @Employee";
                }

                if (!string.IsNullOrEmpty(typeOfReservation) && typeOfReservation != "all")
                {
                    query += " AND type = @TypeOfReservation";
                }

                SqlCommand command = new SqlCommand(query, connection);

                // Add parameter values
                if (!string.IsNullOrEmpty(fromDate))
                {
                    command.Parameters.AddWithValue("@FromDate", fromDate);
                }

                if (!string.IsNullOrEmpty(toDate))
                {
                    command.Parameters.AddWithValue("@ToDate", toDate);
                }

                if (!string.IsNullOrEmpty(service) || service != "0")
                {
                    command.Parameters.AddWithValue("@Service", service);
                }

                if (!string.IsNullOrEmpty(employee) || employee != "0")
                {
                    command.Parameters.AddWithValue("@Employee", employee);
                }

                if (!string.IsNullOrEmpty(typeOfReservation) || typeOfReservation == "all")
                {
                    command.Parameters.AddWithValue("@TypeOfReservation", typeOfReservation);
                }

                dt.Columns.AddRange(new System.Data.DataColumn[10] {
                new System.Data.DataColumn("Customer"),
                new System.Data.DataColumn("Date"),
                new System.Data.DataColumn("time"),
                new System.Data.DataColumn("Service"),
                new System.Data.DataColumn("employee"),
                new System.Data.DataColumn("Notes"),
                new System.Data.DataColumn("price"),
                new System.Data.DataColumn("paid"),
                new System.Data.DataColumn("rest"),
                new System.Data.DataColumn("picture")});

                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    DataRow row = dt.NewRow();
                    row["Customer"] = reader["Customer"];
                    row["Date"] = reader["Date"];
                    row["time"] = reader["time"];
                    row["Service"] = reader["Service"];
                    row["employee"] = reader["employee"];
                    row["Notes"] = reader["Notes"];
                    row["price"] = reader["price"];
                    row["paid"] = reader["paid"];
                    row["rest"] = reader["rest"];
                    row["picture"] = reader["picture"];
                    dt.Rows.Add(row);
                }
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }

        }
        private void FillServices()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["one"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT name FROM Services";
                SqlCommand command = new SqlCommand(query, connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                ServicesDropList.DataSource = reader;
                ServicesDropList.DataValueField = "name"; // Corresponding value
                ServicesDropList.DataBind();

                reader.Close();

                // Add a default item if needed

                string query2 = "SELECT name FROM Employees";
                SqlCommand command2 = new SqlCommand(query2, connection);
                SqlDataReader reader2 = command2.ExecuteReader();
                EmployeeDropList.DataSource = reader2;
                EmployeeDropList.DataValueField = "name"; // Corresponding value
                EmployeeDropList.DataBind();

                reader2.Close();
            }

            ListItem serv = new ListItem("اختر نوع الجلسة", "0");
            serv.Selected = true;
            serv.Attributes.Add("hidden","hidden");

            ListItem emp = new ListItem("اختر المعالج/ة", "0");
            emp.Selected = true;
            emp.Attributes.Add("hidden", "hidden");
            // Add a default item if needed
            ServicesDropList.Items.Insert(0, serv);

            EmployeeDropList.Items.Insert(0,emp);
        }

        protected void all_Click(object sender, EventArgs e)
        {
            all.CssClass = "btn btn-outline-primary active m-1";
            visited.CssClass = "btn btn-outline-primary m-1";
            certain.CssClass = "btn btn-outline-primary m-1";
            initial.CssClass = "btn btn-outline-primary m-1";
        }

        protected void visited_Click(object sender, EventArgs e)
        {
            all.CssClass = "btn btn-outline-primary m-1";
            visited.CssClass = "btn btn-outline-primary active m-1";
            certain.CssClass = "btn btn-outline-primary m-1";
            initial.CssClass = "btn btn-outline-primary m-1";
        }

        protected void certain_Click(object sender, EventArgs e)
        {
            all.CssClass = "btn btn-outline-primary m-1";
            visited.CssClass = "btn btn-outline-primary m-1";
            certain.CssClass = "btn btn-outline-primary active m-1";
            initial.CssClass = "btn btn-outline-primary m-1";
        }

        protected void initial_Click(object sender, EventArgs e)
        {
            all.CssClass = "btn btn-outline-primary m-1";
            visited.CssClass = "btn btn-outline-primary m-1";
            certain.CssClass = "btn btn-outline-primary m-1";
            initial.CssClass = "btn btn-outline-primary active m-1";
        }

        protected string getActive()
        {
            if (all.CssClass.Contains("active"))
            {
                return "all";
            } else if (visited.CssClass.Contains("active"))
            {
                return "visited";
            } else if (certain.CssClass.Contains("active")){
                return "certain";
            } else if (initial.CssClass.Contains("active"))
            {
                return "initial";
            }
            return "";
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
