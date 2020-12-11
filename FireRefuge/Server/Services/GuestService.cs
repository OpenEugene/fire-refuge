using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using FireRefuge.Shared;
using Npgsql;
using RepoDb.PostgreSql;
using RepoDb;

namespace FireRefuge.Server.Services
{
    public class GuestService
    {
        const string ConnectionString = "Host=localhost;Username=postgres;Password=postgres;Database=FireRefuge";

        public void AddGuest(Guest guest)
        {
            // read from database?
            using (var connection = new NpgsqlConnection(ConnectionString))
            {
                connection.Insert<Guest>(guest);
                
            }

        }
    }
}
