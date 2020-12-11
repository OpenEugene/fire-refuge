using FireRefuge.Shared;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using FireRefuge.Server.Services;
using Npgsql;
using RepoDb.PostgreSql;
using RepoDb;

namespace FireRefuge.Server.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class GuestController : ControllerBase
    {
        const string ConnectionString = "Host=localhost;Username=postgres;Password=postgres;Database=FireRefuge";

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
            using (var connection = new NpgsqlConnection(ConnectionString))
            {
                try
                {
                    var obj = connection.Insert(guest);
                    var name = obj.ToString();
                }
                catch (Exception e) {
                    var message = e.Message;
                } 
            }
        }
    }
}
