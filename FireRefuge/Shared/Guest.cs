using System;
using System.Collections.Generic;
using System.Text;

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

    public class Guest
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public string Status { get; set; }
        public int Adults { get; set; }
        public int Children { get; set; }
        public int Pets { get; set; }

    }
}
