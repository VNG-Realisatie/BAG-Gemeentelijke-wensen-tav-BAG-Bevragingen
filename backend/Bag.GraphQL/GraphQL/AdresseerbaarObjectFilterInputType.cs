using HotChocolate.Data.Filters;
using HotChocolate.Types;
using HotChocolate.Types.Spatial;
using NetTopologySuite.Geometries;

namespace Bag.GraphQL.GraphQL
{
    public class AdresseerbaarObjectFilterInputType : FilterInputType<AdresseerbaarObject>
    {
        protected override void Configure(IFilterInputTypeDescriptor<AdresseerbaarObject> descriptor)
        {
            descriptor.BindFieldsExplicitly();
            descriptor.Field(f => f.Type).Type<TypeAdresseerbaarObjectFilter>();
            descriptor.Field(f => f.Geometrie);
            descriptor.Field(f => f.Panden);
        }
    }

    public class TypeAdresseerbaarObjectFilter : EnumOperationFilterInputType<TypeAdresseerbaarObjectEnum>
    {
        protected override void Configure(IFilterInputTypeDescriptor descriptor)
        {
            descriptor.Operation(DefaultFilterOperations.Equals).Type<EnumType<TypeAdresseerbaarObjectEnum>>();
            descriptor.Operation(DefaultFilterOperations.In).Type<EnumType<TypeAdresseerbaarObjectEnum>>();
        }
    }

    public class PandFilterInputType : FilterInputType<Pand>
    {
        protected override void Configure(IFilterInputTypeDescriptor<Pand> descriptor)
        {
            descriptor.BindFieldsExplicitly();
            descriptor.Field(f => f.OorspronkelijkBouwjaar);
        }
    }

    public class AdresseerbaarObjectGeometrie : HotChocolate.Types.UnionType
    {
        protected override void Configure(IUnionTypeDescriptor descriptor)
        {
            descriptor.Name("AdresseerbaarObjectGeometrie");

            descriptor.Type<GeoJsonPointType>();
            descriptor.Type<GeoJsonPolygonType>();
        }
    }
}
