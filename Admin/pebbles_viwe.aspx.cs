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

public partial class Admin_pebbles_viwe : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            showpebbles();
        }
    }
    protected void showpebbles()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        try
        {
            con.Open();
            cmd = new SqlCommand("select * from pebbles_details", con);
            da.SelectCommand = cmd;
            da.Fill(dt);
            gvpebbles.DataSource = dt;
            gvpebbles.DataBind();

            gvpebbles.HeaderRow.Cells[0].Attributes["data-class"] = "expand";

            gvpebbles.HeaderRow.Cells[3].Attributes["data-hide"] = "phone";
            gvpebbles.HeaderRow.Cells[4].Attributes["data-hide"] = "phone";
            gvpebbles.HeaderRow.Cells[5].Attributes["data-hide"] = "phone";
            gvpebbles.HeaderRow.Cells[6].Attributes["data-hide"] = "phone";


            gvpebbles.HeaderRow.TableSection = TableRowSection.TableHeader;
        }
        catch (Exception ex)
        {
            lblbmsg.Text = ex.Message;
        }
        finally
        {
            con.Close();
            cmd.Dispose();
            da.Dispose();
            dt.Dispose();
        }
    }
    protected void gvpebbles_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "medit")
            {
                Session["pe_ID"] = e.CommandArgument;
                Response.Redirect("edit_pebbles.aspx", true);
            }

            if (e.CommandName == "mdelete")
            {
                Session["pe_ID"] = e.CommandArgument;
                deletepebbles();
            }
        }
        catch (Exception ex)
        {
            lblbmsg.Text = ex.Message;
        }
    }

    protected void deletepebbles()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();

        try
        {
            con.Open();
            cmd = new SqlCommand("delete from pebbles_details where pe_ID ='"+Session["pe_ID"]+"'",con);
            cmd.ExecuteNonQuery();
            showpebbles();

        }
        catch (Exception ex)
        {
            lblbmsg.Text = ex.Message;
        }
        finally
        {
            con.Close();
            cmd.Dispose();
        }
          
    }
}