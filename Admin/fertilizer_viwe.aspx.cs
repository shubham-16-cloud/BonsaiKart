using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class Admin_fertilizer_viwe : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Page.IsPostBack == false)
        {
            showfertilizer();
        }

    }
    protected void showfertilizer()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        try
        {
            con.Open();
            cmd = new SqlCommand("select * from fertilizer_details", con);
            da.SelectCommand = cmd;
            da.Fill(dt);
            gvfertilizer.DataSource = dt;
            gvfertilizer.DataBind();

            gvfertilizer.HeaderRow.Cells[0].Attributes["data-class"] = "expand";

            gvfertilizer.HeaderRow.Cells[3].Attributes["data-hide"] = "phone,tablet";
            gvfertilizer.HeaderRow.Cells[4].Attributes["data-hide"] = "phone,tablet";
            gvfertilizer.HeaderRow.Cells[5].Attributes["data-hide"] = "phone,tablet";
            gvfertilizer.HeaderRow.Cells[6].Attributes["data-hide"] = "phone";
            gvfertilizer.HeaderRow.Cells[7].Attributes["data-hide"] = "phone";


            gvfertilizer.HeaderRow.TableSection = TableRowSection.TableHeader;
        }
        catch (Exception ex)
        {
            lblmsg.Text = ex.Message;
        }
        finally
        {
            con.Close();
            cmd.Dispose();
            da.Dispose();
            dt.Dispose();
        }
    }
    protected void gvfertilizer_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "medit")
            {
                Session["fe_ID"] = e.CommandArgument;
                Response.Redirect("edit_fertilizer.aspx", true);
            }

            if (e.CommandName == "mdelete")
            {
                Session["fe_ID"] = e.CommandArgument;
                deletefertilizer();
            }
        }
        catch (Exception ex)
        {
            lblmsg.Text = ex.Message;
        }
    }

    protected void deletefertilizer()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();

        try
        {
            con.Open();
            cmd = new SqlCommand("delete from pebbles_details where pe_ID ='" + Session["fe_ID"].ToString() + "'", con);
            cmd.ExecuteNonQuery();
            showfertilizer();

        }
        catch (Exception ex)
        {
            lblmsg.Text = ex.Message;
        }
        finally
        {
            con.Close();
            cmd.Dispose();
        }
    }
}
