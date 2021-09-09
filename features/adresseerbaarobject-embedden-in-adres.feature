# language: nl
Functionaliteit: Adresseerbaar object embedden in een adres

	Als consumer van de BAG API
	Wil ik bij het opvragen van Adressen tegelijk het bijbehorende Adresseerbaar Object kunnen opvragen
	Zodat ik niet een aparte aanroep hoeft te doen voor het opvragen van het bijbehorende Adresseerbaar object

Abstract Scenario: Opvragen van adressen en bijbehorend adresseerbaar object via het /adressen endpoint
    Als GET /adressen<query part>expand=adresseerbaarObject is aangeroepen
    Dan bevat de _embedded.adresseerbaarObject property van elk Adres in de response het bijbehorend Adresseerbaar Object

    Voorbeelden:
        | query part                                                        |
        | ?pandidentificatie=0193100000048288&                              |
        | ?adresseerbaarobjectidentificatie=0484010002033603&               |
        | ?zoekresultaatidentificatie=adr-89d5a4d96f09c60716c4671fdb9334b8& |
        | ?postcode=2391PH&huisnummer=1&                                    |
        | /0826200000016921?                                                |

Abstract Scenario: Opvragen van adressen en een deel van de kenmerken van bijbehorend adresseerbaar object via het /adressen endpoint
    Als GET /adressen<query part>expand=adresseerbaarObject.gebruiksdoelen,adresseerbaarObject.geconstateerd,adresseerbaarObject.geometrie is aangeroepen
    Dan bevat de _embedded.adresseerbaarObject property van elk Adres in de response het bijbehorend Adresseerbaar Object

    Voorbeelden:
        | query part                                                        |
        | ?pandidentificatie=0193100000048288&                              |
        | ?adresseerbaarobjectidentificatie=0484010002033603&               |
        | ?zoekresultaatidentificatie=adr-89d5a4d96f09c60716c4671fdb9334b8& |
        | ?postcode=2391PH&huisnummer=1&                                    |
        | /0826200000016921?                                                |

Rule: Foutsituaties

Abstract Scenario: Verkeerde casing
    Als GET /adressen/<nummeraanduidingidentificatie>&expand=<expand> is aangeroepen
    Dan is de response
    '''
    {
        "type": "https://tools.ietf.org/html/rfc7231#section-6.5.1",
        "title": "Een of meerdere parameters zijn niet correct.",
        "status": 400,
        "detail": "Bad request.",
        "instance": "https://api.bag.acceptatie.kadaster.nl/esd/huidigebevragingen/v1/adressen/<nummeraanduidingidentificatie>?expand=<expand>",
        "code": "paramsValidation",
        "invalidParams": [
            {
                "name": "expand",
                "code": "expand",
                "reason": "Deel van de parameterwaarde is niet correct: <expand>."
            }
        ]
    }
    '''

    Voorbeelden:
        | nummeraanduidingidentificatie | expand                             |
        | 0826200000016921              | adresseerbaarobject                |
        | 0826200000016921              | adresseerbaarObject.gebruiksDoelen |