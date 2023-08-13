using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.EnterpriseServices.CompensatingResourceManager;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TestingProject
{
    public partial class WebForm2 : System.Web.UI.Page
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
                FillServices();
            }
        }

        protected void visited_Click(object sender, EventArgs e)
        {
            
            visited.CssClass = "btn btn-outline-primary active m-1";
            certain.CssClass = "btn btn-outline-primary m-1";
            initial.CssClass = "btn btn-outline-primary m-1";
        }

        protected void certain_Click(object sender, EventArgs e)
        {
            visited.CssClass = "btn btn-outline-primary m-1";
            certain.CssClass = "btn btn-outline-primary active m-1";
            initial.CssClass = "btn btn-outline-primary m-1";
        }

        protected void initial_Click(object sender, EventArgs e)
        {
           
            visited.CssClass = "btn btn-outline-primary m-1";
            certain.CssClass = "btn btn-outline-primary m-1";
            initial.CssClass = "btn btn-outline-primary active m-1";
        }
        private string formatDate(string date)
        {
            string MM = date.Split('/')[0];
            string DD = date.Split('/')[1];
            string YY = date.Split('/')[2];

            return YY + "-" + MM + "-" + DD;
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

                reader2 = command2.ExecuteReader();
                EmployeeDropList2.DataSource = reader2;
                EmployeeDropList2.DataValueField = "name"; // Corresponding value
                EmployeeDropList2.DataBind();

                reader2.Close();

                string query3 = "SELECT name FROM Customer";
                SqlCommand command3 = new SqlCommand(query3, connection);
                SqlDataReader reader3 = command3.ExecuteReader();

                customerDropList.DataSource = reader3;
                customerDropList.DataValueField = "name"; // Corresponding value
                customerDropList.DataBind();

                reader3.Close();
            }

            ListItem serv = new ListItem("اختر نوع الجلسة", "0");
            serv.Selected = true;
            serv.Attributes.Add("hidden", "hidden");

            ListItem emp = new ListItem("اختر المعالج/ة", "0");
            emp.Selected = true;
            emp.Attributes.Add("hidden", "hidden");
            // Add a default item if needed
            ServicesDropList.Items.Insert(0, serv);

            EmployeeDropList.Items.Insert(0, emp);

            EmployeeDropList2.Items.Insert(0, emp);
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
            string Name = customerDropList.Text;

            String query = "SELECT * from Visits where Customer = '" + Name + "'";
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

        protected void save_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["one"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string name = customerDropList.Text;
                string notes = visitNotes.Text;
                string day = dayInput.Text;
                string time = timepicker2.Text;
                string service = ServicesDropList.Text;
                string emp = EmployeeDropList.Text;
                string price = priceInput.Text;
                string paid = paidInput.Text;
                string left = leftInput.Text;
                string typeofresevation = getActive();
                HttpPostedFile pic = fileUpload.PostedFile;
                string picture = uploadFile(pic);
                string dor = formatDate(birthDate.Text);


                string query = "insert into Visits (Customer,Date,time,Service,employee,Notes,price,paid,rest,type,picture) values (N'" + name + "','" + dor + "','" + time + "',N'" + service + "',N'" + emp + "',N'" + notes + "'," + price + "," + paid + "," + left + ",N'" + typeofresevation + "','" + picture + "')";

                SqlCommand command = new SqlCommand(query, connection);
                command.ExecuteNonQuery();

                alert.CssClass = "alert alert-success alert-dismissible bg-success text-light border-0 fade show";
            }
        }

        protected void Previous_Click(object sender, EventArgs e)
        {
            bindGridView();
        }

        protected void customernName_TextChanged(object sender, EventArgs e)
        {

        }

        protected void customerDropList_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected string getActive()
        {
            if (visited.CssClass.Contains("active"))
            {
                return "visited";
            }
            else if (certain.CssClass.Contains("active"))
            {
                return "certain";
            }
            else if (initial.CssClass.Contains("active"))
            {
                return "initial";
            }
            return "";
        }

        protected void ServicesDropList_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void EmployeeDropList_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void paidInput_TextChanged(object sender, EventArgs e)
        {

        }

        private string uploadFile(HttpPostedFile file)
        {
                try
                {
                    string uploadsFolder = Server.MapPath("~/Uploads/");
                    string fileName = Path.GetFileName(file.FileName);
                    string filePath = Path.Combine(uploadsFolder, fileName);

                    // Check if the directory exists, and create it if not
                    if (!Directory.Exists(uploadsFolder))
                    {
                        Directory.CreateDirectory(uploadsFolder);
                    }

                    file.SaveAs(filePath);
                    return filePath;
                }
                catch (Exception ex)
                {
                }
            return "";
        }
    }
}