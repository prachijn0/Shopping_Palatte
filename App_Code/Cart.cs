using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Cart
/// </summary>
public class Cart
{
    private int productId;
    private string productName;
    private int quantity;
    private byte[] image;
    private decimal price;
    private decimal totalPrice;

    // Public Method can be accessed by all Class

    // Methods which returns ProductId in the cart
    public int ProductId
    {
        get { return productId; }
        set { productId = value; }
    }
    //Method to know the Product Name in the cart
    public string ProductName
    {
        get { return productName; }
        set { productName = value; }
    }
    //Method to know the quantity of the items in the cart
    public int Quantity
    {
        get { return quantity; }
        set { quantity = value; }
    }
    // Method to return the image in the cart
    public byte[] Image
    {
        get { return image; }
        set { image = value; }
    }
    //Method to return the Decimal price value in the cart
    public decimal Price
    {
        get { return price; }
        set { price = value; }
    }
    // Method to return the total price amount in the cart
    public decimal TotalPrice
    {
        get { return totalPrice; }
        set { totalPrice = value; }
    }
     // Empty constructor
	public Cart()
	{
		
	}
}