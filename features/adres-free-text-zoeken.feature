# language: nl
Functionaliteit: Adres met free text zoeken

Design Decision:
Als de response een grote lijst kan bevatten (bijvoorbeeld free text search), dan gebruik maken van url templating en de url opnemen in de root _links.
Reden: Een url voor elke item in de lijst genereren kost meer tijd en maakt de response onnodig groter

Achtergrond:
    Gegeven BAG bevat de volgende adressen
    |zoekresultaatidentificatie | straatnaam    | huisnummer |
    | 15gaj5y                   | Dalfsenstraat | 1          |
    | 2354agk                   | Dalfsenstraat | 2          |

Scenario: response in HAL, url templating toegepast
    Als de request GET {baseUrl}/adressen/zoek?zoek=dalfsenstr wordt verstuurd
    Dan bevat de response de volgende keuze items met een link om het adres te bevragen
    """
    {
    "_links": {
      "self": {
        "href": "{server}/{major-versie}/adressen/zoeken?zoek=dalfsenstr",
        "templated": true,
        "title": "string"
      },
      "first": {
        "href": "{server}/{major-versie}/adressenzoek=dalfsenstr?page=1",
        "templated": true,
        "title": "Eerste pagina"
      },
      "previous": {
        "href": "{server}/{major-versie}/adressenzoek=dalfsenstr?page=3",
        "templated": true,
        "title": "Vorige pagina"
      },
      "next": {
        "href": "{server}/{major-versie}/adressenzoek=dalfsenstr?page=5",
        "templated": true,
        "title": "Volgende pagina"
      }
    },
    "_embedded": {
      "zoekresultaten": [
        {
          "omschrijving": "Dalfsenstraat 1",
          "identificatie": "15gaj5y",
          "_links": {
            "adres": {
              "href": "{server}/{major-versie}/adressen/{zoekresultaatidentificatie}",
              "templated": true
            }
          }
        },
        {
          "omschrijving": "Dalfsenstraat 2",
          "identificatie": "2354agk",
          "_links": {
            "adres": {
              "href": "{server}/{major-versie}/adressen/{zoekresultaatidentificatie}",
              "templated": true
            }
          }
        }
      ]
    }
    """
