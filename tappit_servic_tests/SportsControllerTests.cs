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
    public class SportControllerTests
    {
        private readonly SportController _personsController;
        private readonly Mock<ISportsService> _mockPersonService = new Mock<ISportsService>();
        private readonly Mock<ILogger<SportController>> _mockLogger = new Mock<ILogger<SportController>>();

        public SportControllerTests()
        {
            _personsController = new SportController(_mockLogger.Object, _mockPersonService.Object);

        }
        [Fact]
        public void Persons_ShouldReturn_Ok()
        {
            var favouriteSports = new List<FavouriteSportCount>();

            favouriteSports.Add(new FavouriteSportCount { Name = "Cricket", SportCount = 4 });
            favouriteSports.Add(new FavouriteSportCount { Name = "Rugby League", SportCount = 2 });
            favouriteSports.Add(new FavouriteSportCount { Name = "Cycling", SportCount = 2 });


            _mockPersonService.Setup(_ => _.GetSportsCount()).ReturnsAsync(favouriteSports);

            var response = _personsController.FavouriteSports().Result;
            var statusResponse = response as OkObjectResult;

            Assert.NotNull(response);
            Assert.Equal(200, statusResponse.StatusCode);
        }
    }
}
