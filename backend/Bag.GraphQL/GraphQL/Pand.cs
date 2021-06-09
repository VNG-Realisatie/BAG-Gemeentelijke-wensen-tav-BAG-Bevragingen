using NetTopologySuite.Geometries;
using System.Collections.Generic;

namespace Bag.GraphQL.GraphQL
{
    public class Pand
    {
        public int Id { get; set; }
        public Point Geometrie { get; set; }
        public int OorspronkelijkBouwjaar { get; set; }
        public StatusPandEnum Status { get; set; }
        public bool Geconstateerd { get; set; }
        public int Oppervlakte { get; set; }
        public List<Adres> Adressen { get; set; }
        public List<AdresseerbaarObject> AdresseerbaarObjecten { get; set; }
    }
}
