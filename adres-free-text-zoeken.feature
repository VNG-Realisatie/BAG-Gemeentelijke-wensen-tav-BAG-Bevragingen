# language: nl
Functionaliteit: Adres met free text zoeken

Design Decision:
Als de response een grote lijst kan bevatten (bijvoorbeeld free text search), dan gebruik maken van url templating en de url opnemen in de root _links.
Reden: Een url voor elke item in de lijst genereren kost meer tijd en maakt de response onnodig groter

Achtergrond:
    Gegeven BAG bevat de volgende adressen
    |keuze item identificatie | straatnaam    | huisnummer |
    | 15gaj5y                 | Dalfsenstraat | 1          |
    | 2354agk                 | Dalfsenstraat | 2          |

Scenario: response in HAL, url templating toegepast
    Als de request GET {baseUrl}/adressen/zoeken?zoekTerm=dalfsenstr wordt verstuurd
    Dan bevat de response de volgende keuze items met een link om het adres te bevragen
    """
    {
        "_links": {
            "self": {
                "href": "/adressen/zoeken?zoekTerm=dalfsenstr"
            },
            "adresMbvTechnischeId": {
                "href": "/adressen/{technischAdresId}",
                "templated": true
            }
        },
        "_embedded": {
            "keuzeItems": [
                {
                    "weergaveNaam": "Dalfsenstraat 1",
                    "technischAdresId": "15gaj5y"
                },
                {
                    "weergaveNaam": "Dalfsenstraat 2",
                    "technischAdresId": "2354agk"
                }
            ]
        }
    }
    """
