using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using tappit_service.Models;

namespace tappit_service.Services
{
    public interface ISportsService
    {
        Task<List<FavouriteSportCount>> GetSportsCount();
    }
}
