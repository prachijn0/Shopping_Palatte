using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Product
/// </summary>
public class Product
{
    private int productId;
    private int categoryId;
    private string productName;
    private string productDesc;
    private string productImage;
    private decimal productPrice;
    private int inStock;
    private int sold;
    private int quantity;
   
    // public member can be accessed by external source. all class have access to this method

    // Method which CategoryID
    public int CategoryId
    {
        get { return categoryId; }
        set { categoryId = value; }
    }
    // Method which return ProductId
    public int ProductId
    {
        get { return productId; }
        set { productId = value; }
    }
    //Method Which return ProductNmae
    public string ProductName
    {
        get { return productName; }
        set { productName = value; }
    }
    //Product which return Product in descending order
    public string ProductDesc
    {
        get { return productDesc; }
        set { productDesc = value; }
    }
    // Method which return Product Image
    public string ProductImage
    {
        get { return productImage; }
        set { productImage = value; }
    }
    //Method which return ProductPricee
    public decimal ProductPrice
    {
        get { return productPrice; }
        set { productPrice = value; }
    }
    //Method which Return Instock Item
    public int InStock
    {
        get { return inStock; }
        set { inStock = value; }
    }
    //Method which Return Sold
    public int Sold
    {
        get { return sold; }
        set { sold = value; }
    }
    //Method which Return Quantity
    public int Quantity
    {
        get
        { return quantity; }
        set { quantity = value; }
    }
    //Method which Return Product
	public Product()
	{
		
	}
    public Product(int id, string name, decimal price, int quantity) 
    {
        this.productId = id;
        this.productName = name;
        this.productPrice = price;
        this.quantity = quantity;
    }
}