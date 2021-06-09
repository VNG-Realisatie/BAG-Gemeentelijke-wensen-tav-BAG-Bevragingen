using NetTopologySuite.Geometries;
using System.Collections.Generic;

namespace Bag.GraphQL.GraphQL
{
    public class AdresseerbaarObject
    {
        public int Id { get; set; }
        public TypeAdresseerbaarObjectEnum Type { get; set; }
        public List<GebruiksdoelEnum> Gebruiksdoelen { get; set; }
        public AdresseerbaarObjectStatusEnum Status { get; set; }
        public bool Geconstateerd { get; set; }
        public Polygon Geometrie { get; set; }
        public List<Adres> Adressen { get; set; }
        public List<Pand> Panden { get; set; }
    }
}
