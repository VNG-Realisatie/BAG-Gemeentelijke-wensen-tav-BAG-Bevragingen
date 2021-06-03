# Voorbeelden Zoek queries

## Zoek appartements-adressen in een bepaald gebied en bouwjaar (US380)

``` json
{
  query {
    adresseerbareObjecten(where: {
      type: {
        eq: verblijfsobject
      }
      and: {
        geometrie: {
          in: { geometry: { type: Polygon, coordinates: []}}
        }
      }
      and: {
        panden: {
          some: {
            bouwjaar: { gte: 1970, lte: 2000 }
            // optie 2
            // bouwjaar: {
            //   gte: 1970, and: { lte: 2000 }}
          }
        }
      }
    }) {
      adressen {
        adresregel1
        adresregel2
      }
    }
  }
}
```

## Zoek AdresseerbareObjecten in een gebied (US 373)

``` json
{
  query {
    adresseerbareObjecten(where: {
      geometrie: {
        in: { geometry: {type: Point, coordinates: []}, radius: 100}
      }
    }) {
      adressen {
        adresregel1
        adresregel2
      }
    }
  }
}
```

## Zoek AdresseerbareObjecten met status, geconstateerd, gebruiksdoel, en/of type en geometrie of woonplaats (US 334)

``` json
{
  query {
    adresseerbareObjecten(where: {
      geometrie: {
        within: { geometry: { type: Polygon, coordinates: []}}
      }
      gebruiksdoelen: {
        some: {
          in: [
            WINKEL_FUNCTIE,
            OVERIGE_GEBRUIKS_FUNCTIE
          ]}}
      geconstateerd: {eq: true}
      type: {eq: LIGPLAATS}
      adressen: {
        all: {woonplaats: {eq: "Den Haag"}}
      }
    })
    {
      id
      geometrie {
        type
        coordinates
      }
      geconstateerd
      gebruiksdoelen
      adressen {
        adresregel1
        adresregel2
      }
      panden {
        oorspronkelijkBouwjaar
      }
    }
  }
}
```

## Zoek Panden met geometrie in combinatie met status en geconstateerd (US 335)

``` json
{
  query {
    panden(where: {
      geometrie: {
        overlaps: { geometry: { type: Polygon, coordinates: []}}
      }
      status: {eq: PAND_BUITEN_GEBRUIK}
      geconstateerd: { eq: true}
    })
    {
      id
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
