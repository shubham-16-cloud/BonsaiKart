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

public partial class Admin_edit_plant : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            Page.Form.Attributes.Add("enctype", "multipart/form-data");
            filltextbox();
            fillimg();
        }
    }

    protected void filltextbox()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dr;

        try
        {
            con.Open();
            cmd = new SqlCommand("select * from plant_details where plantID ='" + Session["PlantId"].ToString() + "'", con);
            dr = cmd.ExecuteReader();
            dr.Read();

            
            plantID.Text = dr["plantID"].ToString();
            txtplname.Text = dr["pl_name"].ToString();
            txtplprice.Text = dr["pl_price"].ToString();
            txtbrand.Text = dr["pl_brand"].ToString();
            txtqty.Text = dr["pl_qty"].ToString();
            ddlcategory.SelectedValue = dr["pl_category"].ToString();
            txtdescription.Text = dr["pl_description"].ToString();
            txtdetails.Text = dr["pl_details"].ToString();
            if(dr["pl_Free"].ToString() == "1")
            {
                cbfree.Checked = true;
            }
            if (dr["pl_10dayretun"].ToString() == "1")
            {
               cbreturen.Checked = true;
            }

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
    protected void fillimg()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();

        try
        {
            con.Open();
            cmd = new SqlCommand("select imgID,plantID,imgurl from plant_image where plantID ='" + Session["PlantId"].ToString() + "'", con);
            da.SelectCommand = cmd;
            da.Fill(ds);
            lvimg.DataSource = ds;
            lvimg.DataBind();

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
            ds.Dispose();
        }
    }

    protected void lvimg_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "delete")
            {
                Session["imgID"] = e.CommandArgument;
                deleteimg();
               
            }
        }
        catch (Exception ex)
        {

            Response.Write(ex.Message);
        }
    }

    protected void deleteimg()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dr ;
        try
        {
            con.Open();

            SqlCommand cmd1 =new SqlCommand("select imgUrl from plant_image where imgID = '" + Session["imgID"].ToString() + "' ",con);
            dr = cmd1.ExecuteReader();
             dr.Read();
            string imgurl = dr["imgUrl"].ToString();
            Session["imgurl"] = imgurl;
            //delete physical image
            string path = Server.MapPath(Session["imgurl"].ToString());
            //System.IO.File.Delete(path); 
            FileInfo file = new FileInfo(path);
            if (file.Exists)
            {
                file.Delete();
            }
            dr.Close();


            //delete record in database
            cmd = new SqlCommand("delete from plant_image where imgID ='" + Session["imgID"].ToString() + "'", con);
            cmd.ExecuteNonQuery();
            showfileupload();
           // fillimg();
           
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

    protected void showfileupload()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();

        try
        {
            object obj;
            con.Open();
            cmd = new SqlCommand("SELECT COUNT(*) FROM plant_image WHERE PlantId='" + Session["PlantId"].ToString() + "'", con);
            obj = cmd.ExecuteScalar();

            int j = Convert.ToInt32(obj) ;
            Session["j"] = Convert.ToInt32(obj);

            if (j == 3)
            {
                fupimg1.Visible = false;
                lblimg1.Visible = false;
                Fupimg2.Visible = false;
                lblimg2.Visible = false;
                fupimg3.Visible = false;
                lblimg3.Visible = false;
            }
            else if (j == 2)
            {
                fupimg1.Visible = true;
                lblimg1.Visible = true;
                Fupimg2.Visible = false;
                lblimg2.Visible = false;
                fupimg3.Visible = false;
                lblimg3.Visible = false;
            }
            else if (j == 1)
            {
                fupimg1.Visible = true;
                lblimg1.Visible = true;
                Fupimg2.Visible = true;
                lblimg2.Visible = true;
                fupimg3.Visible = false;
                lblimg3.Visible = false;
            }
            else if (j == 0)
            {
                fupimg1.Visible = true;
                lblimg1.Visible = true;
                Fupimg2.Visible = true;
                lblimg2.Visible = true;
                fupimg3.Visible = true;
                lblimg3.Visible = true;
            }
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
    protected void lvimg_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    {
        fillimg();
    }

    protected void updatetxtbox()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        string c1;
        string c2;
        try
        {
            if(cbfree.Checked == true){
                 c1 = "1";
            }
            else
            {
                c1 = "0";
            }
            if (cbreturen.Checked == true)
            {
                 c2 = "1";
            }
            else
            {
                 c2 = "0";
            }

            con.Open();
            string str = "update plant_details set pl_name = '" + txtplname.Text + "' ,pl_price ='" + txtplprice.Text + "' ,pl_brand= '" + txtbrand.Text + "' ,pl_qty = " + txtqty.Text + " ,pl_description = '" + txtdescription.Text + "' ,pl_details ='" + txtdetails.Text + "' ,pl_category = '" + ddlcategory.SelectedItem.Text + "' ,pl_Free = '" + c1 + "',pl_10dayretun = '"+ c2+"' where plantID ='" + Session["PlantId"].ToString() + "'";
            cmd = new SqlCommand(str,con);
            cmd.ExecuteNonQuery();

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

    protected void updateimg()
    {
         string path = "~/Admin/plantImg/";
        string[] extaion = { ".jpg", ".jpeg", ".png", ".bmp", ".svg",".gif" };
       // string imgpin = "IM" + commanFunction.finalcode();
        string plantid = Session["PlantId"].ToString();
        string tablename = "plant_image";
        int j = Convert.ToInt32(Session["j"]);
       
       
        

        if (j == 0)
        {

            commanFunction.all(fupimg1, path, plantid, "imgID", "IM", extaion, tablename);
            commanFunction.all(Fupimg2, path, plantid, "imgID", "IM", extaion, tablename);
            commanFunction.all(fupimg3, path, plantid, "imgID", "IM", extaion, tablename);
        }
        else if (j == 1)
        {
            commanFunction.all(fupimg1, path, plantid, "imgID", "IM", extaion, tablename);
            commanFunction.all(Fupimg2, path, plantid, "imgID", "IM", extaion, tablename);
        }
        else if (j == 2)
        {
          
            commanFunction.all(fupimg1, path, plantid,"imgID","IM", extaion,tablename);
        }
        
    }
  
    protected void btnupdateplant_Click(object sender, EventArgs e)
    {

        updateimg();
        updatetxtbox();
        Response.Redirect("plant_viwe.aspx", true);

    }
}