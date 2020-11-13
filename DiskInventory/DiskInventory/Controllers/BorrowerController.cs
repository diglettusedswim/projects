using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using DiskInventory.Models;

namespace DiskInventory.Controllers
{
    public class BorrowerController : Controller
    {
        private disk_inventorykkContext context { get; set; }
        public BorrowerController(disk_inventorykkContext ctx)
        {
            context = ctx;
        }
        public IActionResult List()
        {
            List<Borrower> borrowers = context.Borrower.OrderBy(a => a.Lname).ToList();
            return View(borrowers);
        }
    }
}
