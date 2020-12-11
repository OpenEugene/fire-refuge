using System;
using System.Collections.Generic;
using System.Text;
using RepoDb.Attributes;

namespace FireRefuge.Shared
{

    // id int NULL GENERATED ALWAYS AS IDENTITY,
    // "name" varchar(50) NULL,
    // phone varchar(12) NULL,
    // email varchar(50) NULL,
    // status varchar(50) NULL,
    // adults int NULL,
    // children int NULL,
    // pets int NULL

    [Map("guest")]
    public class Guest
    {
        [Identity]
        public int Id { get; set; }
        [Map("name")]
        public string Name { get; set; }
        [Map("phone")]
        public string Phone { get; set; }
        [Map("email")]
        public string Email { get; set; }
        [Map("status")]
        public string Status { get; set; }
        [Map("adults")]
        public int Adults { get; set; }
        [Map("children")]
        public int Children { get; set; }
        [Map("pets")]
        public int Pets { get; set; }

    }
}
