using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace DiskInventory.Models
{
    public partial class DiskHasBorrower
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "Please enter a borrower.")]
        public int BorrowerId { get; set; }

        public virtual Borrower Borrower { get; set; }
        
        [Required(ErrorMessage = "Please enter a disk.")]

        public int DiskId { get; set; }
        [Required(ErrorMessage = "Please enter a borrowed date.")]

        public DateTime BorrowerDate { get; set; }

        public DateTime? ReturnedDate { get; set; }
        
        public virtual Disk Disk { get; set; }
    }
}
