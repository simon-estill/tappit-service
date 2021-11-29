using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System.Collections.Generic;
using Xunit;
using Moq;
using tappit_service.Controllers;
using tappit_service.Models;
using tappit_service.Services;

namespace tappit_service_tests
{
    public class PersonControllerTests
    {
        private readonly PersonController _personsController;
        private readonly Mock<IPersonService> _mockPersonService = new Mock<IPersonService>();
        private readonly Mock<ILogger<PersonController>> _mockLogger = new Mock<ILogger<PersonController>>();

        public PersonControllerTests()
        {
            _personsController = new PersonController(_mockLogger.Object, _mockPersonService.Object);
        }
        [Fact]
        public void Persons_ShouldReturn_Ok()
        {
            var persons = new List<Person>();

            persons.Add(new Person { FirstName = "Anna", LastName = "Smith",IsAuthorised =true, IsEnabled = true, IsValid = true, IsPalindrome= true, PersonId = 1, FavouriteSport = "Cricket" });
            persons.Add(new Person { FirstName = "Steven", LastName = "Jones", IsAuthorised = true, IsEnabled = true, IsValid = true, IsPalindrome = true, PersonId = 2, FavouriteSport = "Cycling" });
            persons.Add(new Person { FirstName = "Bob", LastName = "White", IsAuthorised = true, IsEnabled = true, IsValid = true, IsPalindrome = true, PersonId = 3, FavouriteSport = "Cricket"  });


            _mockPersonService.Setup(_ => _.GetPersons()).ReturnsAsync(persons);

            var response = _personsController.GetPersons().Result;
            var statusResponse = response as OkObjectResult;

            Assert.NotNull(response);
            Assert.Equal(200, statusResponse.StatusCode);
        }

        [Fact]
        public void Person_ShouldReturn_Ok()
        {
            var person = new Person
            {
                FirstName = "Anna",
                LastName = "Smith",
                IsAuthorised = true,
                IsEnabled = true,
                IsValid = true,
                IsPalindrome = true,
                PersonId = 1,
                FavouriteSport = "Cricket"
            };
            

            _mockPersonService.Setup(_ => _.GetPerson(It.IsAny<long>())).ReturnsAsync(person);

            var response = _personsController.GetPersons().Result;
            var statusResponse = response as OkObjectResult;

            Assert.NotNull(response);
            Assert.Equal(200, statusResponse.StatusCode);
        }

        [Fact]
        public void UpdatePerson_ShouldReturnOk()
        {
            var person = new Person
            {
                FirstName = "Anna",
                LastName = "Smith",
                IsAuthorised = true,
                IsEnabled = true,
                IsValid = true,
                IsPalindrome = true,
                PersonId = 1,
                FavouriteSport = "Cricket"
            };

            _mockPersonService.Setup(_ => _.UpdatePerson(It.IsAny<Person>())).ReturnsAsync(1);
            var response = _personsController.UpdatePerson(person).Result;
            var statusResponse = response as OkObjectResult;

            Assert.NotNull(response);
            Assert.Equal(200, statusResponse.StatusCode);
        }

    }
}
