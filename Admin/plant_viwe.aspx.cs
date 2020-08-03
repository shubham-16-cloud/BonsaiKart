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

public partial class Admin_plant_viwe : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Page.IsPostBack == false)
        {
            viweplant();
        }

    }

    protected void viweplant()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();
        try
        {
            con.Open();
            string str = "select plant_details.id,plant_details.plantID,pl_price,pl_name,pl_brand,pl_qty,pl_category,pl_description,pl_details,pl_free,pl_10dayretun,imgurl from plant_details,plant_image where plant_details.plantID=plant_image.plantID and plant_image.imgUrl=(select top 1 imgUrl from plant_image where plant_details.plantID=plant_image.plantID )";
            cmd = new SqlCommand(str, con);
            da.SelectCommand = cmd;
            da.Fill(ds);
            gvplant.DataSource = ds;
            gvplant.DataBind();

            gvplant.HeaderRow.Cells[0].Attributes["data-class"] = "expand";

            //Attribute to hide column in Phone.
            gvplant.HeaderRow.Cells[3].Attributes["data-hide"] = "phone";
            gvplant.HeaderRow.Cells[4].Attributes["data-hide"] = "phone";

            gvplant.HeaderRow.Cells[5].Attributes["data-hide"] = "tablet,phone";
            gvplant.HeaderRow.Cells[6].Attributes["data-hide"] = "phone";
            gvplant.HeaderRow.Cells[7].Attributes["data-hide"] = "phone";

            gvplant.HeaderRow.TableSection = TableRowSection.TableHeader;
        }
        catch(Exception e)
        {
            Response.Write("viwe plant"+e.Message);
        }
        finally
        {
            con.Close();
            cmd.Dispose();
            da.Dispose();
        }
    }

    protected void deleteplant()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();

        try
        {
            con.Open();
            string str = "delete from plant_details where plantID = '"+Session["plantID"].ToString()+"'";
            cmd = new SqlCommand(str, con);
            cmd.ExecuteNonQuery();

            viweplant(); ;

        }
        catch(Exception e)
        {
            Response.Write("deleteplant() "+ e.Message);
        }
        finally
        {
            con.Close();
            cmd.Dispose();
        }
    }


    protected void gvplant_RowCommand(object sender, GridViewCommandEventArgs e)
    {
          try
        {
            if (e.CommandName == "medit")
            {
                Session["plantID"] = e.CommandArgument;
                //Response.Redirect("locho.aspx", true);
                Response.Redirect("edit_plant.aspx", true);
            }

            if (e.CommandName == "mdelete")
            {
                Session["plantID"] = e.CommandArgument;
                deleteplant();
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    
}