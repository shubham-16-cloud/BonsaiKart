using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_seedlist_viwe : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            viweseed();
        }
    }

    protected void viweseed()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();
        try
        {
            con.Open();
            string str = "select * from seed_details";
            cmd = new SqlCommand(str, con);
            da.SelectCommand = cmd;
            da.Fill(ds);
            gvseed.DataSource = ds;
            gvseed.DataBind();

            //Attribute to show the Plus Minus Button.
            gvseed.HeaderRow.Cells[0].Attributes["data-class"] = "expand";

            //Attribute to hide column in Phone.
           gvseed.HeaderRow.Cells[2].Attributes["data-hide"] = "tablet,phone";
            gvseed.HeaderRow.Cells[3].Attributes["data-hide"] = "tablet,phone";
            gvseed.HeaderRow.Cells[4].Attributes["data-hide"] = "tablet,phone";
            gvseed.HeaderRow.Cells[5].Attributes["data-hide"] = "tablet,phone";
            gvseed.HeaderRow.Cells[6].Attributes["data-hide"] = "tablet,phone";
            gvseed.HeaderRow.Cells[8].Attributes["data-hide"] = "phone";
            gvseed.HeaderRow.Cells[7].Attributes["data-hide"] = "tablet,phone";
           // gvseed.HeaderRow.Cells[9].Attributes["data-hide"] = "phone";
            //Adds THEAD and TBODY to GridView.
            gvseed.HeaderRow.TableSection = TableRowSection.TableHeader;
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

    protected void deleteseed()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();

        try
        {
            con.Open();
            string str = "delete from seed_details where seedID = '" + Session["seedID"].ToString() + "'";
            cmd = new SqlCommand(str, con);
            cmd.ExecuteNonQuery();
            viweseed();


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

    protected void gvseed_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "medit")
            {
                Session["seedID"] = e.CommandArgument;
                Response.Redirect("edit_seed.aspx", true);
            }

            if (e.CommandName == "mdelete")
            {
                Session["seedID"] = e.CommandArgument;
                deleteseed();
            }
        }
        catch (Exception ex)
        {

        }
    }
}   
