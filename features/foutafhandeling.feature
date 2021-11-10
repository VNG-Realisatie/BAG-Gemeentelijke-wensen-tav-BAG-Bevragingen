# language: nl
Functionaliteit: Afhandeling van fouten

    Als Consumer van de BAG API
    Wil ik consistente en gebruiksvriendelijke fout responses conform problem+json
    Zodat ik in mijn consumer applicatie de fouten eenduidig kan afhandelen.

Rule: verplichte parameter(s) zijn opgegeven

    Scenario: Verplichte parameter is niet opgegeven
        Als '/adressen/zoek' wordt aangeroepen
        Dan bevat de response de volgende velden
        | naam   | waarde                                                                            |
        | title  | Ten minste één parameter moet worden opgegeven.                                   |
        | status | 400                                                                               |
        | code   | paramsRequired                                                                    |
        | detail | Required request parameter 'zoek' for method parameter type String is not present |
        En bevat de response geen invalidParams

Rule: alleen gespecificeerde parameters mogen worden gebruikt

    Scenario: Niet gespecificeerde parameter
        Als '/adressen?straat=Spui' wordt aangeroepen
        Dan bevat de response de volgende velden
        | naam   | waarde                                        |
        | title  | Een of meerdere parameters zijn niet correct. |
        | status | 400                                           |
        | code   | paramsValidation                              |
        | detail | Bad request.                                  |
        En bevat de response de volgende invalidParams
        | name   | code         | reason                      |
        | straat | unknownParam | Parameter is niet verwacht. |

Rule: minimaal één optionele parameter is opgegeven

    Abstract Scenario: Er zijn geen parameters opgegeven
        Als '<path>' wordt aangeroepen
        Dan bevat de response de volgende velden
        | naam   | waarde                                          |
        | title  | Ten minste één parameter moet worden opgegeven. |
        | status | 400                                             |
        | code   | paramsRequired                                  |
        | detail | <error detail>                                  |
        En bevat de response geen invalidParams

        Voorbeelden:
        | path                   | error detail                                                                                                                                          |
        | /adressen              | Precies 1 parameter van pandIdentificatie, adresseerbaarObjectIdentificatie, zoekresultaatIdentificatie, postcode of huisnummer moet worden opgegeven |
        | /adresseerbareobjecten | Precies 1 parameter van nummeraanduidingIdentificatie, pandIdentificatie, pandIdentificaties of bbox moet worden opgegeven                            |
        | /panden                | Precies 1 parameter van adresseerbaarObjectIdentificatie, nummeraanduidingIdentificatie, locatie of bbox moet worden opgegeven                        |

Rule: opgegeven parameter(s) heeft een waarde

    Scenario: Er is geen waarde voor één parameter opgegeven
        Als '/adressen?pandIdentificatie=' wordt aangeroepen
        Dan bevat de response de volgende velden
        | naam   | waarde                                                                                                                                                |
        | title  | Ten minste één parameter moet worden opgegeven.                                                                                                       |
        | status | 400                                                                                                                                                   |
        | code   | paramsRequired                                                                                                                                        |
        | detail | Precies 1 parameter van pandIdentificatie, adresseerbaarObjectIdentificatie, zoekresultaatIdentificatie, postcode of huisnummer moet worden opgegeven |
        En bevat de response geen invalidParams

    Scenario: Er is geen waarde voor meerdere parameters opgegeven
        Als '/adressen?postcode=&huisnummer=' wordt aangeroepen
        Dan bevat de response de volgende velden
        | naam   | waarde                                                                                                                                                |
        | title  | Ten minste één parameter moet worden opgegeven.                                                                                                       |
        | status | 400                                                                                                                                                   |
        | code   | paramsRequired                                                                                                                                        |
        | detail | Precies 1 parameter van pandIdentificatie, adresseerbaarObjectIdentificatie, zoekresultaatIdentificatie, postcode of huisnummer moet worden opgegeven |
        En bevat de response geen invalidParams

Rule: fields parameter bevat geen onbekende veld namen

    Scenario: Er is één onbekende veld naam opgegeven
        Als '/adressen?pandIdentificatie=0345100002016017&fields=bestaatniet' wordt aangeroepen
        Dan bevat de response de volgende velden
        | naam   | waarde                                        |
        | title  | Een of meerdere parameters zijn niet correct. |
        | status | 400                                           |
        | code   | paramsValidation                              |
        | detail | Bad request.                                  |
        En bevat de response de volgende invalidParams
        | name   | code   | reason                                                    |
        | fields | fields | Deel van de parameterwaarde is niet correct: bestaatniet. |

    Scenario: Er zijn meerdere onbekende veld namen opgegeven
        Als '/adressen?pandIdentificatie=0345100002016017&fields=bestaatniet,bestaatookniet' wordt aangeroepen
        Dan bevat de response de volgende velden
        | naam   | waarde                                        |
        | title  | Een of meerdere parameters zijn niet correct. |
        | status | 400                                           |
        | detail | Bad request.                                  |
        En bevat de response de volgende invalidParams
        | name   | code   | reason                                                       |
        | fields | fields | Deel van de parameterwaarde is niet correct: bestaatniet.    |
        | fields | fields | Deel van de parameterwaarde is niet correct: bestaatookniet. |

Rule: expand parameter bevat geen onbekende resource namen

    Scenario: Er is één onbekende resource naam opgegeven
        Als '/adressen?zoekresultaatIdentificatie=adr-f6b00930705c1ef12c2624623a797d21&expand=bestaatniet' wordt aangeroepen
        Dan bevat de response de volgende velden
        | naam   | waarde                                        |
        | title  | Een of meerdere parameters zijn niet correct. |
        | status | 400                                           |
        | code   | paramsValidation                              |
        | detail | Bad request.                                  |
        En bevat de response de volgende invalidParams
        | name   | code   | reason                                                    |
        | expand | expand | Deel van de parameterwaarde is niet correct: bestaatniet. |

    Scenario: Er zijn meerdere onbekende resource namen opgegeven
        Als '/adressen?zoekresultaatIdentificatie=adr-f6b00930705c1ef12c2624623a797d21&expand=bestaatniet,bestaatookniet' wordt aangeroepen
        Dan bevat de response de volgende velden
        | naam   | waarde                                        |
        | title  | Een of meerdere parameters zijn niet correct. |
        | status | 400                                           |
        | code   | paramsValidation                              |
        | detail | Bad request.                                  |
        En bevat de response de volgende invalidParams
        | name   | code   | reason                                                       |
        | expand | expand | Deel van de parameterwaarde is niet correct: bestaatniet.    |
        | expand | expand | Deel van de parameterwaarde is niet correct: bestaatookniet. |

    Scenario: Er is één of meerdere onbekende veld namen voor één of meerdere resource opgegeven
        Als '/adressen?zoekresultaatIdentificatie=adr-f6b00930705c1ef12c2624623a797d21&expand=nummeraanduiding.bestaatniet' wordt aangeroepen
        Dan bevat de response de volgende velden
        | naam   | waarde                                        |
        | title  | Een of meerdere parameters zijn niet correct. |
        | status | 400                                           |
        | code   | paramsValidation                              |
        | detail | Bad request.                                  |
        En bevat de response de volgende invalidParams
        | name   | code   | reason                                                                     |
        | expand | expand | Deel van de parameterwaarde is niet correct: nummeraanduiding.bestaatniet. |

Rule: type van parameter waarde is correct

    Abstract Scenario: type van waarde van één parameter is niet correct
        Als '<path><query string>' wordt aangeroepen
        Dan bevat de response de volgende velden
        | naam   | waarde                                        |
        | title  | Een of meerdere parameters zijn niet correct. |
        | status | 400                                           |
        | code   | paramsValidation                              |
        | detail | <detail>                                      |
        En bevat de response de volgende invalidParams
        | name        | code   | reason                |
        | <parameter> | <code> | <reason omschrijving> |

        Voorbeelden:
        | path      | query string                                          | detail                                                                                           | parameter | code             | reason omschrijving                   |
        | /adressen | ?pandIdentificatie=0345100002016017&page=a&pageSize=3 | Ongeldige waarde [a] opgegeven voor parameter [page]                                             | page      | integer          | Waarde is geen geldige integer.       |
        | /panden   | ?locatie=abc,def                                      | Ongeldige waarde [abc,def] opgegeven voor parameter [locatie]                                    | locatie   | number           | Waarde is geen geldig decimaal getal. |
        | /panden   | ?locatie=194189.98399146                              | Bad request.                                                                                     | locatie   | minItems         | Array bevat minder dan 2 items.       |
        | /panden   | ?locatie=194189.98399146,abc                          | Ongeldige waarde [194189.98399146,abc] opgegeven voor parameter [locatie]                        | locatie   | number           | Waarde is geen geldig decimaal getal. |
        | /panden   | ?locatie=194189.98399146,465870.76799701              | Ongeldige waarde [194189.98399146,465870.76799701] opgegeven voor parameter [locatie]            | locatie   | geometryMismatch | Waarde is niet conform opgegeven CRS. | # op dit moment geen invalidParams
        | /panden   | ?bbox=a,b,c,d                                         | Ongeldige waarde [a,b,c,d] opgegeven voor parameter [bbox]                                       | bbox      | number           | Waarde is geen geldig decimaal getal. |
        | /panden   | ?bbox=52.10544278                                     | Bad request.                                                                                     | bbox      | minItems         | Array bevat minder dan 4 items.       |
        | /panden   | ?bbox=52.10544278,5.09890079,52.10423390,d            | Ongeldige waarde [52.10544278,5.09890079,52.10423390,d] opgegeven voor parameter [bbox]          | bbox      | number           | Waarde is geen geldig decimaal getal. |
        | /panden   | ?bbox=52.10544278,5.09890079,52.10423390,5.09996295   | Ongeldige waarde [52.10544278,5.09890079,52.10423390,5.09996295] opgegeven voor parameter [bbox] | bbox      | geometryMismatch | Waarde is niet conform opgegeven CRS. | # op dit moment internal server error
        
    Scenario: type van waarde van meerdere parameters is niet correct
        Als '/adressen?pandIdentificatie=0345100002016017&page=a&pageSize=b' wordt aangeroepen
        Dan bevat de response de volgende velden
        | naam   | waarde                                               |
        | title  | Een of meerdere parameters zijn niet correct.        |
        | status | 400                                                  |
        | code   | paramsValidation                                     |
        | detail | Ongeldige waarde [a] opgegeven voor parameter [page] |
        En bevat de response de volgende invalidParams
        | name     | code    | reason                          |
        | page     | integer | Waarde is geen geldige integer. |
        | pageSize | code    | waarde 'b' is geen getal        | # op dit moment komt deze niet terug

Rule: waarde van parameter is valide

    Scenario: waarde van één parameter is niet valide
        Als '/adresseerbareobjecten/0599040000' wordt aangeroepen
        Dan bevat de response de volgende velden
        | naam   | waarde                                        |
        | title  | Een of meerdere parameters zijn niet correct. |
        | status | 400                                           |
        | code   | paramsValidation                              |
        | detail | Bad request.                                  |
        En bevat de response de volgende invalidParams
        | name                             | code    | reason                                       |
        | adresseerbaarobjectidentificatie | pattern | Waarde voldoet niet aan patroon ^[0-9]{16}$. |

    Scenario: waarde van meerdere parameters zijn niet valide
        Als '/adressen?pandIdentificatie=0345100002016017&page=-1&pageSize=2000' wordt aangeroepen
        Dan bevat de response de volgende velden
        | naam   | waarde                                        |
        | title  | Een of meerdere parameters zijn niet correct. |
        | status | 400                                           |
        | code   | paramsValidation                              |
        | detail | Bad request.                                  |
        En bevat de response de volgende invalidParams
        | name     | code    | reason                           |
        | page     | minimum | Waarde is lager dan minimum 1.   |
        | pageSize | maximum | Waarde is hoger dan maximum 100. |

    Scenario: waarde van bbox parameter overschrijdt maximale toegestane oppervlakte 
        Als '/panden?bbox=134647,457842,137512,455907' wordt aangeroepen
        Dan bevat de response de volgende velden
        | naam   | waarde                                        |
        | title  | Een of meerdere parameters zijn niet correct. |
        | status | 400                                           |
        | code   | paramsValidation                              |
        | detail | Bad request.                                  |
        En bevat de response de volgende invalidParams
        | name | code           | reason                                             |
        | bbox | surfaceMaximum | Waarde is hoger dan maximum oppervlakte 250000 m2. |

Rule: Een raadpleeg collectie aanroep mag slechts één identificatie parameter bevatten

    Abstract Scenario: Er zijn meerdere identificatie parameters opgegeven
        Als '<path><query string>' wordt aangeroepen
        Dan bevat de response de volgende velden
        | naam   | waarde                                                     |
        | title  | De combinatie van opgegeven parameters is niet toegestaan. |
        | status | 400                                                        |
        | code   | unsupportedCombi                                           |
        | detail | Bad request.                                               |
        En bevat de response geen invalidParams

        Voorbeelden:
        | path                   | query string                                                                                      | fout detail                                                                                                |
        | /adressen              | ?pandIdentificatie=0226100000008856&adresseerbaarObjectIdentificatie=0226010000038820             | Alleen parameter 'pandIdentificatie' of 'adresseerbaarObjectIdentificatie' moet zijn opgegeven             |
        | /adresseerbareobjecten | ?nummeraanduidingIdentificatie=0226200000038923&pandIdentificatie=0226100000008856                | Alleen parameter 'nummeraanduidingIdentificatie' of 'pandIdentificatie' moet zijn opgegeven                |
        | /panden                | ?adresseerbaarObjectIdentificatie=0226010000038820&nummeraanduidingIdentificatie=0226200000038923 | Alleen parameter 'adresseerbaarObjectIdentificatie' of 'nummeraanduidingIdentificatie' moet zijn opgegeven |

Rule: alle parameter fouten in een request worden samen geretourneerd

    Scenario: er zijn meerdere verschillende fout soorten
        Als '/adresseerbareobjecten?nummeraanduidingIdentificatie=0226200000038923&fields=bestaatniet&expand=bestaatookniet' wordt aangeroepen
        Dan bevat de response de volgende velden
        | naam   | waarde                                        |
        | title  | Een of meerdere parameters zijn niet correct. |
        | status | 400                                           |
        | code   | paramsValidation                              |
        | detail | Bad request.                                  |
        En bevat de response de volgende invalidParams
        | name   | code   | reason                                                       |
        | fields | fields | Deel van de parameterwaarde is niet correct: bestaatniet.    |
        | expand | expand | Deel van de parameterwaarde is niet correct: bestaatookniet. |

Abstract Scenario: opgegeven identificatie is niet gekoppeld aan een resource
    Als '<path>/<identificatie>' wordt aangeroepen
    Dan bevat de response de volgende velden
    | naam   | waarde                                               |
    | title  | Opgevraagde resource bestaat niet.                   |
    | status | 404                                                  |
    | code   | notFound                                             |
    | detail | Geen <resource naam> gevonden met id <identificatie> |

    Voorbeelden:
    | path                   | identificatie    | resource naam       |
    | /adresseerbareobjecten | 1599010000048400 | adresseerbaarObject |
    | /panden                | 1234567890123456 | pand                |

Rule: embedden van een gerelateerde resource i.c.m. de gerelateerde resource identificatie query parameter is niet toegestaan

    Abstract Scenario: filteren van resources met een gerelateerde resource identificatie i.c.m. het embedden van dezelfde gerelateerde resource
        Als '<path><query string>' wordt aangeroepen
        Dan bevat de response de volgende velden
        | naam   | waarde                                        |
        | title  | Een of meerdere parameters zijn niet correct. |
        | status | 400                                           |
        | code   | paramsValidation                              |
        | detail | Bad request.                                  |
        En bevat de response de volgende invalidParams
        | name   | code   | reason   |
        | expand | <code> | <reason> |

        Voorbeelden:
        | path                   | query string                                                                  | code   | reason                                                                                                                                                      |
        | /adresseerbareobjecten | ?pandIdentificatie=0226100000008856&expand=panden                             | expand | Deel van de parameterwaarde is niet correct: filteren met pandIdentificatie en tegelijk expanden van panden is niet toegestaan.                             |
        | /adressen              | ?adresseerbaarObjectIdentificatie=0226010000038820&expand=adresseerbaarObject | expand | Deel van de parameterwaarde is niet correct: filteren met adresseerbaarObjectIdentificatie en tegelijk expanden van adresseerbaarObject is niet toegestaan. |

Rule: min waarde is niet groter dan max waarde

    Abstract Scenario: opgegeven minimale oppervlakte is groter dan opgegeven maximale oppervlakte
        Als '<path><query string>' wordt aangeroepen
        Dan bevat de response de volgende velden
        | naam   | waarde                                        |
        | title  | Een of meerdere parameters zijn niet correct. |
        | status | 400                                           |
        | code   | paramsValidation                              |
        | detail | Bad request.                                  |
        En bevat de response de volgende invalidParams
        | name             | code   | reason                           |
        | oppervlakte[min] | range  | min mag niet hoger zijn dan max. |

        Voorbeelden:
        | path                   | query string                               | code  | reason                           |
        | /adresseerbareobjecten | ?oppervlakte[min]=200&oppervlakte[max]=100 | range | min mag niet hoger zijn dan max. |
