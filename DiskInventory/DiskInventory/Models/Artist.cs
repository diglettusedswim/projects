﻿using System;
using System.Collections.Generic;

namespace DiskInventory.Models
{
    public partial class Artist
    {
        public Artist()
        {
            DiskHasArtist = new HashSet<DiskHasArtist>();
        }

        public int ArtistId { get; set; }
        public string Fname { get; set; }
        public string Lname { get; set; }
        public int ArtistTypeId { get; set; }

        public virtual ArtistType ArtistType { get; set; }
        public virtual ICollection<DiskHasArtist> DiskHasArtist { get; set; }
    }
}