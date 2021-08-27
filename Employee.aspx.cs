using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASPNETCURD
{
    public partial class Employee : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"data source=.; database=ASPNETCURD; integrated security=SSPI");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                btnDelete.Enabled = false;
                FillGridView();
            }

        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            Clear();
        }
        public void Clear()
        {
            //hf means hiddenfeild
            hfEmpID.Value = "";

            txtEmpName.Text = txtEmpDesignation.Text = txtEmpmobileno.Text = txtEmpGender.Text = txtEmpAddress.Text = "";
            btnSave.Text = "Save";
            lblSuccessMessage.Text = lblErrorMessage.Text = "";
            btnDelete.Enabled = false;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (con.State == System.Data.ConnectionState.Closed)
                con.Open();
            SqlCommand cmd = new SqlCommand("EmployeeCreateUpdate", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@EmpID", hfEmpID.Value == "" ? 0 : Convert.ToInt32(hfEmpID.Value));
            cmd.Parameters.AddWithValue("@EmpName", txtEmpName.Text.Trim());
            cmd.Parameters.AddWithValue("@EmpDesignation", txtEmpDesignation.Text.Trim());
            cmd.Parameters.AddWithValue("@EmpMobileno", txtEmpmobileno.Text.Trim());
            cmd.Parameters.AddWithValue("@EmpGender", txtEmpGender.Text.Trim());
            cmd.Parameters.AddWithValue("@EmpAddress", txtEmpAddress.Text.Trim());
            cmd.ExecuteNonQuery();
            con.Close();
            string EmpID = hfEmpID.Value;
            Clear();
            if (EmpID =="")
                lblSuccessMessage.Text = "Saved Successfully";
            else
                lblSuccessMessage.Text = "Updated successfully";
            FillGridView();
        }
        void FillGridView()
        {
            if (con.State == System.Data.ConnectionState.Closed)
                con.Open();
            SqlDataAdapter sdr = new SqlDataAdapter("ASPCURD_EmployeeViewall", con);
            sdr.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dbtbl = new DataTable();

            sdr.Fill(dbtbl);
            con.Close();
            gvEmployee.DataSource = dbtbl;
            gvEmployee.DataBind();
       
        }
        public void lnk_onClick(object sender, EventArgs e)
        {
            int EmpID = Convert.ToInt32((sender as LinkButton).CommandArgument);
            if (con.State == System.Data.ConnectionState.Closed)
             con.Open();
            SqlDataAdapter sdr = new SqlDataAdapter("ASPCURD_EmployeeViewById", con);
            sdr.SelectCommand.CommandType = CommandType.StoredProcedure;
            sdr.SelectCommand.Parameters.AddWithValue("@EmpID", EmpID);
            DataTable dbtbl = new DataTable();
            sdr.Fill(dbtbl);
            con.Close();
            hfEmpID.Value = EmpID.ToString();
            txtEmpName.Text = dbtbl.Rows[0]["EmpName"].ToString();
            txtEmpDesignation.Text = dbtbl.Rows[0]["EmpDesignation"].ToString();
            txtEmpGender.Text = dbtbl.Rows[0]["EmpGender"].ToString();
            txtEmpmobileno.Text = dbtbl.Rows[0]["Empmobileno"].ToString();
            txtEmpAddress.Text = dbtbl.Rows[0]["EmpAddress"].ToString();
            btnSave.Text = "Updated";
            btnDelete.Enabled = true;

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (con.State == System.Data.ConnectionState.Closed)
                con.Open();
            SqlCommand cmd = new SqlCommand("ASPCURD_EmployeedDeleteById",con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@EmpID", (Convert.ToInt32(hfEmpID.Value)));
            cmd.ExecuteNonQuery();
            con.Close();
            Clear();
            FillGridView();
            lblSuccessMessage.Text = "Deleted Successfully";
        }
    }
}