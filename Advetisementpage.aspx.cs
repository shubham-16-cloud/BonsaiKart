using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Diagnostics;
using System.IO;

public partial class Advetisementpage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {


        }
    }

    protected void insertdata()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        string path = "~/image/addimg/";
        string[] extaion = { ".jpg", ".jpeg", ".png", ".bmp", ".svg" };
        string fullpath = commanFunction.imgupload(fuimg, path, extaion);
     
        try
        {
            con.Open();
            cmd = new SqlCommand("insert into advertisement_details values('" + Session["userid"] + "','" + txttitle.Text + "','" + txtdetails.Text + "','" + fullpath + "', '" + txtlink.Text + "',GETDATE(), DATEADD(DAY,7,GETDATE()),0)", con);
            cmd.ExecuteNonQuery();
            txttitle.Text = "";
            txtlink.Text = "";
            txtdetails.Text = "";
           
            Response.Write(@"<script language='javascript'>alert('The Advertisement add Successfuly.');</script>");
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
        finally
        {

        }
    }
    protected void btnadddiscount_Click(object sender, EventArgs e)
    {
        insertdata();
    }
}