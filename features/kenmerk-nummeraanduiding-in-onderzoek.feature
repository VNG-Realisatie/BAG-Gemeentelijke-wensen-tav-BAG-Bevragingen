# language: nl
Functionaliteit: indicatie één of meerdere kenmerken van nummeraanduiding in onderzoek
Design decisions:

1. indicatie inOnderzoek (ook individuele) niet in response opnmen als de Resource of één of meerdere kenmerken van de Resource niet in onderzoek zijn
Reden:
- Het opnemen van de InOnderzoek gegevensgroep bij niet in onderzoek zorgt voor onnodig grote response

2. geen (lijst van) string om aan te geven welke kenmerk in onderzoek zijn
Reden:
- er moet dan logica worden geïmplementeerd om te achterhalen welke kenmerken in onderzoek zijn

Achtergrond:
    Gegeven BAG bevat de volgende nummeraanduidingen
    | identificatie | in onderzoek                                         |
    | 1             | nee                                                  |
    | 2             | ja, alle kenmerken                                   |
    | 3             | ja, alleen kenmerken documentDatum en documentNummer |

Scenario: nummeraanduiding is niet in onderzoek
    Als nummeraanduiding met identificatie 1 wordt bevraagd
    Dan bevat de nummeraanduiding response geen inOnderzoek kenmerk

Scenario: Eén of meerdere kenmerken zijn in onderzoek
    Als nummeraanduiding met identificatie 3 wordt bevraagd
    Dan is de waarde van inOnderzoek.documentDatum en inOnderzoek.documentNummer gelijk aan true
    En ziet de response van de nummeraanduiding er als volgt uit
    # de kenmerken van nummeraanduiding zijn weggelaten omdat ze niet relevant zijn om het gedrag van inOnderzoek te specificeren
    """
    {
        "identificatie": "3",
        ...,
        "inOnderzoek": {
            "documentDatum": true,
            "documentNummer": true
        }
    }
    """

Scenario: Alle kenmerken zijn in onderzoek
    Als nummeraanduiding met identificatie 2 wordt bevraagd
    Dan is de waarde van alle kenmerken van inOnderzoek gelijk aan true
    En ziet de response van de nummeraanduiding er als volgt uit
    # de kenmerken van nummeraanduiding zijn weggelaten omdat ze niet relevant zijn om het gedrag van inOnderzoek te specificeren
    """
    {
        "identificatie": "2",
        ...,
        "inOnderzoek": {
            "identificatie": true,
            "huisnummer": true,
            "huisletter": true,
            "huisnummerToevoeging": true,
            "postcode": true,
            "geconstateerd": true,
            "documentDatum": true,
            "documentNummer": true,
            "ligtIn": true,
            "ligtAan": true
        }
    }
    """
