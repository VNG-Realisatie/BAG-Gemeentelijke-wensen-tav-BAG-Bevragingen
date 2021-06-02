# Voorbeelden Zoek queries

## Zoek appartements-adressen in een bepaald gebied en bouwjaar (US380)

``` json
{
  query {
    adresseerbareObjecten(where: {
      type: {
        eq: verblijfsobject
      }
      and: [
        {
          geometrie: {
            in: { type: Polygon, coordinates: []}
          }
        },
        {
          pand: {
            bouwjaar: { gte: 1970, lte: 2000 }
            // optie 2
            // bouwjaar: {
            //   gte: 1970, and: { lte: 2000 }}
          }
        }
      ]
    }) {
      adressen {
        adresregel1
        adresregel2
      }
    }
  }
}
```

## Zoek AdresseerbareObjecten vanaf een punt binnen een straal

```json
{
  query {
    adresseerbareObjecten(where: {
      geometrie: {
        within: {
          geometrie: { type: Point, coordinates: [1,1] },
          radius: 100
        }
      }
    }) {
      id
      type
      geometrie
    }
  }
}
```

## Zoek AdresseerbareObjecten binnen een polygon van type standplaats. Retourneer eerste 5 panden en nummeraanduidingen van gevonden AdresseerbareObjecten

```json
{
  query {
    adresseerbareObjecten(where: {
      geometrie: {
        in: {
          geometrie: { type: Polygon, coordinates: [[[1,1], [100, 100], [1, 1]]] },
        }
      }
    }) {
      id
      type
      geometrie
      panden(page: 1, pageSize: 5) {
        geometrie
        geconstateerd
      }
      nummeraanduidingen(page: 1, pageSize: 5) {
        postcode
        huisnummer
      }
    }
  }
}
```
