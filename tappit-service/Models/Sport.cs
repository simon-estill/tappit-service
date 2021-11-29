using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace tappit_service.Models
{
    public class Sport
    {
        public long SportId { get; set; }
        public string Name { get; set; }
        public bool IsEnabled { get; set; }
    }
}
