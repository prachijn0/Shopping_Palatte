using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Category
/// </summary>
public class Category
{
    // Empty Constructor
	public Category()
	{

	}
    private int categoryId;
    private string categoryName;
    // Method that Return the Category Id
    public int CategoryId
    {
        get { return categoryId; }
        set { categoryId = value; }
    }
    // Method that return Category Name
    public string CategoryName
    {
        get { return categoryName; }
        set { categoryName = value; }
    }

    
}