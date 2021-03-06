﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace DiskInventory.Models
{
    public partial class Borrower
    {
        public Borrower()
        {
            DiskHasBorrower = new HashSet<DiskHasBorrower>();
        }

        public int BorrowerId { get; set; }

        [Required(ErrorMessage="Please enter a First Name.")]

        public string Fname { get; set; }

        [Required]
        public string Lname { get; set; }

        [Required]
        public string PhoneNum { get; set; }

        [Required]
        public virtual ICollection<DiskHasBorrower> DiskHasBorrower { get; set; }
    }
}
