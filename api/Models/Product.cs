using System.Text.Json.Serialization;

public class Product
{
    public int ProductID { get; set; }
    public string ProductName { get; set; } = string.Empty;
    [JsonIgnore]
    public int CategoryID { get; set; }
    [JsonIgnore]
    public int SubCategoryID { get; set; }
    public string Category { get; set; } = string.Empty;
    public string SubCategory { get; set; } = string.Empty;
    public decimal UnitPrice { get; set; }
    public int Inventory { get; set; }
}
