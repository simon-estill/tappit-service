using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System.Threading.Tasks;
using tappit_service.Services;
using tappit_service.Models;
using System;

namespace tappit_service.Controllers
{
    [Route("api/v1/[Controller]")]
    [ApiController]
    public class PersonController : ControllerBase
    {

        private readonly ILogger<PersonController> _logger;
        private readonly IPersonService _personService;
        public PersonController(ILogger<PersonController> logger, IPersonService personsService)
        {
            _logger = logger;
            _personService = personsService;
        }

        [HttpGet]
        [Route("Person")]
        public async Task<IActionResult> GetPerson(long personId)
        {
            var person = await _personService.GetPerson(personId);
            return Ok(person);
        }

        [HttpGet]
        [Route("Persons")]
        public async Task<IActionResult> GetPersons()
        {
            var persons = await _personService.GetPersons();
            return Ok(persons);
        }


        [HttpPost]
        [Route("UpdatePerson")]
        public async Task<IActionResult> UpdatePerson([FromBody] Person person)
        {
            if (!ModelState.IsValid)
                throw new ArgumentException("Invalid request parameters.");

            var reference = await _personService.UpdatePerson(person);
            return Ok(reference);
        }


    }
}
