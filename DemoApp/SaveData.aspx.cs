using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Text.RegularExpressions;

namespace DemoApp
{
    public partial class SaveData : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
              
                ddGender.DataBind();
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)

        {

            string connetionString;
            SqlConnection cnn;

            connetionString = @"Data Source=RISHIKA-PC;Initial Catalog=EmployeeDB ;User ID=RAMU;Password=rishikabb";
            //connetionString = @"Data Source=Localhost;Initial Catalog=EmployeeDB ;User ID=RAMU;Password=rishikabb";
            cnn = new SqlConnection(connetionString);

            cnn.Open();

            //Response.Write("Connection made");

            //SqlCommand cmd = new SqlCommand("insert into  Employees (FirstName,LastName)    values('" + txtFistName.Text + "','" + txtLastName.Text + "')", cnn);

            if (!Regex.IsMatch(txtSalary.Text,@"(^([0-9]*|\d*\d{1}?\d*)$)"))
            {
                lblMsg.Text = "Please enter only numbers  in Salary field";
            }
            else
            {

                if (txtFistName.Text == "")
                {
                    lblMsg.Text = "Please Enter First Name ";
                }
                else
                {
                    if (txtLastName.Text == "")
                    {
                        lblMsg.Text = "Please Enter Last Name ";
                    }
                    else
                    {
                        if (txtSalary.Text == "")
                        {
                            lblMsg.Text = "Please Enter Salary ";
                        }
                        else
                        {
                            SqlCommand cmd = new SqlCommand("insert into  Employees (FirstName,LastName,Gender,salary)    values('" + txtFistName.Text + "','" + txtLastName.Text + "' ,'" + ddGender.SelectedValue + "' ," + txtSalary.Text + ")", cnn);
                            cmd.ExecuteNonQuery();
                            lblMsg.Text = "Your data inserted successfully";
                        }                       
                    }                   
                }

            }
            cnn.Close();
            lblMsg.Visible = true;
            lblMsg.ForeColor = System.Drawing.Color.Red;
          
            txtFistName.Text = "";
            txtLastName.Text = "";
            txtSalary.Text = "";
            GridView1.Visible = false;
            //txtGender.Text = "";
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnGetData_Click(object sender, EventArgs e)
        {

            lblMsg.Text = "";
            GridView1.Visible = true;
            string connetionString;
            SqlConnection cnn;
            SqlDataAdapter da = null;
            DataSet ds = null;

            connetionString = @"Data Source=RISHIKA-PC;Initial Catalog=EmployeeDB ;User ID=RAMU;Password=rishikabb";

            cnn = new SqlConnection(connetionString);

            cnn.Open();

            if (txtSearch.Text == "")
            {
               da = new SqlDataAdapter("Select * From Employees ", cnn);
            }
            else
          
            {
                if (!Regex.IsMatch(txtSearch.Text, @"(^([0-9]*|\d*\d{1}?\d*)$)"))
                {

                    da = new SqlDataAdapter("Select * From Employees where FirstName=@FirstName or LastName=@LastName or Gender=@Gender ", cnn);

                    da.SelectCommand.Parameters.AddWithValue("@FirstName", txtSearch.Text);
                    da.SelectCommand.Parameters.AddWithValue("@LastName", txtSearch.Text);
                    da.SelectCommand.Parameters.AddWithValue("@Gender", txtSearch.Text);

                }
                else
                {
                    da = new SqlDataAdapter("Select * From Employees where Salary=@Salary ", cnn);
                    da.SelectCommand.Parameters.AddWithValue("@Salary", txtSearch.Text);
                }
            }

            //if (!Regex.IsMatch(txtSalary.Text, @"(^([0-9]*|\d*\d{1}?\d*)$)"))
            //{
            //    da.SelectCommand.Parameters.AddWithValue("@Salary", txtSearch.Text);
            //}
         
         
            ds = new DataSet();
            da.Fill(ds, "EmployeeDetails");
            GridView1.DataSource = ds.Tables["EmployeeDetails"];
            GridView1.DataBind();
            cnn.Close();

        }


    }
}