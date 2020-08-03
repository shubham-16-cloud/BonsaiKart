using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.IO;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for commanFunction
/// </summary>
public class commanFunction
{
	public commanFunction()
	{
		//
		// TODO: Add constructor logic here
		//
	}
  public static DateTime FromDate = DateTime.Today.AddDays(-7);
    public static string finalcode()
    {
        string pin;
        pin = getcode1(2) + getcode2(2);

        return pin;
    }
        
    public static string getcode1(int len)
    {
        char[] allow = "1234567890".ToCharArray();
        Random random = new Random();
        System.Text.StringBuilder mystring = new System.Text.StringBuilder();
        int index = 0;
        int roof = len - 1;
        while(index <= roof)
        {
            mystring.Append(allow[random.Next(0, allow.Length - 1)]);
            System.Math.Min(System.Threading.Interlocked.Increment(ref index), index - 1);

        }
        return mystring.ToString();
    }

    public static string getcode2(int len)
    {
        char[] allow = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".ToCharArray();
        Random random = new Random();
        System.Text.StringBuilder mystring = new System.Text.StringBuilder();
        int index = 0;
        int roof = len - 1;
        while (index <= roof)
        {
            mystring.Append(allow[random.Next(0, allow.Length - 1)]);
            System.Math.Min(System.Threading.Interlocked.Increment(ref index), index - 1);

        }
        return mystring.ToString();
    }

    public static string cheakID(string firsttwochar,string colID ,string tablename)
    {
        int found;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dr=null;
       string pin = firsttwochar + getcode1(2) + getcode2(2);
       // string pin = "IM44FU";
        try
        {
          
            do
            {
                con.Open();
                string str = "select " + colID + " from " + tablename + " where " + colID + " = '" + pin + "' ";
                cmd = new SqlCommand(str, con);
                dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    found = 0;
                    pin = firsttwochar + getcode1(2) + getcode2(2);
                    // finalcode();


                }
                else
                {
                    found = 1;
                    cmd.Dispose();
                   
                }

            } while (found == 0);

            
        }
        catch (Exception ex)
        {
        }
        finally
        {
            cmd.Dispose();
            dr.Close();
            con.Close();
        }
        return pin;
           
    }

    public static string cheakIDonlynumber(string firsttwochar, string colID, string tablename , int len)
    {
        int found;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dr = null;
        string pin = firsttwochar + getcode1(len);
        // string pin = "IM44FU";
        try
        {

            do
            {
                con.Open();
                string str = "select " + colID + " from " + tablename + " where " + colID + " = '" + pin + "' ";
                cmd = new SqlCommand(str, con);
                dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    found = 0;
                    pin = firsttwochar + getcode1(len);
                    // finalcode();


                }
                else
                {
                    found = 1;
                    cmd.Dispose();

                }

            } while (found == 0);


        }
        catch (Exception ex)
        {
        }
        finally
        {
            cmd.Dispose();
            dr.Close();
            con.Close();
        }
        return pin;

    }


    public static void all(FileUpload upload1, String path,String productID,String colID1, String firsttwochar1, String[] extension, String tablename)
    {
         SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();

        if (upload1.HasFile)
        {
            string uploadpath = path;
            string fullpath = "";
            bool fileformatok = false;
            string ex = Path.GetExtension(upload1.FileName);
            for (int i = 0; i <= extension.Length - 1; i++)
            {
                if (ex == extension[i])
                {
                    fileformatok = true;
                    break;
                }
            }
            if (fileformatok == true)
            {
                fullpath = uploadpath + upload1.FileName;
                //HttpContext.Current.Session["fullpath"] = fullpath;

                upload1.SaveAs(HttpContext.Current.Server.MapPath(fullpath));

                string pin = cheakID(firsttwochar1, colID1, tablename);

                con.Open();
                cmd = new SqlCommand("insert into " + tablename + " values('" + pin + "','" + productID + "','" + fullpath + "')", con);
                cmd.ExecuteNonQuery();
            }
          }
        
        }

    public static String imgupload(FileUpload upload1, String path, String[] extension)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        string fullpath = "";
        if (upload1.HasFile)
        {
            string uploadpath = path;
            
            bool fileformatok = false;
            string ex = Path.GetExtension(upload1.FileName);
            for (int i = 0; i <= extension.Length - 1; i++)
            {
                if (ex == extension[i])
                {
                    fileformatok = true;
                    break;
                }
            }
            if (fileformatok == true)
            {
                fullpath = uploadpath + upload1.FileName;
                HttpContext.Current.Session["fullpath"] = fullpath;

                upload1.SaveAs(HttpContext.Current.Server.MapPath(fullpath));
            }
            
        }
        return fullpath;
    }

    public static void GenerateQueryForQutantityinEditCart(string cmdid)
    {
        
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
     
        con.Open();
        string str = "select productid from cart_details where ProductID = '"+ cmdid +"' ";
        cmd = new SqlCommand(str, con);
       SqlDataReader dr;
        string vproductid="";
        string strsql = "";
       dr = cmd.ExecuteReader();
            if(dr.HasRows)
            {
                dr.Read();
                vproductid = dr["productid"].ToString();

            }
        
        if(vproductid.Substring(0, 2)== "PL")
        {
            strsql="select pl_qty from plant_details  where plantID='"+ vproductid +"'";
        }
        else if(vproductid.Substring(0, 2)== "SE")
        {
           strsql="select se_qty from seed_details  where seedID='"+ vproductid +"'";
        }
          else if(vproductid.Substring(0, 2)== "PO")
        {
            strsql="select po_qty from pot_details  where potID='"+ vproductid +"'";
        }
        //da.SelectCommand = cmd;
        //da.Fill(ds);
        //ControlName.DataTextField = "product_qty";
        //ControlName.DataValueField = "id";
        //ControlName.DataSource = ds;
        //ControlName.DataBind();
        //ControlName.Items.Insert(0, new ListItem("select", "0"));
        HttpContext.Current.Session["VQuery"] = strsql;

        con.Dispose();
        cmd.Dispose();
      

    }
    public static void FillQtyInEditCartDropDown(DropDownList controlname)
    {
        controlname.Items.Clear();
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
          con.Open();
          cmd = new SqlCommand( HttpContext.Current.Session["VQuery"].ToString(), con);
          int i =Convert.ToInt32(cmd.ExecuteScalar());
          int j;
          if(i>0)
          {
                for(j=1;j<=i;j++)
                {
                    controlname.Items.Add(new ListItem(j.ToString(), j.ToString()));
                }
          }
    }

    public static string ConvertToAmericanDate(string IndianDate)
    {
        string dd = IndianDate.Substring(0, 2);
        string mm = IndianDate.Substring(3, 2);
        string yyyy = IndianDate.Substring(6, 4);
        string AmericanDate = (mm + ("/"
                    + (dd + ("/" + yyyy))));
       
        return AmericanDate;
    }
    public static string ConvertToJapanDate(string IndianDate)
    {
        string dd = IndianDate.Substring(0, 2);
        string mm = IndianDate.Substring(3, 2);
        string yyyy = IndianDate.Substring(6, 4);
        string AmericanDate = ( yyyy + ("/"
                    + (mm+("/" + dd))));

        return AmericanDate;
    }
}