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
        public Point Geometrie { get; set; }
        public List<Adres> Adressen { get; set; }
        public List<Pand> Panden { get; set; }
    }

    public class Adres
    {
        public string Adresregel1 { get; set; }
        public string Adresregel2 { get; set; }
        public string Woonplaats { get; set; }
    }

    public class Pand
    {
        public int Id { get; set; }
        public Polygon Geometrie { get; set; }
        public int OorspronkelijkBouwjaar { get; set; }
        public StatusPandEnum Status { get; set; }
        public bool Geconstateerd { get; set; }
        public int Oppervlakte { get; set; }
        public List<Adres> Adressen { get; set; }
        public List<AdresseerbaarObject> AdresseerbaarObjecten { get; set; }
    }

    public enum StatusPandEnum
    {
        BouwvergunningVerleend,
        BouwGestart,
        PandInGebruikNietIngemeten,
        PandInGebruik,
        VerbouwingPand,
        SloopvergunningVerleend,
        PandBuitenGebruik
    }

    public enum TypeAdresseerbaarObjectEnum
    {
        Verblijfsobject,
        Standplaats,
        Ligplaats
    }

    public enum GebruiksdoelEnum
    {
        WoonFunctie,
        BijeenkomstFunctie,
        CelFunctie,
        GezondheidszorgFunctie,
        IndustrieFunctie,
        KantoorFunctie,
        LogiesFunctie,
        OnderwijsFunctie,
        SportFunctie,
        WinkelFunctie,
        OverigeGebruiksFunctie
    }

    public enum AdresseerbaarObjectStatusEnum
    {
        PlaatsAangewezen,
        VerblijfsobjectGevormd,
        VerblijfsobjectInGebruikNietIngemeten,
        VerblijfsobjectInGebruik,
        VerbouwingVerblijfsobject,
        VerblijfsobjectBuitenGebruik
    }
}
