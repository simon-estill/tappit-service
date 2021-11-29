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
    public class PersonService : IPersonService
    {
        private readonly string _connectionString;
       
        public PersonService(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("Database");
        }

        public async Task<List<Person>> GetPersons()
        {
           
            using(var con = new SqlConnection(_connectionString))
            {
                con.Open();
                var persons = con.Query<Person>(@"SELECT  People.PersonId, FirstName, LastName, Sports.Name as FavouriteSport, People.IsEnabled as IsEnabled, IsAuthorised, IsValid FROM People JOIN FavouriteSports On People.PersonId = FavouriteSports.PersonId JOIN Sports On Sports.SportId = FavouriteSports.SportId").ToList();
                persons.ForEach(p => p.IsPalindrome = IsPalindrome(p.FirstName));

                var grouped = persons.GroupBy(_ => _.PersonId);
                var personsCondensed = new List<Person>();
                foreach(var g in grouped)
                {
                    var favouriteSports = String.Empty;
                    foreach(var p  in g)
                    {
                        favouriteSports += p.FavouriteSport + ", ";
                    }
                    var person = g.First();
                    person.FavouriteSport = favouriteSports;
                    personsCondensed.Add(person);
                }
                
                return personsCondensed;
            }
           
        }

        public async Task<Person> GetPerson(long personId)
        {
            using (var con = new SqlConnection(_connectionString))
            { 
                con.Open();
                var persons = con.Query<Person>(@"SELECT People.PersonId, FirstName, LastName, Sports.Name as FavouriteSport, People.IsEnabled as IsEnabled, IsAuthorised, IsValid FROM People JOIN FavouriteSports On People.PersonId = FavouriteSports.PersonId JOIN Sports On Sports.SportId = FavouriteSports.SportId WHERE People.PersonId = @PersonId",
                new {PersonId = personId });
                if (persons != null)
                {
                    var favouriteSports = String.Empty;
                    foreach(var p in persons)
                    {
                        favouriteSports += p.FavouriteSport + ", ";
                    }
                    var person = persons.FirstOrDefault();
                    person.FavouriteSport = favouriteSports;
                    person.IsPalindrome = IsPalindrome(person.FirstName);
                    return person;
                }
                return null;
            }
        }


        public async Task<long> UpdatePerson(Person person)
        {
            using (var con = new SqlConnection(_connectionString))
            {
                con.Open();
                string update = "UPDATE dbo.People Set FirstName = @FirstName, LastName = @LastName, IsAuthorised = @IsAuthorised, IsEnabled = @IsEnabled, IsValid = @IsValid WHERE PersonId = @PersonId";
                int result = con.Execute(update,
                  person);
                return result;
            }
        }


        public bool IsPalindrome(string name)
        {
            var nameLower = name.ToLower();
            var reversed = nameLower.ToCharArray().Reverse().ToArray();
            var reverse = new string(reversed);
            if (reverse == nameLower)
                return true;
            return false;
        }


       
    }
}
