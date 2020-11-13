#pragma checksum "C:\New folder\projects\DiskInventory\DiskInventory\Views\Disk\List.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "37fc05405b08f6b72e729d400cf350d43f8b6027"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_Disk_List), @"mvc.1.0.view", @"/Views/Disk/List.cshtml")]
namespace AspNetCore
{
    #line hidden
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Threading.Tasks;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.AspNetCore.Mvc.Rendering;
    using Microsoft.AspNetCore.Mvc.ViewFeatures;
#nullable restore
#line 1 "C:\New folder\projects\DiskInventory\DiskInventory\Views\_ViewImports.cshtml"
using DiskInventory;

#line default
#line hidden
#nullable disable
#nullable restore
#line 2 "C:\New folder\projects\DiskInventory\DiskInventory\Views\_ViewImports.cshtml"
using DiskInventory.Models;

#line default
#line hidden
#nullable disable
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"37fc05405b08f6b72e729d400cf350d43f8b6027", @"/Views/Disk/List.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"71fcf1ec9a08e63548f6b2cf1328f6c42701ad4d", @"/Views/_ViewImports.cshtml")]
    public class Views_Disk_List : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<List<DiskInventory.Models.Disk>>
    {
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
#nullable restore
#line 2 "C:\New folder\projects\DiskInventory\DiskInventory\Views\Disk\List.cshtml"
  
    ViewBag.Title = "Disk Manager";

#line default
#line hidden
#nullable disable
            WriteLiteral("<h1>");
#nullable restore
#line 5 "C:\New folder\projects\DiskInventory\DiskInventory\Views\Disk\List.cshtml"
Write(ViewBag.Title);

#line default
#line hidden
#nullable disable
            WriteLiteral("</h1>\r\n<h2>List of Artists</h2>\r\n\r\n");
#nullable restore
#line 8 "C:\New folder\projects\DiskInventory\DiskInventory\Views\Disk\List.cshtml"
 if (Model.Count() > 0)
{

#line default
#line hidden
#nullable disable
            WriteLiteral(@"    <table class=""table table-bordered table-striped"">
        <thead>
            <tr>
                <th>Disk ID</th>
                <th>Disk Name</th>
                <th>Release Date</th>
                <th>Genre</th>
                <th>Status</th>
                <th>Type</th>
            </tr>
        </thead>
        <tbody>
");
#nullable restore
#line 22 "C:\New folder\projects\DiskInventory\DiskInventory\Views\Disk\List.cshtml"
             foreach (var disk in Model)
            {

#line default
#line hidden
#nullable disable
            WriteLiteral("            <tr>\r\n                <td>");
#nullable restore
#line 25 "C:\New folder\projects\DiskInventory\DiskInventory\Views\Disk\List.cshtml"
               Write(disk.DiskId);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\r\n                <td>");
#nullable restore
#line 26 "C:\New folder\projects\DiskInventory\DiskInventory\Views\Disk\List.cshtml"
               Write(disk.DiskName);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\r\n                <td>");
#nullable restore
#line 27 "C:\New folder\projects\DiskInventory\DiskInventory\Views\Disk\List.cshtml"
               Write(disk.ReleaseDate);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\r\n                <td>");
#nullable restore
#line 28 "C:\New folder\projects\DiskInventory\DiskInventory\Views\Disk\List.cshtml"
               Write(disk.GenreId);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\r\n                <td>");
#nullable restore
#line 29 "C:\New folder\projects\DiskInventory\DiskInventory\Views\Disk\List.cshtml"
               Write(disk.StatusId);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\r\n                <td>");
#nullable restore
#line 30 "C:\New folder\projects\DiskInventory\DiskInventory\Views\Disk\List.cshtml"
               Write(disk.DiskTypeId);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\r\n            </tr>\r\n");
#nullable restore
#line 32 "C:\New folder\projects\DiskInventory\DiskInventory\Views\Disk\List.cshtml"
            }

#line default
#line hidden
#nullable disable
            WriteLiteral("        </tbody>\r\n        \r\n    </table>\r\n");
#nullable restore
#line 36 "C:\New folder\projects\DiskInventory\DiskInventory\Views\Disk\List.cshtml"
}
else
{

#line default
#line hidden
#nullable disable
            WriteLiteral("    <div>\r\n        No Data Found.\r\n    </div>\r\n");
#nullable restore
#line 42 "C:\New folder\projects\DiskInventory\DiskInventory\Views\Disk\List.cshtml"
}

#line default
#line hidden
#nullable disable
        }
        #pragma warning restore 1998
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.ViewFeatures.IModelExpressionProvider ModelExpressionProvider { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IUrlHelper Url { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IViewComponentHelper Component { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IJsonHelper Json { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<List<DiskInventory.Models.Disk>> Html { get; private set; }
    }
}
#pragma warning restore 1591
