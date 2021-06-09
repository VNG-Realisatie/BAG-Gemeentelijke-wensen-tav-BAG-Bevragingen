using Bag.GraphQL.GraphQL;
using HotChocolate.Data;
using System.Collections.Generic;
using System.Linq;

namespace Bag.GraphQL
{
    public class Query
    {
        [UseFiltering]
        [UseSorting]
        //[UseFiltering(typeof(AdresseerbaarObjectFilterInputType))]
        public IQueryable<AdresseerbaarObject> GetAdresseerbareObjecten()
        {
            return new List<AdresseerbaarObject>().AsQueryable();
        }

        [UseFiltering]
        [UseSorting]
        //[UseFiltering(typeof(PandFilterInputType))]
        public IQueryable<Pand> Panden()
        {
            return new List<Pand>().AsQueryable();
        }
    }
}
