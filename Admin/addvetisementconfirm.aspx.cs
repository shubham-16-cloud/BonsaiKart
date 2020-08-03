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

public partial class Admin_addvetisementconfirm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            showdiscount();
        }

    }
    protected void showdiscount()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        try
        {
            con.Open();
            cmd = new SqlCommand("select * from advertisement_details where Ad_stusts = 0", con);
            da.SelectCommand = cmd;
            da.Fill(dt);
            gvdiscount.DataSource = dt;
            gvdiscount.DataBind();

            gvdiscount.HeaderRow.Cells[1].Attributes["data-class"] = "expand";

            gvdiscount.HeaderRow.Cells[3].Attributes["data-hide"] = "phone";
            gvdiscount.HeaderRow.Cells[4].Attributes["data-hide"] = "phone";



            gvdiscount.HeaderRow.TableSection = TableRowSection.TableHeader;

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
    protected void gvdiscount_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "medit")
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
                SqlCommand cmd = new SqlCommand();

                con.Open();
                cmd = new SqlCommand("update advertisement_details set Ad_stusts= 1 where id ='"+ e.CommandArgument +"'", con);
                cmd.ExecuteNonQuery();
                showdiscount();
            }

            if (e.CommandName == "mdelete")
            {
                deletediscount(e.CommandArgument.ToString());
            }
        }
        catch (Exception ex)
        {
            lblmsg.Text = ex.Message;
        }
    }

    protected void deletediscount( string userid)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();

        try
        {
            con.Open();
            cmd = new SqlCommand("delete from advertisement_details where id ='" + userid + "'", con);
            cmd.ExecuteNonQuery();
            showdiscount();

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