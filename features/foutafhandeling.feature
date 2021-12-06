# language: nl
Functionaliteit: Afhandeling van fouten

    Als Consumer van de BAG API
    Wil ik consistente en gebruiksvriendelijke fout responses conform problem+json
    Zodat ik in mijn consumer applicatie de fouten eenduidig kan afhandelen.

    Deze BAG foutafhandeling feature beschrijving is een extensie van de Haal Centraal Common foutafhandeling feature beschrijving.

Rule: waarde van parameter moet valide zijn

    Abstract Scenario: waarde van één parameter is niet correct
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
        | path      | query string                                        | parameter | code             | reason omschrijving                   |
        | /panden   | ?locatie=abc,def                                    | locatie   | number           | Waarde is geen geldig decimaal getal. |
        | /panden   | ?locatie=194189.983                                 | locatie   | minItems         | Array bevat minder dan 2 items.       |
        | /panden   | ?locatie=194189.983,abc                             | locatie   | number           | Waarde is geen geldig decimaal getal. |
        | /panden   | ?locatie=5.96072575,52.18450437                     | locatie   | geometryMismatch | Waarde is niet conform opgegeven CRS. |
        | /panden   | ?bbox=a,b,c,d                                       | bbox      | number           | Waarde is geen geldig decimaal getal. |
        | /panden   | ?bbox=134647.123,457842.456                         | bbox      | minItems         | Array bevat minder dan 4 items.       |
        | /panden   | ?bbox=134647.123,457842.456,134747.123,d            | bbox      | number           | Waarde is geen geldig decimaal getal. |
        | /panden   | ?bbox=5.95898224,52.18079713,5.96164299,52.17919192 | bbox      | geometryMismatch | Waarde is niet conform opgegeven CRS. |

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

Rule: min waarde mag niet groter zijn dan max waarde

    Abstract Scenario: opgegeven minimale waarde is groter dan opgegeven maximale waarde
        Als '<path><query string>' wordt aangeroepen
        Dan bevat de response de volgende velden
        | naam   | waarde                                        |
        | title  | Een of meerdere parameters zijn niet correct. |
        | status | 400                                           |
        | code   | paramsValidation                              |
        | detail | Bad request.                                  |
        En bevat de response de volgende invalidParams
        | name             | code   | reason                |
        | <parameter>[min] | <code> | <reason omschrijving> |

        Voorbeelden:
        | path                   | query string                               | parameter   | code  | reason omschrijving              |
        | /adresseerbareobjecten | ?oppervlakte[min]=200&oppervlakte[max]=100 | oppervlakte | range | min mag niet hoger zijn dan max. |
        | /panden                | ?bouwjaar[min]=2000&bouwjaar[max]=1000     | bouwjaar    | range | min mag niet hoger zijn dan max. |

Rule: min waarde mag niet kleiner zijn dan toegestane minimum waarde

    Abstract scenario: opgegeven minimum waarde lager dan toegestane minimum waarde
        Als '<path><query string>' wordt aangeroepen
        Dan bevat de response de volgende velden
        | naam   | waarde                                        |
        | title  | Een of meerdere parameters zijn niet correct. |
        | status | 400                                           |
        | code   | paramsValidation                              |
        | detail | <detail>                                      |
        En bevat de response de volgende invalidParams
        | name        | code    | reason               |
        | <parameter> | <code> | <reason omschrijving> |

        Voorbeelden:
        | path                   | query string                                                               | parameter        | code    | reason omschrijving            |
        | /adresseerbareobjecten | '?bbox=134647,457842,135127,458307&oppervlakte[min]=0&oppervlakte[max]=200 | oppervlakte[min] | minimum | Waarde is lager dan minimum 1. |
        | /panden                | '?bbox=134647,457842,135127,458307&bouwjaar[min]=-1&bouwjaar[max]=2000     | bouwjaar[min]    | minimum | Waarde is lager dan minimum 0. |
        | /adresseerbareobjecten | '?bbox=134647,457842,135127,458307&oppervlakte[min]=0&oppervlakte[max]=0   | oppervlakte[max] | minimum | Waarde is lager dan minimum 1. |
        | /panden                | '?bbox=134647,457842,135127,458307&bouwjaar[min]=-1&bouwjaar[max]=-1       | bouwjaar[max]    | minimum | Waarde is lager dan minimum 0. |

Rule: max waarde mag niet groter zijn dan toegestane maximum waarde

    Abstract scenario: opgegeven maximum waarde groter dan toegestane maximum waarde
        Als '<path><query string>' wordt aangeroepen
        Dan bevat de response de volgende velden
        | naam   | waarde                                        |
        | title  | Een of meerdere parameters zijn niet correct. |
        | status | 400                                           |
        | code   | paramsValidation                              |
        | detail | <detail>                                      |
        En bevat de response de volgende invalidParams
        | name        | code    | reason               |
        | <parameter> | <code> | <reason omschrijving> |

        Voorbeelden:
        | path                     | query string                                                                         | parameter        | code    | reason omschrijving                  |
        | /adresseerbareobjecten   | '?bbox=134647,457842,135127,458307&oppervlakte[min]=1000000&oppervlakte[max]=1000000 | oppervlakte[min] | maximum | Waarde is hoger dan maximum 1000000. |
        | /panden                  | '?bbox=134647,457842,135127,458307&bouwjaar[min]=10000&bouwjaar[max]=10000           | bouwjaar[min]    | maximum | Waarde is hoger dan maximum 10000.   |
        | /adresseerbareobjecten   | '?bbox=134647,457842,135127,458307&oppervlakte[min]=100&oppervlakte[max]=1000000     | oppervlakte[max] | maximum | Waarde is hoger dan maximum 1000000. |
        | /panden                  | '?bbox=134647,457842,135127,458307&bouwjaar[min]=1000&bouwjaar[max]=10000            | bouwjaar[max]    | maximum | Waarde is hoger dan maximum 10000.   |
