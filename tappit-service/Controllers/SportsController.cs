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
    public class SportController : ControllerBase
    {
        private readonly ILogger<SportController> _logger;
        private readonly ISportsService _sporstService;
        public SportController(ILogger<SportController> logger,ISportsService sportsService)
        {
            _sporstService = sportsService;
            _logger = logger;
        }

        [Route("FavouriteSports")]
        [HttpGet]
         public async Task<IActionResult> FavouriteSports()
         {
            return Ok(await _sporstService.GetSportsCount());
         }
    }
}
