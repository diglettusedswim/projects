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

        [HttpGet]
        public IActionResult Add()
        {
            ViewBag.Action = "Add";
            return View("Edit", new Borrower());
        }

        [HttpGet]
        public IActionResult Edit(int id)
        {
            ViewBag.Action = "Edit";
            var borrower = context.Borrower.Find(id);
            return View(borrower);
        }

        [HttpPost]
        public IActionResult Edit(Borrower borrower)
        {
            if (ModelState.IsValid)
            {
                if (borrower.BorrowerId == 0)
                    context.Borrower.Add(borrower);
                else
                    context.Borrower.Update(borrower);
                context.SaveChanges();
                return RedirectToAction("List", "Borrower");
            }
            else
            {
                ViewBag.ACtion = (borrower.BorrowerId == 0) ? "Add" : "Edit";
                return View(borrower);
            }
        }
        [HttpGet]
        public IActionResult Delete(int id)
        {
            var borrower = context.Borrower.Find(id);
            return View(borrower);
        }
        [HttpGet]
        public IActionResult Delete(Borrower borrower)
        {
            context.Borrower.Remove(borrower);
            context.SaveChanges();
            return RedirectToAction("List", "Borrower");
        }
    }
}
