using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_pot_viwe : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Page.IsPostBack == false)
        {
            viwepots();
        }

    }
    protected void viwepots()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();
        try
        {
            con.Open();
            string str = "select * from pot_details";
            cmd = new SqlCommand(str, con);
            da.SelectCommand = cmd;
            da.Fill(ds);
            gvpots.DataSource = ds;
            gvpots.DataBind();

            gvpots.HeaderRow.Cells[0].Attributes["data-class"] = "expand";

            //Attribute to hide column in Phone.
            gvpots.HeaderRow.Cells[2].Attributes["data-hide"] = "phone";
            gvpots.HeaderRow.Cells[3].Attributes["data-hide"] = "phone";
            gvpots.HeaderRow.Cells[4].Attributes["data-hide"] = "phone";
            gvpots.HeaderRow.Cells[5].Attributes["data-hide"] = "tablet,phone";
            gvpots.HeaderRow.Cells[6].Attributes["data-hide"] = "tablet,phone";
            gvpots.HeaderRow.Cells[7].Attributes["data-hide"] = "phone";
            gvpots.HeaderRow.Cells[8].Attributes["data-hide"] = "phone";
           
            //Adds THEAD and TBODY to GridView.
            gvpots.HeaderRow.TableSection = TableRowSection.TableHeader;


            
        }
        catch (Exception e)
        {
            Response.Write("viwe plant" + e.Message);
        }
        finally
        {
            con.Close();
            cmd.Dispose();
            da.Dispose();
        }
    }

    protected void deletepot()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();

        try
        {
            con.Open();
            string str = "delete from pot_details where potID = '" + Session["potID"].ToString() + "'";
            cmd = new SqlCommand(str, con);
            cmd.ExecuteNonQuery();
            viwepots();
            

        }
        catch (Exception e)
        {
            Response.Write("deleteplant() " + e.Message);
        }
        finally
        {
            con.Close();
            cmd.Dispose();
        }
    }
    protected void gvpots_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "medit")
            {
                Session["potID"] = e.CommandArgument;
                Response.Redirect("edit_pot.aspx", true);
            }

            if (e.CommandName == "mdelete")
            {
                Session["potID"] = e.CommandArgument;
                deletepot();
            }
        }
        catch (Exception ex)
        {
           
        }
    }
}