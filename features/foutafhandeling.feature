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
