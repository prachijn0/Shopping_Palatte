using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
//using System.Linq;
using System.Web;
using System.Web.Configuration;

/// <summary>
/// Summary description for ShoppingDAO
/// </summary>
public class ShoppingDB
{
    SqlConnection con = null;
    SqlCommand cmd = null;
    string connectionString = WebConfigurationManager.ConnectionStrings["ShoppingPalateDb"].ConnectionString;
    private List<Product> products = new List<Product>();
    public List<Product> Products
    {
        get { return products; }
    }
    public ShoppingDB()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    //Method which return Categories from database
    public List<Category> GetCategories()
    {

        string sqlSelect = "SELECT * FROM Category";


        con = new SqlConnection(connectionString);
        cmd = new SqlCommand(sqlSelect, con);
        SqlDataReader reader;
        DataTable categories = new DataTable();

        List<Category> categoryList = new List<Category>();

        try
        {

            con.Open();
            reader = cmd.ExecuteReader();
            categories.Load(reader);

            foreach (DataRow row in categories.Rows)
            {
                Category category = new Category();
                category.CategoryId = Convert.ToInt16(row["CategoryID"]);
                category.CategoryName = row["CategoryName"].ToString().Trim();
                categoryList.Add(category);


            }


            reader.Close();

        }
        catch (Exception er)
        {
            throw er;

        }
        finally
        {
            con.Close();
        }

        return categoryList;
    }

//Method which Return Product by knowing CategoryId
    public List<Product> GetProductsByCategoryId(int categoryId)
    {
        
        string sqlSelect = "SELECT * FROM Product WHERE CategoryID =" + categoryId;


        SqlConnection con = new SqlConnection(connectionString);
        SqlCommand cmd = new SqlCommand(sqlSelect, con);
        SqlDataReader reader;
        DataTable prodcuts = new DataTable();

        List<Product> productList = new List<Product>();

        try
        {

            con.Open();
            reader = cmd.ExecuteReader();
            prodcuts.Load(reader);

            foreach (DataRow row in prodcuts.Rows)
            {
                Product product = new Product();
                product.ProductId = Convert.ToInt16(row["ProductID"]);
                product.ProductName = row["ProductName"].ToString();
                product.ProductDesc = row["Description"].ToString();
                //byte[] byteArray = (byte[])reader["Image"];
                //row["Image"] = byteArray;
                byte[] array = (byte[])row["Image"];
                product.ProductImage = "data:image/jpeg;base64," + Convert.ToBase64String(array);
                product.ProductPrice = Convert.ToInt16(row["Price"]);
                productList.Add(product);


            }


            reader.Close();

        }
        catch (Exception er)
        {
            throw er;

        }
        finally
        {
            con.Close();
        }

        return productList;
    }

    // Method which return Best selling product from the Database entry
    public List<Product> GetBestSellingProduct()
    {

        string sqlSelect = "SELECT Top 10 ProductID,ProductName,Sold,Image,Price FROM Product order by Sold desc;";



        SqlConnection con = new SqlConnection(connectionString);
        SqlCommand cmd = new SqlCommand(sqlSelect, con);
        SqlDataReader reader;
        DataTable prodcuts = new DataTable();

        List<Product> productList = new List<Product>();

        try
        {

            con.Open();
            reader = cmd.ExecuteReader();
            prodcuts.Load(reader);

            foreach (DataRow row in prodcuts.Rows)
            {
                Product product = new Product();
                product.ProductId = Convert.ToInt16(row["ProductID"]);
                product.ProductName = row["ProductName"].ToString();
                //byte[] byteArray = (byte[])reader["Image"];
                //row["Image"] = byteArray;
                byte[] array = (byte[])row["Image"];
                product.ProductImage = "data:image/jpeg;base64," + Convert.ToBase64String(array);
                product.ProductPrice = Convert.ToInt16(row["Price"]);
                productList.Add(product);


            }


            reader.Close();

        }
        catch (Exception er)
        {
            throw er;

        }
        finally
        {
            con.Close();
        }

        return productList;
    }

   
    

// Method which return Details of Product by knowing ProductId
    public Product GetProductsDetailsByProductId(int productId)
    {

        string sqlSelect = "SELECT * FROM Product WHERE ProductID =" + productId;

        SqlConnection con = new SqlConnection(connectionString);
        SqlCommand cmd = new SqlCommand(sqlSelect, con);
        SqlDataReader reader;
        Product product = new Product();
        try
        {
            con.Open();
            reader = cmd.ExecuteReader();

            reader.Read();


            product.ProductId = Convert.ToInt16(reader["ProductId"]);
            byte[] array = (byte[])(reader["Image"]);
            product.ProductImage = "data:image/jpeg;base64," + Convert.ToBase64String(array);
            product.ProductName = reader["ProductName"].ToString();
            product.ProductDesc = reader["Description"].ToString();

            product.ProductPrice = Convert.ToDecimal(reader["Price"]);
            product.InStock = Convert.ToInt16(reader["Instock"]);
            reader.Close();

        }
        catch (Exception er)
        {
            throw er;

        }
        finally
        {
            con.Close();
        }

        return product;
    }

    //Gets the Image of a particularproduct
     public byte[] GetProductsImage(int productId)
    {

        string sqlSelect = "SELECT * FROM Product WHERE ProductID =" + productId;

        SqlConnection con = new SqlConnection(connectionString);
        SqlCommand cmd = new SqlCommand(sqlSelect, con);
        SqlDataReader reader;
        Product product = new Product();
        byte[] array = null;
        try
        {
            con.Open();
            reader = cmd.ExecuteReader();

            reader.Read();


            product.ProductId = Convert.ToInt16(reader["ProductId"]);
            array = (byte[])(reader["Image"]);
            reader.Close();
           
        }
        catch (Exception er)
        {
            throw er;

        }
        finally
        {
            con.Close();
        }
        return array;
        
    }

// Method which add new category using bool property
     public bool AddNewCategory(string category)
     {
         try
         {
             bool flag = false;
             con = new SqlConnection(connectionString); ;
             cmd = new SqlCommand();
             cmd.CommandText = "sp_AddCategory";
             cmd.CommandType = CommandType.StoredProcedure;
             cmd.Connection = con;
             SqlParameter CategoryName = cmd.CreateParameter();
             CategoryName.ParameterName = "@CategoryName";
             CategoryName.Value = category;
             cmd.Parameters.Add(CategoryName);
             //  CatagoryInfo.CategoryId = Convert.ToInt32(cmd.ExecuteScalar());
             cmd.Connection.Open();
             int noOfRows = cmd.ExecuteNonQuery();
             cmd.Connection.Close();
             if (noOfRows == 1)
             {
                 flag = true;
             }
             else
             {
                 flag = false;
             }

             return flag;

         }
         catch (Exception er)
         {

             throw er;
         }
     }

    //string CategoryId,string ProductName,string Description,byte[] Image,int Price,int Instock
     public bool AddNewProduct(int CategoryId, string ProductName, string Description, byte[] Image, decimal Price, int Instock)
     {
         try
         {

             bool flag = false;
             con = new SqlConnection(connectionString); ;
             cmd = new SqlCommand();
             cmd.CommandText = "sp_AddProduct";
             cmd.CommandType = CommandType.StoredProcedure;
             cmd.Connection = con;

             SqlParameter param = cmd.CreateParameter();
             param.ParameterName = "@CategoryId";
             param.Value = CategoryId;
             param.DbType = DbType.Int16;
             cmd.Parameters.Add(param);

             param = cmd.CreateParameter();
             param.ParameterName = "@ProductName";
             param.Value = ProductName;
             param.DbType = DbType.String;
             cmd.Parameters.Add(param);

             param = cmd.CreateParameter();
             param.ParameterName = "@Description";
             param.Value = Description;
             param.DbType = DbType.String;
             cmd.Parameters.Add(param);

             param = cmd.CreateParameter();
             param.ParameterName = "@Image";
             param.Value = Image;
             param.DbType = DbType.Binary;
             cmd.Parameters.Add(param);

             param = cmd.CreateParameter();
             param.ParameterName = "@Price";
             param.Value = Price;
             param.DbType = DbType.Decimal;
             cmd.Parameters.Add(param);

             param = cmd.CreateParameter();
             param.ParameterName = "@Instock";
             param.Value = Instock;
             param.DbType = DbType.Int16;
             cmd.Parameters.Add(param);
             // CatagoryInfo.CategoryId = Convert.ToInt32(cmd.ExecuteScalar());
             cmd.Connection.Open();
             int noOfRows = cmd.ExecuteNonQuery();
             cmd.Connection.Close();
             if (noOfRows == 1)
             {
                 flag = true;
             }
             else
             {
                 flag = false;
             }

             return flag;

         }
         catch (Exception er)
         {

             throw er;
         }
     }
   
    //Method that check whether The category is their or not
     public bool IsCategoryPresent(string categoryName)
     {
         bool isExist = false;
         try
         {
             List<Category> categories = this.GetCategories();
             foreach (var category in categories)
             {
                 if (category.CategoryName == categoryName)
                 {
                     isExist = true;
                 }

             }

         }
         catch (Exception er)
         {
             throw er;
         }
         return isExist;
     }

    //Method that check whether product is there or not
     public bool IsProductPresent(string productName, int categoryId)
     {
         bool isExist = false;
         try
         {
             List<Product> product = this.GetProductsByCategoryId(categoryId);
             foreach (var prod in product)
             {
                 if (prod.ProductName == productName)
                 {
                     isExist = true;
                 }

             }

         }
         catch (Exception er)
         {
             throw er;
         }
         return isExist;
     }
    // Method which return Add product in the cart
     public void AddProduct(int id, string name, decimal price, int qty)
     {
         try
         {
             Product result = products.Find(
                 delegate(Product tp)
                 {
                     return tp.ProductId == id;
                 }
                 );

             if (result != null)
             {
                 UpdateQuantity(result.Quantity + qty, result.ProductId);
             }
             else
             {
                 Product tp = new Product(id, name, price, qty);
                 products.Add(tp);
             }

         }
         catch (Exception ex)
         {
             throw ex;
         }

     }
    //Method to update the product
     public bool UpdateProduct(int ProductId, int CategoryId, string ProductName, string Description, byte[] Image, decimal Price, int Instock)
     {
         try
         {
             bool flag = false;
             con = new SqlConnection(connectionString); ;
             cmd = new SqlCommand();
             cmd.CommandText = "sp_UpdateProduct";
             cmd.CommandType = CommandType.StoredProcedure;
             cmd.Connection = con;

             SqlParameter param = cmd.CreateParameter();
             param.ParameterName = "@ProductID";
             param.Value = ProductId;
             param.DbType = DbType.Int16;
             cmd.Parameters.Add(param);

             param = cmd.CreateParameter();
             param.ParameterName = "@CategoryID";
             param.Value = CategoryId;
             param.DbType = DbType.Int16;
             cmd.Parameters.Add(param);

             param = cmd.CreateParameter();
             param.ParameterName = "@ProductName";
             param.Value = ProductName;
             param.DbType = DbType.String;
             cmd.Parameters.Add(param);

             param = cmd.CreateParameter();
             param.ParameterName = "@Description";
             param.Value = Description;
             param.DbType = DbType.String;
             cmd.Parameters.Add(param);

             param = cmd.CreateParameter();
             param.ParameterName = "@Image";
             param.Value = Image;
             param.DbType = DbType.Binary;
             cmd.Parameters.Add(param);

             param = cmd.CreateParameter();
             param.ParameterName = "@Price";
             param.Value = Price;
             param.DbType = DbType.Decimal;
             cmd.Parameters.Add(param);

             param = cmd.CreateParameter();
             param.ParameterName = "@Instock";
             param.Value = Instock;
             param.DbType = DbType.Int16;
             cmd.Parameters.Add(param);
             // CatagoryInfo.CategoryId = Convert.ToInt32(cmd.ExecuteScalar());
             cmd.Connection.Open();
             int noOfRows = cmd.ExecuteNonQuery();
             cmd.Connection.Close();
             if (noOfRows == 1)
             {
                 flag = true;
             }
             else
             {
                 flag = false;
             }

             return flag;

         }
         catch (Exception er)
         {

             throw er;
         }

     }
   //Method which delete Product
     public bool DeleteProduct(int productId)
     {
         try
         {

             bool flag = false;
             con = new SqlConnection(connectionString); ;
             cmd = new SqlCommand();
             cmd.CommandText = "sp_DeleteProduct";
             cmd.CommandType = CommandType.StoredProcedure;
             cmd.Connection = con;

             SqlParameter param = cmd.CreateParameter();
             param.ParameterName = "@ProductID";
             param.Value = productId;
             param.DbType = DbType.Int16;
             cmd.Parameters.Add(param);

             cmd.Connection.Open();
             int noOfRows = cmd.ExecuteNonQuery();
             cmd.Connection.Close();
             if (noOfRows == 1)
             {
                 flag = true;
             }
             else
             {
                 flag = false;
             }

             return flag;

         }
         catch (Exception ex)
         {
             throw ex;
         }
     }


    //Method to get category By CategoryId
     public Category GetCategoryByCategoryId(int id)
     {
         try
         {
             string sqlSelect = "SELECT * FROM Category WHERE CategoryId=" + id;

             con = new SqlConnection(connectionString);
             cmd = new SqlCommand(sqlSelect, con);
             SqlDataReader reader;

             con.Open();
             reader = cmd.ExecuteReader();
             Category category = new Category();
             if (reader.Read())
             {
                 category.CategoryId = id;
                 category.CategoryName = reader["CategoryName"].ToString();
             }
             reader.Close();
             return category;
         }
         catch (Exception ex)
         {

             throw ex;
         }
     }
    //Method to Update Quantity
     public void UpdateQuantity(int UpdateQty, int ID)
     {
         try
         {

             foreach (Product q in products)
             {
                 if (q.ProductId == ID)
                 {
                     q.Quantity = UpdateQty;
                 }
             }

         }
         catch (Exception ex)
         {
             throw ex;
         }
     }   

    // Method to remove product from the cart
     public void RemoveProduct(int ProdID)
     {
         try
         {
             Product prodToRemove = null;

             foreach (Product p in products)
             {
                 if (p.ProductId == ProdID)
                 {
                     prodToRemove = p;
                 }
             }
             products.Remove(prodToRemove);
         }
         catch (Exception ex)
         {
             throw ex;
         }

     }



    // Method to return the total dollar amount in the cart
     public decimal GetTotal()
     {
         try
         {

             decimal total = 0;
             foreach (Product p in products)
             {
                 total += p.ProductPrice * p.Quantity;
             }
             return total;

         }
         catch (Exception ex)
         {

             throw ex;
         }
     }

    // Method that saves the cart information and updates the available quantity and sold items in the database (happens at checkout)
     public bool ItemsSold(List<Product> prod)
     {

         //Create a data table for the order details that will be passed to the stored procedure
         //This uses SQL Server's Table valued parameter method as described here:
         //http://lennilobel.wordpress.com/2009/07/29/sql-server-2008-table-valued-parameters-and-c-custom-iterators-a-match-made-in-heaven/
         //Basically, we create a user-defined type that looks like this:  CREATE TYPE OrderDetailUdt AS TABLE (ProductId int,  Quantity int,  Price money) 
         //We then insert the entire datatable as an instance of this type

         DataTable details = new DataTable();

         details.Columns.Add("id", typeof(int));
         details.Columns.Add("qty", typeof(int));

         //Add the products in the cart to the data table
         foreach (Product p in prod)
         {
             details.Rows.Add(new object[] { p.ProductId, p.Quantity });
         }

         //Execute the ADO code.  Return true if it succeeds, false otherwise.
         SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ShoppingPalateDB"].ConnectionString);
         SqlCommand com = con.CreateCommand();
         com.CommandType = CommandType.StoredProcedure;
         com.CommandText = "insert_item_sold";

         com.Parameters.AddWithValue("@Item_detail", details);

         try
         {
             con.Open();
             com.ExecuteNonQuery();
             return true;
         }
         catch (Exception ex)
         {
             return false;
             throw ex;
         }

         finally
         {
             con.Close();

         }


     }


    //Method to updat the order
     public bool Order(string CustomerId, decimal Price)
     {
         try
         {

             bool flag = false;
             con = new SqlConnection(connectionString); ;
             cmd = new SqlCommand();
             cmd.CommandText = "sp_UpdateOrder";
             cmd.CommandType = CommandType.StoredProcedure;
             cmd.Connection = con;
             SqlParameter param = cmd.CreateParameter();
             param.ParameterName = "@CustomerId";
             param.Value = CustomerId;
             param.DbType = DbType.String;
             cmd.Parameters.Add(param);

             param = cmd.CreateParameter();
             param.ParameterName = "@Price";
             param.Value = Price;
             param.DbType = DbType.Currency;
             cmd.Parameters.Add(param);
             //  CatagoryInfo.CategoryId = Convert.ToInt32(cmd.ExecuteScalar());
             cmd.Connection.Open();
             int noOfRows = cmd.ExecuteNonQuery();
             cmd.Connection.Close();
             if (noOfRows == 1)
             {
                 flag = true;
             }
             else
             {
                 flag = false;
             }

             return flag;

         }
         catch (Exception ex)
         {

             throw ex;
         }
     }
}