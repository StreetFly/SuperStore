using Microsoft.AspNetCore.Mvc;

namespace api.Controllers;

[ApiController]
[Route("api/[controller]")]

public class AddressesController : ControllerBase
{
    [HttpGet(Name = "GetAddresses")]
    public IActionResult Get()
    {
        return Ok(new List<Address>
        {
            new Address
            {
                AddressID = 1,
                AddressLine1 = "123 Main St",
                City = "Anytown",
                State = "CA",
                StateID = 1,
                PostalCode = 12345,
                Country = "USA",
                CountryID = 1,
                Region = "West",
                RegionID = 1,
                AddressType = "Home",
                AddressTypeID = 1,
                CustomerID = 1
            },
            new Address
            {
                AddressID = 2,
                AddressLine1 = "456 Elm St",
                City = "Othertown",
                State = "NY",
                StateID = 2,
                PostalCode = 67890,
                Country = "USA",
                CountryID = 1,
                Region = "East",
                RegionID = 2,
                AddressType = "Work",
                AddressTypeID = 2,
                CustomerID = 2
            }
        });
    }
}