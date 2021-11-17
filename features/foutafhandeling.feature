# language: nl
Functionaliteit: Afhandeling van fouten

    Als Consumer van de BAG API
    Wil ik consistente en gebruiksvriendelijke fout responses conform problem+json
    Zodat ik in mijn consumer applicatie de fouten eenduidig kan afhandelen.

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
        | /panden   | ?locatie=abc,def                                      | Ongeldige waarde [abc,def] opgegeven voor parameter [locatie]                                    | locatie   | number           | Waarde is geen geldig decimaal getal. |
        | /panden   | ?locatie=194189.98399146                              | Bad request.                                                                                     | locatie   | minItems         | Array bevat minder dan 2 items.       |
        | /panden   | ?locatie=194189.98399146,abc                          | Ongeldige waarde [194189.98399146,abc] opgegeven voor parameter [locatie]                        | locatie   | number           | Waarde is geen geldig decimaal getal. |
        | /panden   | ?locatie=194189.98399146,465870.76799701              | Ongeldige waarde [194189.98399146,465870.76799701] opgegeven voor parameter [locatie]            | locatie   | geometryMismatch | Waarde is niet conform opgegeven CRS. | # op dit moment geen invalidParams
        | /panden   | ?bbox=a,b,c,d                                         | Ongeldige waarde [a,b,c,d] opgegeven voor parameter [bbox]                                       | bbox      | number           | Waarde is geen geldig decimaal getal. |
        | /panden   | ?bbox=52.10544278                                     | Bad request.                                                                                     | bbox      | minItems         | Array bevat minder dan 4 items.       |
        | /panden   | ?bbox=52.10544278,5.09890079,52.10423390,d            | Ongeldige waarde [52.10544278,5.09890079,52.10423390,d] opgegeven voor parameter [bbox]          | bbox      | number           | Waarde is geen geldig decimaal getal. |
        | /panden   | ?bbox=52.10544278,5.09890079,52.10423390,5.09996295   | Ongeldige waarde [52.10544278,5.09890079,52.10423390,5.09996295] opgegeven voor parameter [bbox] | bbox      | geometryMismatch | Waarde is niet conform opgegeven CRS. | # op dit moment internal server error

Rule: waarde van parameter is valide

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

Rule: waarde van property in request body is valide

    Abstract Scenario: waarde van een property in de request body is niet correct
        Als '<path><request body>' wordt aangeroepen
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
        | path      | request body                                                                                                                             | detail                                                                                                                                                                     | parameter            | code             | reason omschrijving                      |
        | /adressen | AdresBody.geometrie.intersects=POLYGON ((a b,c d))                                                                                       | Ongeldige waarde POLYGON ((a b,c d)) opgegeven voor parameter [geometrie.intersects]                                                                                       | geometrie.intersects | geometryFormat   | Waarde is niet conform {format} formaat. |
        | /adressen | AdresBody.geometrie.intersects=POLYGON ((134647.123))                                                                                    | Bad request.                                                                                                                                                               | geometrie.intersects | geometryFormat   | Waarde is niet conform {format} formaat. |
        | /adressen | AdresBody.geometrie.intersects=POLYGON ((134647.123 457842.456, 134747.789 d))                                                           | Ongeldige waarde POLYGON ((134647.123 457842.456, 134747.789 d)) opgegeven voor parameter [geometrie.intersects]                                                           | geometrie.intersects | geometryFormat   | Waarde is niet conform {format} formaat. |
        | /adressen | AdresBody.geometrie.intersects=POLYGON (([meer dan 350 coördinaten]))                                                                    | Bad request.                                                                                                                                                               | geometrie.intersects | maxItems         | Array bevat meer dan {maxItems} items.   |
        | /adressen | AdresBody.geometrie.intersects=POLYGON ((5.96072575 52.18450437,5.95270058 52.17811002, 5.96793552 52.17816266, 5.96072575 52.18450437)) | Ongeldige waarde POLYGON ((5.96072575 52.18450437,5.95270058 52.17811002, 5.96793552 52.17816266, 5.96072575 52.18450437)) opgegeven voor parameter [geometrie.intersects] | geometrie.intersects | geometryMismatch | Waarde is niet conform opgegeven CRS.    |

    Abstract Scenario: waarde van AdresBody.geometrie.intersects parameter overschrijdt maximale toegestane oppervlakte 
        Als /adressen met request body AdresBody.geometrie.intersects=POLYGON ((134647 457842, 137512 457842, 137512 455907, 134647 455907, 134647 457842)) wordt aangeroepen
        Dan bevat de response de volgende velden
        | naam   | waarde                                        |
        | title  | Een of meerdere parameters zijn niet correct. |
        | status | 400                                           |
        | code   | paramsValidation                              |
        | detail | Bad request.                                  |
        En bevat de response de volgende invalidParams
        | name                 | code           | reason                                             |
        | geometrie.intersects | surfaceMaximum | Waarde is hoger dan maximum oppervlakte 250000 m2. |

Rule: verplichte request body is opgegeven

    Scenario: verplichte request body is niet opgegeven
        Als /adressen zonder request body AdresBody wordt aangeroepen
        Dan bevat de response de volgende velden
        | naam   | waarde                               |
        | title  | Geef tenminste één parameter op.     |
        | status | 400                                  |
        | code   | paramsRequired                       |
        | detail | Request body moet worden meegegeven. |
        En bevat de response geen invalidParams

Rule: verplichte request body property is opgegeven

    Scenario: verplichte request body property is niet opgegeven
        Als /adressen met request body AdresBody wordt aangeroepen
        En de AdresBody bevat geen property geometrie
        Dan bevat de response de volgende velden
        | naam   | waarde                                        |
        | title  | Geef tenminste één parameter op.              |
        | status | 400                                           |
        | code   | paramsRequired                                |
        | detail | geometrie property ontbreekt in request body. |
        En bevat de response geen invalidParams

    Scenario: verplichte request body property is niet opgegeven
        Als /adressen met request body AdresBody wordt aangeroepen
        En de AdresBody bevat een property geometrie
        En de geometrie property bevat geen property intersects
        Dan bevat de response de volgende velden
        | naam   | waarde                                                   |
        | title  | Geef tenminste één parameter op.                         |
        | status | 400                                                      |
        | code   | paramsRequired                                           |
        | detail | geometrie.intersects property ontbreekt in request body. |
        En bevat de response geen invalidParams
