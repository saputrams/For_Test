using Npgsql;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebTes
{
    public partial class _Default : Page
    {
        public NpgsqlConnection conn = new NpgsqlConnection(
                ConfigurationManager.ConnectionStrings["DBTES"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                viewData();
            }
        }

        public void viewData()
        {
            pnlGrid.Visible = true;
            pnlForm.Visible = false;
            pnlErrorForm.Visible = false;
            pnlAdd.Visible = false;
            pnlUpdate.Visible = false;
            pnlDetails.Visible = false;
            pnlDelete.Visible = false;

            DataTable dt = new DataTable();

            conn.Open();

            string sql = "select * from client";

            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);

            NpgsqlDataReader dr = cmd.ExecuteReader();
            dt.Load(dr);

            conn.Close();
            dgvData.DataSource = dt;
            dgvData.DataBind();

        }

        protected void dgv_RowCommand(Object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName == "UpdateRow")
            {
                viewDataDetail(Convert.ToInt32(e.CommandArgument),e.CommandName);
            }else if(e.CommandName == "DetailsRow")
            {
                viewDataDetail(Convert.ToInt32(e.CommandArgument), e.CommandName);
            }
            else if(e.CommandName == "DeleteRow")
            {

                viewDataDetail(Convert.ToInt32(e.CommandArgument), e.CommandName);
            }
        }

        public void viewDataDetail(int id, string event_)
        {

            DataTable dt = new DataTable();

            conn.Open();

            string sql = "select * from client where client_id = "+id;

            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);

            NpgsqlDataReader dr = cmd.ExecuteReader();
            dt.Load(dr);

            DateTime date = Convert.ToDateTime(dt.Rows[0]["date_of_birth"].ToString());
            if(event_ == "UpdateRow")
            {

                string datetime = date.ToString("yyyy-MM-dd");
                pnlGrid.Visible = false;
                pnlForm.Visible = true;
                pnlErrorForm.Visible = false;
                pnlAdd.Visible = false;
                pnlUpdate.Visible = true;
                pnlDetails.Visible = false;
                pnlDelete.Visible = false;

                txId.Text = dt.Rows[0]["client_id"].ToString();
                txFullName.Text = dt.Rows[0]["full_name"].ToString();
                ddlGender.SelectedValue = dt.Rows[0]["gender"].ToString();
                txDateOfBirth.Text = datetime;
            }
            else if(event_ == "DetailsRow")
            {

                string datetime = date.ToString("dd, MMM yyyy");
                pnlGrid.Visible = false;
                pnlForm.Visible = false;
                pnlErrorForm.Visible = false;
                pnlAdd.Visible = false;
                pnlUpdate.Visible = false;
                pnlDetails.Visible = true;
                pnlDelete.Visible = false;

                lblFullName.Text = dt.Rows[0]["full_name"].ToString();
                lblGender.Text = dt.Rows[0]["gender"].ToString();
                lblDateOfBirth.Text = datetime;
            }
            else
            {
                string datetime = date.ToString("dd, MMM yyyy");
                pnlGrid.Visible = false;
                pnlForm.Visible = false;
                pnlErrorForm.Visible = false;
                pnlAdd.Visible = false;
                pnlUpdate.Visible = false;
                pnlDetails.Visible = false;
                pnlDelete.Visible = true;

                lblIdClient.Text = dt.Rows[0]["client_id"].ToString();
                lblFullName2.Text = dt.Rows[0]["full_name"].ToString();
                lblGender2.Text = dt.Rows[0]["gender"].ToString();
                lblDateOfBirth2.Text = datetime;
            }
            
        }

        protected void btnAddClient(Object sender, EventArgs e)
        {
            pnlGrid.Visible = false;
            pnlForm.Visible = true;
            pnlErrorForm.Visible = false;
            pnlAdd.Visible = true;
            pnlUpdate.Visible = false;

            txId.Text = "0";
            txFullName.Text = "";
            txDateOfBirth.Text = "";
        }

        protected void btnSaveClient(Object sender, EventArgs e)
        {
            if(txFullName.Text == "" || txDateOfBirth.Text == "")
            {
                pnlErrorForm.Visible = true;
            }else
            {
                conn.Open();
                string sql;

                if (txId.Text == "0")
                {
                    sql = "insert into client(full_name,gender,date_of_birth)" +
                        " values ('" + txFullName.Text + "','" + ddlGender.SelectedValue + "','" + txDateOfBirth.Text + "');";

                }
                else
                {
                    sql = "update client" +
                        " set full_name = '" + txFullName.Text + "', gender = '" + ddlGender.SelectedValue + "', date_of_birth = '" + txDateOfBirth.Text + "' " +
                        " where client_id = " + txId.Text;

                }
                NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);

                cmd.ExecuteNonQuery();
                conn.Close();

                viewData();
            }
            
        }

        protected void btnDeleteClient(Object sender, EventArgs e)
        {
            conn.Open();
            string sql = "delete from client where client_id = " + lblIdClient.Text;

            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);

            cmd.ExecuteNonQuery();
            conn.Close();

            viewData();
        }

        protected void btnCancelClient(Object sender, EventArgs e)
        {
            viewData();
        }
    }
}