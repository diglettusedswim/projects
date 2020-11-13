using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using DiskInventory.Models;

namespace DiskInventory.Controllers
{
    public class DiskController : Controller
    {
        private disk_inventorykkContext context { get; set; }
        public DiskController(disk_inventorykkContext ctx)
        {
            context = ctx;
        }
        public IActionResult List()
        {
            List<Disk> disks = context.Disk.OrderBy(a => a.DiskName).ToList();
            return View(disks);
        }
    }
}
