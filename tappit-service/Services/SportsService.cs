using Dapper;
using Microsoft.Extensions.Configuration;
using System;
using System.Data.SqlClient;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using tappit_service.Models;

    namespace tappit_service.Services
{
    public class SportsService : ISportsService
    {

            private readonly string _connectionString;

            public SportsService(IConfiguration configuration)
            {
                _connectionString = configuration.GetConnectionString("Database");
            }
            
            public async Task<List<FavouriteSportCount>> GetSportsCount()
            {   
                using (var con = new SqlConnection(_connectionString))
                {
                    con.Open();
                    var favouriteSports = con.Query<FavouriteSportCount>(@"Select Name, COUNT(FavouriteSports.SportId) AS SportCount From Sports Join FavouriteSports on FavouriteSports.SportId = Sports.SportId Group By Sports.Name ORDER BY SportCount DESC").ToList();
                    return favouriteSports;
                }

               
        }

    }
}
