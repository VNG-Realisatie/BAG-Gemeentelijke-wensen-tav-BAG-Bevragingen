# language: nl

Functionaliteit: Foutafhandeling
    # Als Consumer van de BAG API wil ik consistente en gebruiksvriendelijke foutresponses conform problem+json
    # Zodat ik in mijn consumer applicatie de fouten eenduidig kan afhandelen.

Rule: een verplichte parameter moet zijn opgegeven met een waarde

    Scenario: Verplichte parameter is niet opgegeven
        Als '/adressen/zoek' wordt aangeroepen
        Dan bevat de response ten minste de volgende velden
        | naam   | waarde                                                                            |
        | title  | Ten minste één parameter moet worden opgegeven.                                   |
        | status | 400                                                                               |
        | code   | paramsRequired                                                                    |
        En bevat de response geen veld "invalidParams"
        En is de http status code van het antwoord 400
        En bevat de response de header "Content-Type" met waarde "application/problem+json"

Rule: alleen gespecificeerde queryparameters mogen worden gebruikt

    Scenario: Niet gespecificeerde parameter
        Als '/adressen?bestaatniet=abcd' wordt aangeroepen
        Dan bevat de response ten minste de volgende velden
        | naam   | waarde                                        |
        | title  | Een of meerdere parameters zijn niet correct. |
        | status | 400                                           |
        | code   | paramsValidation                              |
        En bevat de response de volgende invalidParams
        | name        | code         | reason                      |
        | bestaatniet | unknownParam | Parameter is niet verwacht. |

Rule: de parameterwaarde moet aan de parameterspecificaties voldoen

    Abstract Scenario: waarde van een queryparameter is niet correct conform parameterspecificaties
        Als '<path><query string>' wordt aangeroepen
        Dan bevat de response ten minste de volgende velden
        | naam   | waarde                                        |
        | title  | Een of meerdere parameters zijn niet correct. |
        | status | 400                                           |
        | code   | paramsValidation                              |
        En bevat de response de volgende invalidParams
        | name        | code   | reason                |
        | <parameter> | <code> | <reason omschrijving> |

        Voorbeelden:
        | path                   | query string                                                              | parameter         | code             | reason omschrijving                                 |
        | /adressen              | ?pandIdentificatie=0345100002016017&page=a                                | page              | integer          | Waarde is geen geldige integer.                     |
        | /panden                | ?locatie=abc,def                                                          | locatie           | number           | Waarde is geen geldig decimaal getal.               |
        | /adresseerbareobjecten | ?bbox=135207,457400,135418,457162&geconstateerd=Nee                       | geconstateerd     | boolean          | Waarde is geen geldige boolean.                     |
        | /adresseerbareobjecten | ?bbox=135207,457400,135418,457162&oppervlakte[min]=-1&oppervlakte[max]=1  | oppervlakte[min]  | minimum          | Waarde is lager dan minimum 1.                      |
        | /panden                | ?bbox=135207,457400,135418,457162&bouwjaar[min]=2000&bouwjaar[max]=20200  | bouwjaar[max]     | maximum          | Waarde is hoger dan maximum 9999.                   |
        | /panden                | ?locatie=98095.02                                                         | locatie           | minItems         | Array bevat minder dan 2 items.                     |
        | /panden                | ?locatie=98095.02,438495.09,0                                             | locatie           | maxItems         | Array bevat meer dan 2 items.                       |
        | /adressen              | ?pandIdentificatie=0345100002016017X                                      | pandIdentificatie | pattern          | Waarde voldoet niet aan patroon ^[0-9]{16}$.        |
        | /adresseerbareobjecten | ?bbox=135207,457400,135418,457162&type=fout                               | type              | enum             | Waarde heeft geen geldige waarde uit de enumeratie. |

    Scenario: waarde van de padparameter is niet correct conform parameterspecificaties
        Als '/adresseerbareobjecten/0599040000' wordt aangeroepen
        Dan bevat de response ten minste de volgende velden
        | naam   | waarde                                        |
        | title  | Een of meerdere parameters zijn niet correct. |
        | status | 400                                           |
        | code   | paramsValidation                              |
        En bevat de response de volgende invalidParams
        | name                             | code    | reason                                       |
        | adresseerbaarobjectidentificatie | pattern | Waarde voldoet niet aan patroon ^[0-9]{16}$. |

Rule: parameterwaarden worden eerst gecontroleerd op niet-toegestane tekens

    Scenario: meerdere fouten met niet-toegestane tekens en ook andere soorten fouten
        Als '/adresseerbareobjecten' wordt aangeroepen met de volgende queryparameters
        | naam                          | waarde                        |
        | nummeraanduidingIdentificatie | "fout"                        |
        | pandIdentificatie             | <fout>                        |
        | expand                        | fout                          |
        | fields                        | fout                          |
        | page                          | fout                          |
        | pageSize                      | 999                           |
        | pandIdentificaties            | fout                          |
        | geconstateerd                 | "fout"                        |
        | bbox                          | 135207,457400,135418,457162,5 |
        | oppervlakte[min]              | -1                            |
        Dan bevat de response de volgende invalidParams
        | name                          | code                | reason                                     |
        | nummeraanduidingIdentificatie | notAllowedCharacter | Parameter bevat niet toegestane karakters. |
        | pandIdentificatie             | notAllowedCharacter | Parameter bevat niet toegestane karakters. |
        | geconstateerd                 | notAllowedCharacter | Parameter bevat niet toegestane karakters. |

Rule: wanneer een parameterwaarde niet overeenkomt met het gespecificeerde type (integer, number, boolean of enumeratie), wordt alleen deze fout gemeld

    Scenario: meerdere fouten met onjuist type en ook andere soorten fouten
        Als '/adresseerbareobjecten' wordt aangeroepen met de volgende queryparameters
        | naam                          | waarde                        |
        | expand                        | fout                          |
        | fields                        | fout                          |
        | page                          | fout                          |
        | pageSize                      | fout                          |
        | geconstateerd                 | fout                          |
        | bbox                          | 135207,457400,135418,fout     |
        | oppervlakte[min]              | -1                            |
        Dan bevat de response de volgende invalidParams
        | name                          | code                | reason                          |
        | page                          | integer             | Waarde is geen geldige integer. |

Rule: wanneer er meerdere parameterwaarden niet voldoen aan de gespecificeerde eisen (minimum ,maximum, pattern, maxItems, fields, expand) worden al deze fouten tegelijk gemeld

    Scenario: tegelijk meerdere parameters met fout
        Als '/adresseerbareobjecten' wordt aangeroepen met de volgende queryparameters
        | naam                          | waarde                        |
        | expand                        | fout                          |
        | fields                        | fout                          |
        | page                          | 99                            |
        | pageSize                      | 999                           |
        | bbox                          | 135207,457400,135418,457162,5 |
        | oppervlakte[min]              | -1                            |
        | oppervlakte[max]              | 9999999                       |
        Dan bevat de response de volgende invalidParams
        | name                          | code          | reason                                             |
        | bbox                          | maxItems      | Array bevat meer dan 4 items.                      |
        | expand                        | expand        | Deel van de parameterwaarde is niet correct: fout. |
        | fields                        | fields        | Deel van de parameterwaarde is niet correct: fout. |
        | oppervlakte[max]              | maximum       | Waarde is hoger dan maximum 999999.                |
        | oppervlakte[min]              | minimum       | Waarde is lager dan minimum 1.                     |
        | pageSize                      | maximum       | Waarde is hoger dan maximum 100.                   |

Rule: minimaal één zoekparameter(combinatie) moet zijn opgegeven bij een collectieaanroep

    Abstract Scenario: Er zijn geen parameters opgegeven
        Als '<path>' wordt aangeroepen
        Dan bevat de response ten minste de volgende velden
        | naam   | waarde                                          |
        | title  | Ten minste één parameter moet worden opgegeven. |
        | status | 400                                             |
        | code   | paramsRequired                                  |
        En bevat de response geen veld "invalidParams"

        Voorbeelden:
        | path                   |
        | /adressen              |
        | /adresseerbareobjecten |
        | /panden                |

    Abstract Scenario: postcode en huisnummer niet in combinatie gebruikt
        Als '/adressen<query string>' wordt aangeroepen
        Dan bevat de response ten minste de volgende velden
        | naam   | waarde                                                    |
        | title  | Minimale combinatie van parameters moet worden opgegeven. |
        | status | 400                                                       |
        | code   | paramsCombination                                         |
        En bevat de response geen veld "invalidParams"

        Voorbeelden:
        | query string                                         |
        | ?postcode=2391PH                                     |
        | ?huisnummer=3                                        |
        | ?postcode=2391PH&huisletter=a&huisnummertoevoeging=2 |
        | ?huisnummer=3&huisletter=a&huisnummertoevoeging=2    |

    Scenario: parameters huisletter en huisnummertoevoeging zonder postcode en huisnummer
        Als '/adressen?huisletter=a&huisnummertoevoeging=II' wordt aangeroepen
        Dan bevat de response ten minste de volgende velden
        | naam   | waarde                                          |
        | title  | Ten minste één parameter moet worden opgegeven. |
        | status | 400                                             |
        | code   | paramsRequired                                  |
        En bevat de response geen veld "invalidParams"

    Scenario: parameters geconstateerd, type, gebruiksdoelen en oppervlakte zonder bbox
        Als '/adresseerbareobjecten?gebruiksdoelen=woonfunctie&geconstateerd=false&oppervlakte[min]=50&oppervlakte[max]=80' wordt aangeroepen
        Dan bevat de response ten minste de volgende velden
        | naam   | waarde                                                                                                                                                |
        | title  | Ten minste één parameter moet worden opgegeven.                                                                                                       |
        | status | 400                                                                                                                                                   |
        | code   | paramsRequired                                                                                                                                        |
        En bevat de response geen veld "invalidParams"
    
    Scenario: parameters page, pageSize, fields en expand zonder minimale zoekparameter(combinatie)
        Als '/adressen?page=1&pageSize=20&fields=straat,huisnummer,woonplaats&expand=adresseerbaarObject' wordt aangeroepen
        Dan bevat de response ten minste de volgende velden
        | naam   | waarde                                                                                                                                                |
        | title  | Ten minste één parameter moet worden opgegeven.                                                                                                       |
        | status | 400                                                                                                                                                   |
        | code   | paramsRequired                                                                                                                                        |
        En bevat de response geen veld "invalidParams"

    Scenario: zoekparameter zonder waarde
        Als '/adressen?pandIdentificatie=' wordt aangeroepen
        Dan bevat de response ten minste de volgende velden
        | naam   | waarde                                                                                                                                                |
        | title  | Ten minste één parameter moet worden opgegeven.                                                                                                       |
        | status | 400                                                                                                                                                   |
        | code   | paramsRequired                                                                                                                                        |
        En bevat de response geen veld "invalidParams"

Rule: combineren van verschillende zoekcombinaties is niet toegestaan

    Abstract Scenario: Er zijn parameters uit verschillende parametercombinaties opgegeven
        Als '<path><query string>' wordt aangeroepen
        Dan bevat de response ten minste de volgende velden
        | naam   | waarde                                                     |
        | title  | De combinatie van opgegeven parameters is niet toegestaan. |
        | status | 400                                                        |
        | code   | unsupportedCombi                                           |
        En bevat de response geen veld "invalidParams"

        Voorbeelden:
        | path                   | query string                                                                                                                                            |
        | /adressen              | ?zoekresultaatIdentificatie=adr-35eabe366d08b6087fe9cb0d2fe3922b&pandIdentificatie=0826100000000467                                                     |
        | /adressen              | ?zoekresultaatIdentificatie=adr-35eabe366d08b6087fe9cb0d2fe3922b&adresseerbaarObjectIdentificatie=0226010000038820                                      |
        | /adressen              | ?zoekresultaatIdentificatie=adr-35eabe366d08b6087fe9cb0d2fe3922b&postcode=2391PH&huisnummer=1                                                           |
        | /adressen              | ?pandIdentificatie=0226100000008856&adresseerbaarObjectIdentificatie=0226010000038820                                                                   |
        | /adressen              | ?pandIdentificatie=0226100000008856&postcode=4904AM                                                                                                     |
        | /adressen              | ?pandIdentificatie=0226100000008856&huisnummer=633                                                                                                      |
        | /adresseerbareobjecten | ?nummeraanduidingIdentificatie=0226200000038923&pandIdentificatie=0226100000008856                                                                      |
        | /adresseerbareobjecten | ?nummeraanduidingIdentificatie=0226200000038923&pandIdentificaties=0599100000103376,0289100000002082                                                    |
        | /adresseerbareobjecten | ?nummeraanduidingIdentificatie=0226200000038923&bbox=135228,457502,135246,457457                                                                        |
        | /adresseerbareobjecten | ?pandIdentificatie=0226100000008856&pandIdentificaties=0599100000103376,0289100000002082                                                                |
        | /adresseerbareobjecten | ?pandIdentificatie=0226100000008856&bbox=135228,457502,135246,457457                                                                                    |
        | /adresseerbareobjecten | ?pandIdentificaties=0599100000103376,0289100000002082&bbox=135228,457502,135246,457457                                                                  |
        | /panden                | ?adresseerbaarObjectIdentificatie=0484010002033603&nummeraanduidingIdentificatie=0484200002040489                                                       |
        | /panden                | ?adresseerbaarObjectIdentificatie=0484010002033603&locatie=98095.02,438495.09                                                                           |
        | /panden                | ?adresseerbaarObjectIdentificatie=0484010002033603&bbox=135228,457502,135246,457457                                                                     |
        | /panden                | ?nummeraanduidingIdentificatie=0484200002040489&locatie=98095.02,438495.09                                                                              |
        | /panden                | ?nummeraanduidingIdentificatie=0484200002040489&bbox=135228,457502,135246,457457                                                                        |
        | /panden                | ?locatie=98095.02,438495.09&bbox=135228,457502,135246,457457                                                                                            |
        | /panden                | ?locatie=98095.02,438495.09&statusPand=Pand%20in%20gebruik&geconstateerd=true&bouwjaar[min]=1950&bouwjaar[max]=1979                                     |

    Abstract Scenario: page, pageSize, fields en expand mogen wel gecombineerd worden met elke zoekcombinatie
        Als '<path><query string>' wordt aangeroepen
        Dan is de http status code van het antwoord 200
        En bevat de response de header "Content-Type" met waarde "application/hal+json"

        Voorbeelden:
        | path                   | query string                                                                                                                                  |
        | /adressen              | ?zoekresultaatIdentificatie=adr-35eabe366d08b6087fe9cb0d2fe3922b&page=1&pageSize=20&fields=straat,huisnummer,woonplaats&expand=openbareRuimte |
        | /adressen              | ?pandIdentificatie=0226100000008856&page=1&pageSize=20&fields=straat,huisnummer,woonplaats&expand=openbareRuimte                              |
        | /adressen              | ?adresseerbaarObjectIdentificatie=0226010000038820&page=1&pageSize=20&fields=straat,huisnummer,woonplaats&expand=openbareRuimte               |
        | /adresseerbareobjecten | ?nummeraanduidingIdentificatie=0226200000038923&page=1&pageSize=20&fields=type,gebruiksdoelen&expand=adressen                                 |
        | /adresseerbareobjecten | ?pandIdentificatie=0226100000008856&page=1&pageSize=20&fields=type,gebruiksdoelen&expand=adressen                                             |
        | /adresseerbareobjecten | ?bbox=135228,457502,135246,457457&page=1&pageSize=20&fields=type,gebruiksdoelen&expand=adressen                                               |
        | /panden                | ?adresseerbaarObjectIdentificatie=0484010002033603&page=1&pageSize=20&fields=geometrie                                                        |
        | /panden                | ?nummeraanduidingIdentificatie=0484200002040489&page=1&pageSize=20&fields=geometrie                                                           |
        | /panden                | ?locatie=98095.02,438495.09&page=1&pageSize=20&fields=geometrie                                                                               |
        | /panden                | ?bbox=135228,457502,135246,457457&page=1&pageSize=20&fields=geometrie                                                                         |

Rule: parameters geconstateerd, type, gebruiksdoelen, oppervlakte, statusPand, geconstateerd en bouwjaar mogen alleen in combinatie met bbox worden gebruikt

    Abstract Scenario: geconstateerd, type, gebruiksdoelen, oppervlakte zonder bbox
        Als '/adresseerbareobjecten<query string>' wordt aangeroepen
        Dan bevat de response ten minste de volgende velden
        | naam   | waarde                                                     |
        | title  | De combinatie van opgegeven parameters is niet toegestaan. |
        | status | 400                                                        |
        | code   | unsupportedCombi                                           |
        En bevat de response geen veld "invalidParams"

        Voorbeelden:
        | query string                                                                                   |
        | ?nummeraanduidingIdentificatie=0599200000193766&geconstateerd=true                             |
        | ?pandIdentificatie=0599100000103376&type=verblijfsobject                                       |
        | ?pandIdentificaties=0599100000103376,0289100000002082&gebruiksdoelen=woonfunctie               |
        | ?pandIdentificaties=0599100000103376,0289100000002082&oppervlakte[min]=10&oppervlakte[max]=200 |

    Abstract Scenario: status, geconstateerd en bouwjaar zonder bbox
        Als '/panden<query string>' wordt aangeroepen
        Dan bevat de response ten minste de volgende velden
        | naam   | waarde                                          |
        | title  | De combinatie van opgegeven parameters is niet toegestaan. |
        | status | 400                                             |
        | code   | unsupportedCombi                                  |
        En bevat de response geen veld "invalidParams"

        Voorbeelden:
        | query string                                                                      |
        | ?adresseerbaarObjectIdentificatie=0226010000038820&statusPand=Pand%20in%20gebruik |
        | ?nummeraanduidingIdentificatie=0599200000193766&geconstateerd=true                |
        | ?locatie=98095.02,438495.09&bouwjaar[min]=1950&bouwjaar[max]=1979                 |

Rule: de oppervlakte van de bounding box mag maximaal 250 duizend vierkante meter zijn.

    Scenario: waarde van bbox parameter overschrijdt maximale toegestane oppervlakte 
        Als '/panden?bbox=134647,457842,137512,455907' wordt aangeroepen
        Dan bevat de response ten minste de volgende velden
        | naam   | waarde                                        |
        | title  | Een of meerdere parameters zijn niet correct. |
        | status | 400                                           |
        | code   | paramsValidation                              |
        En bevat de response de volgende invalidParams
        | name | code           | reason                                             |
        | bbox | surfaceMaximum | Waarde is hoger dan maximum oppervlakte 250000 m2. |

Rule: gebruik van de parameter oppervlakte is niet toegestaan in combinatie met type=standplaats of type=ligplaats

    Abstract Scenario: zoeken met oppervlakte van standplaats of ligplaats
        Als '/adresseerbareobjecten?bbox=135207,457400,135418,457162&oppervlakte[max]=100&type=<type>' wordt aangeroepen
        Dan bevat de response ten minste de volgende velden
        | naam   | waarde                                                                              |
        | title  | De combinatie van opgegeven parameters is niet toegestaan.                          |
        | status | 400                                                                                 |
        | code   | unsupportedCombi                                                                    |
        En bevat de response geen veld "invalidParams"

        Voorbeelden:
        | type        |
        | standplaats |
        | ligplaats   |      

Rule: min waarde mag niet groter zijn dan max waarde

    Abstract Scenario: opgegeven minimale waarde is groter dan opgegeven maximale waarde
        Als '<path><query string>' wordt aangeroepen
        Dan bevat de response ten minste de volgende velden
        | naam   | waarde                                        |
        | title  | Een of meerdere parameters zijn niet correct. |
        | status | 400                                           |
        | code   | paramsValidation                              |
        En bevat de response de volgende invalidParams
        | name        | code   | reason                |
        | <parameter> | <code> | <reason omschrijving> |

        Voorbeelden:
        | path                   | query string                                                                | parameter   | code  | reason omschrijving              |
        | /adresseerbareobjecten | ?bbox=135207,457400,135418,457162&oppervlakte[min]=200&oppervlakte[max]=100 | oppervlakte | range | min mag niet hoger zijn dan max. |
        | /panden                | ?bbox=135207,457400,135418,457162&bouwjaar[min]=2000&bouwjaar[max]=1000     | bouwjaar    | range | min mag niet hoger zijn dan max. |

Rule: page mag niet hoger zijn dan de laatste pagina

    Scenario: Vragen om een pagina die niet bestaat
        Gegeven pand met identificatie "0826100000000467" heeft 72 adresseerbare objecten
        Als '/adresseerbareobjecten?pandIdentificatie=0826100000000467&pageSize=20&page=5' wordt aangeroepen
        Dan bevat de response ten minste de volgende velden
        | naam   | waarde                                        |
        | title  | Een of meerdere parameters zijn niet correct. |
        | status | 400                                           |
        | code   | paramsValidation                              |
        En bevat de response de volgende invalidParams
        | name | code | reason                            |
        | page | page | De opgegeven pagina bestaat niet. |

Rule: de fields parameter mag geen veldnamen bevatten die niet in de response kunnen voorkomen

    Scenario: Er is één onbekende veld naam opgegeven
        Als '/adressen?pandIdentificatie=0345100002016017&fields=bestaatniet' wordt aangeroepen
        Dan bevat de response ten minste de volgende velden
        | naam   | waarde                                        |
        | title  | Een of meerdere parameters zijn niet correct. |
        | status | 400                                           |
        | code   | paramsValidation                              |
        En bevat de response de volgende invalidParams
        | name   | code   | reason                                                    |
        | fields | fields | Deel van de parameterwaarde is niet correct: bestaatniet. |

    Scenario: Er zijn meerdere onbekende veld namen opgegeven
        Als '/adressen?pandIdentificatie=0345100002016017&fields=bestaatniet,bestaatookniet' wordt aangeroepen
        Dan bevat de response ten minste de volgende velden
        | naam   | waarde                                        |
        | title  | Een of meerdere parameters zijn niet correct. |
        | status | 400                                           |
        En bevat de response de volgende invalidParams
        | name   | code   | reason                                                       |
        | fields | fields | Deel van de parameterwaarde is niet correct: bestaatniet.    |
        | fields | fields | Deel van de parameterwaarde is niet correct: bestaatookniet. |

Rule: de expand parameter mag geen resourcenamen of veldnamen bevatten die niet in de response voor kunnen komen

    Scenario: Er is één onbekende resource naam opgegeven
        Als '/adressen?zoekresultaatIdentificatie=adr-f6b00930705c1ef12c2624623a797d21&expand=bestaatniet' wordt aangeroepen
        Dan bevat de response ten minste de volgende velden
        | naam   | waarde                                        |
        | title  | Een of meerdere parameters zijn niet correct. |
        | status | 400                                           |
        | code   | paramsValidation                              |
        En bevat de response de volgende invalidParams
        | name   | code   | reason                                                    |
        | expand | expand | Deel van de parameterwaarde is niet correct: bestaatniet. |

    Scenario: Er zijn meerdere onbekende resource namen opgegeven
        Als '/adressen?zoekresultaatIdentificatie=adr-f6b00930705c1ef12c2624623a797d21&expand=bestaatniet,bestaatookniet' wordt aangeroepen
        Dan bevat de response ten minste de volgende velden
        | naam   | waarde                                        |
        | title  | Een of meerdere parameters zijn niet correct. |
        | status | 400                                           |
        | code   | paramsValidation                              |
        En bevat de response de volgende invalidParams
        | name   | code   | reason                                                       |
        | expand | expand | Deel van de parameterwaarde is niet correct: bestaatniet.    |
        | expand | expand | Deel van de parameterwaarde is niet correct: bestaatookniet. |

    Scenario: Er is één of meerdere onbekende veld namen voor één of meerdere resource opgegeven
        Als '/adressen?zoekresultaatIdentificatie=adr-f6b00930705c1ef12c2624623a797d21&expand=nummeraanduiding.bestaatniet' wordt aangeroepen
        Dan bevat de response ten minste de volgende velden
        | naam   | waarde                                        |
        | title  | Een of meerdere parameters zijn niet correct. |
        | status | 400                                           |
        | code   | paramsValidation                              |
        En bevat de response de volgende invalidParams
        | name   | code   | reason                                                                     |
        | expand | expand | Deel van de parameterwaarde is niet correct: nummeraanduiding.bestaatniet. |

Rule: embedden van een gerelateerde resource i.c.m. de gerelateerde resource identificatie query parameter is niet toegestaan

    Abstract Scenario: filteren van resources met een gerelateerde resource identificatie i.c.m. het embedden van dezelfde gerelateerde resource
        Als '<path><query string>' wordt aangeroepen
        Dan bevat de response ten minste de volgende velden
        | naam   | waarde                                        |
        | title  | Een of meerdere parameters zijn niet correct. |
        | status | 400                                           |
        | code   | paramsValidation                              |
        En bevat de response de volgende invalidParams
        | name   | code   | reason   |
        | expand | <code> | <reason> |

        Voorbeelden:
        | path                   | query string                                                                  | code   | reason                                                                                                                                                      |
        | /adresseerbareobjecten | ?pandIdentificatie=0226100000008856&expand=panden                             | expand | Deel van de parameterwaarde is niet correct: filteren met pandIdentificatie en tegelijk expanden van panden is niet toegestaan.                             |
        | /adressen              | ?adresseerbaarObjectIdentificatie=0226010000038820&expand=adresseerbaarObject | expand | Deel van de parameterwaarde is niet correct: filteren met adresseerbaarObjectIdentificatie en tegelijk expanden van adresseerbaarObject is niet toegestaan. |    

Rule: wanneer een parameter geometrie bevat in een crs anders dan RD (epsg:28992) wordt een 400 fout gegeven

    Abstract Scenario: accept-crs WGS84 geeft een foutmelding
        Als '<path><query string>' request wordt gedaan met header 'Content-Crs: epsg:4326'
        Dan bevat de response ten minste de volgende velden
        | naam   | waarde                                                              |
        | title  | Coördinatenstelsel epsg:4326 in Content-Crs wordt niet ondersteund. |
        | status | 400                                                                 |
        | code   | crsNotSupported                                                     |
        En bevat de response geen veld "invalidParams"
        En is de http status code van het antwoord 400
        En bevat de response de header "Content-Type" met waarde "application/problem+json"

        Voorbeelden:
        | path                   | query string                            |
        | /panden                | ?locatie=98095,438495                   |
        | /panden                | ?locatie=51.93201,4.55980               |
        | /panden                | ?bbox=135228,457502,135246,457457       |
        | /adresseerbareobjecten | ?bbox=135228,457502,135246,457457       |
        | /adresseerbareobjecten | ?bbox=52.10540,5.09861,52.10500,5.09887 |

    Abstract Scenario: zoekgeometrie die niet klopt met de opgegeven of default crs geeft een foutmelding
        Als '<path><query string>' wordt aangeroepen
        Dan bevat de response ten minste de volgende velden
        | naam   | waarde                                        |
        | title  | Een of meerdere parameters zijn niet correct. |
        | status | 400                                           |
        | code   | paramsValidation                              |
        En bevat de response de volgende invalidParams
        | name        | code             | reason                                |
        | <parameter> | geometryMismatch | Waarde is niet conform opgegeven CRS. |
        En is de http status code van het antwoord 400
        En bevat de response de header "Content-Type" met waarde "application/problem+json"

        Voorbeelden:
        | path                   | query string                            | parameter |
        | /panden                | ?locatie=51.93201,4.55980               | locatie   |
        | /panden                | ?bbox=52.10540,5.09861,52.10500,5.09887 | bbox      |
        | /adresseerbareobjecten | ?bbox=52.10540,5.09861,52.10500,5.09887 | bbox      |

Rule: wanneer er geen API key wordt gestuurd wordt een 400 fout gegeven

    Scenario: geen api key in request
        Als '/adressen/0599200000193766' request wordt gedaan zonder header 'x-api-key'
        Dan is de http status code van het antwoord 400
        En bevat de responsebody de tekst "Missing API Key"

Rule: wanneer een onjuiste API key wordt gestuurd wordt een 401 Unauthorized fout gegeven met html response

    Scenario: onjuiste API key
        Als '/adressen/0599200000193766' request wordt gedaan met header 'x-api-key: onjuist'
        Dan is de http status code van het antwoord 401
        En bevat de responsebody de tekst "Invalid API Key"

Rule: wanneer de gevraagde resource niet bestaat wordt een 404 Not found fout gegeven

    Abstract Scenario: opgegeven identificatie is niet gekoppeld aan een resource
        Als '<path>/<identificatie>' wordt aangeroepen
        Dan bevat de response ten minste de volgende velden
        | naam   | waarde                                               |
        | title  | Opgevraagde resource bestaat niet.                   |
        | status | 404                                                  |
        | code   | notFound                                             |
        En bevat de response geen veld "invalidParams"
        En is de http status code van het antwoord 404
        En bevat de response de header "Content-Type" met waarde "application/problem+json"

        Voorbeelden:
        | path                   | identificatie    | resource naam       |
        | /adresseerbareobjecten | 1599010000048400 | adresseerbaarObject |
        | /panden                | 1234567890123456 | pand                |

Rule: wanneer gevraagd wordt om een contenttype anders dan json wordt een 406 Not Acceptable gegeven

    Scenario: niet ondersteund contenttype
        Als '/adressen/0599200000193766' request wordt gedaan met header 'Accept: application/xml'
        Dan bevat de response ten minste de volgende velden
        | naam   | waarde                                                                                                                    |
        | title  | Gevraagde contenttype wordt niet ondersteund.                                                                             |
        | status | 406                                                                                                                       |
        | code   | notAcceptable                                                                                                             |
        En bevat de response geen veld "invalidParams"
        En is de http status code van het antwoord 406
        En bevat de response de header "Content-Type" met waarde "application/problem+json"

    Scenario: contenttype json
        Als '/adressen/0599200000193766' request wordt gedaan met header 'Accept: application/json'
        Dan is de http status code van het antwoord 200

    Scenario: contenttype hal+json
        Als '/adressen/0599200000193766' request wordt gedaan met header 'Accept: application/hal+json'
        Dan is de http status code van het antwoord 200

Rule: wanneer gevraagd wordt om geometrie in een crs anders dan RD (epsg:28992) wordt een 406 Not Acceptable gegeven

    Scenario: accept-crs WGS84 geeft een foutmelding
        Als '/adresseerbareobjecten/0599010000165822' request wordt gedaan met header 'Accept-Crs: epsg:4326'
        Dan bevat de response ten minste de volgende velden
        | naam   | waarde                                                         |
        | title  | Gevraagde coördinatenstelsel epsg:4326 wordt niet ondersteund. |
        | status | 406                                                            |
        | code   | crsNotAcceptable                                               |
        En bevat de response geen veld "invalidParams"
        En is de http status code van het antwoord 406
        En bevat de response de header "Content-Type" met waarde "application/problem+json"

    Scenario: accept-crs RD wordt ondersteund
        Als '/adresseerbareobjecten/0599010000165822' request wordt gedaan met header 'Accept-Crs: epsg:28992'
        Dan is de http status code van het antwoord 200

Rule: wanneer er een technische fout optreed wordt een 500 Server Error gegeven

    Scenario: interne server fout
        Gegeven er is een technische fout waardoor er een interne server error optreedt
        Als '/adressen/0599200000193766' wordt aangeroepen
        Dan bevat de response ten minste de volgende velden
        | naam   | waarde               |
        | title  | Interne server fout. |
        | status | 500                  |
        | code   | serverError          |
        En bevat de response geen veld "invalidParams"
        En is de http status code van het antwoord 500
        En bevat de response de header "Content-Type" met waarde "application/problem+json"
