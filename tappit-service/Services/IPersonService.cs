using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using tappit_service.Models;

namespace tappit_service.Services
{
    public interface IPersonService
   {
      Task<List<Person>> GetPersons();
      Task<Person> GetPerson(long personId);
       Task<long> UpdatePerson(Person person);

    }
}
