# Voorbeelden Zoek queries

## Zoek appartements-adressen in een bepaald gebied en bouwjaar (US380)

``` graphql
query {
  adresseerbareObjecten(where: {
    and: [
      {
        type: {eq: LIGPLAATS},
      }
      {
        geometrie: {
          within: {
            geometry: { type: Polygon, coordinates: [] }
          }
        }
      }
      {
        panden: {
          all: {
            oorspronkelijkBouwjaar: { gte: 1970, lt: 2010 }
          }
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
```

## Zoek AdresseerbareObjecten in een gebied (US 373)

``` graphql
query {
  adresseerbareObjecten(where: {
    geometrie: {
      within: {
          geometry: { type: Polygon, coordinates: [] }
      }
    }
  }) {
    adressen {
      adresregel1
      adresregel2
    }
  }
}
```

## Zoek AdresseerbareObjecten met status, geconstateerd, gebruiksdoel, en/of type en geometrie of woonplaats (US 334)

``` graphql
query {
  adresseerbareObjecten(where: {
    and: [
      {
        type: { eq: LIGPLAATS }
      }
      {
        geometrie: {
          within: {
            geometry: { type: Polygon, coordinates: []}
          }
        }
      }
      {
        geconstateerd: { eq: true }
      }
      {
        gebruiksdoelen: {
          some: {
            in: [
              WINKEL_FUNCTIE
              OVERIGE_GEBRUIKS_FUNCTIE
            ]
          }
        }
      }
      {
        adressen: {
          all: { or: [
            { woonplaats: {eq: "Den Haag"}}
            { woonplaats: {eq: "'s-Gravenhage"}}
          ]}
        }
      }
    ]}) {
    id
    geometrie {
      ... on GeoJSONPointType {
        type
        point: coordinates
      }
      ... on GeoJSONPolygonType {
        type
        polygon: coordinates
      }
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
```

## Zoek Panden met geometrie in combinatie met status en geconstateerd (US 335, US 333)

``` graphql
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
```

## Sorteer resultaat, ook de sub-resultaten (US 375)

```graphql
query {
  adresseerbareObjecten(where: {
    geometrie: {
      within: {
        geometry: { type: Polygon, coordinates: [] }
      }
    }
  } order: {
    type: ASC
  }) {
    adressen(order: { adresregel2: ASC, adresregel1: ASC }) {
      adresregel1
      adresregel2
    }
  }
}
```

## Zoek AdresseerbareObjecten met geometrie, type, gebruiksdoel en oppervlakte (US 332, US 331, US 306)

``` graphql
query {
  adresseerbareObjecten(where: {
    and: [
      {
        geometrie: {
          within: { geometry: { type: Polygon, coordinates: [] }
          }
        }
      }
      {
        gebruiksdoelen: { 
          some: {
            in: [WOON_FUNCTIE, WINKEL_FUNCTIE, KANTOOR_FUNCTIE]
          }
        }
      }
      {
        type: {eq: VERBLIJFSOBJECT}
      }
      {
        panden: {
          some: {
            oppervlakte: { gte: 100, lte: 200 }
          }
        }
      }
    ]
  }) {
    id
    adressen {
      adresregel1
      adresregel2
    }
  }
}
```

## Zoek AdresseerbareObjecten binnen een polygon van type standplaats. Retourneer eerste 5 panden en nummeraanduidingen van gevonden AdresseerbareObjecten

```graphql
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
