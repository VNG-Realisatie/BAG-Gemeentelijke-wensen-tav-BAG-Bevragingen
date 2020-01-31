# language: nl
Functionaliteit: Adres met free text zoeken

Achtergrond:
    Gegeven BAG bevat de volgende adressen
    |keuze item identificatie | straatnaam    | huisnummer | nummeraanduiding id | ado id   | 
    | 15gaj5y                 | Dalfsenstraat | 1          | NA.1234             | ADO.3456 |
    | 2354agk                 | Dalfsenstraat | 2          | NA.2345             | ADO.4567 |

Scenario: response in HAL, geen url templating toegepast
    Als de request GET {baseUrl}/adressen/zoeken?zoekTerm=dalfsenstr wordt verstuurd
    Dan bevat de response de volgende keuze items met een link om het adres te bevragen
    """
    {
        "_links": {
            "self": {
                "href": "/adressen/zoeken?zoekTerm=dalfsenstr"
            }
        },
        "_embedded": {
            "keuzeItems": [
                {
                    "weergaveNaam": "Dalfsenstraat 1",
                    "_links": {
                        # keuzeItem is geen resource, daarom geen self HalLink toegevoegd
                        "adres": {
                            "href": "/adressen/15gaj5y"
                        },
                        "adresMbvNummeraanduidingIdentificatie": {
                            "href": "/adressen?nummeraanduidingIdentificatie=NA.1234"
                        },
                        "adresMbvAdresseerbaarObjecIdentificatie": {
                            "href": "/adressen?adresseerbaarObjectIdentificatie=ADO.3456"
                        }
                    }
                },
                {
                    "weergaveNaam": "Dalfsenstraat 2",
                    "_links": {
                        "adres": {
                            "href": "/adressen/2354agk"
                        },
                        "adresMbvNummeraanduidingIdentificatie": {
                            "href": "/adressen?nummeraanduidingIdentificatie=NA.2345"
                        },
                        "adresMbvAdresseerbaarObjecIdentificatie": {
                            "href": "/adressen?adresseerbaarObjectIdentificatie=ADO.4567"
                        }
                    }
                }
            ]
        }
    }
    """

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
            },
            "adresMbvNummeraanduidingIdentificatie": {
                "href": "/adressen?nummeraanduidingIdentificatie={nummeraanduidingIdentificatie}",
                "templated": true
            },
            "adresMbvAdresseerbaarObjecIdentificatie": {
                "href": "/adressen?adresseerbaarObjectIdentificatie={adresseerbaarObjectIdentificatie}",
                "templated": true
            }
        },
        "_embedded": {
            # keuzeItem hoeft geen HAL Resource te zijn
            "keuzeItems": [
                {
                    "weergaveNaam": "Dalfsenstraat 1",
                    "technischAdresId": "15gaj5y",
                    "nummeraanduidingIdentificatie": "NA.1234"
                    "adresseerbaarObjectIdentificatie": "ADO.3456"
                },
                {
                    "weergaveNaam": "Dalfsenstraat 2",
                    "technischAdresId": "2354agk",
                    "nummeraanduidingIdentificatie": "NA.2345"
                    "adresseerbaarObjectIdentificatie": "ADO.4567"
                }
            ]
        }
    }
    """