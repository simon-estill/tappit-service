using System;
using System.Collections.Generic;
using System.Linq;
using System.ComponentModel.DataAnnotations;
using System.Threading.Tasks;

namespace tappit_service.Models
{
    public class Person
    {
        [Required]
        public long PersonId { get; set; }
        [Required]
        public string FirstName { get; set; }
        [Required]
        public string LastName { get; set; }
        [Required]
        public bool IsEnabled { get; set; }
        [Required]
        public bool IsValid {get;set;}
        [Required]
        public bool IsAuthoristed { get; set; }
        public bool IsPalindrome { get; set; }
        public string FavouriteSport { get; set; }
    }
}
