using FireRefuge.Shared;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace FireRefuge.Server.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class GuestController : ControllerBase
    {
       

        private readonly ILogger<WeatherForecastController> _logger;

        public GuestController(ILogger<WeatherForecastController> logger)
        {
            _logger = logger;
        }

        [HttpGet]
        public IEnumerable<Guest> Get()
        {
            return new List<Guest>();
        }

        [HttpPost]
        public async Task Post([FromBody] Guest guest)
        {
            var name = guest.Name;
        }
    }
}
