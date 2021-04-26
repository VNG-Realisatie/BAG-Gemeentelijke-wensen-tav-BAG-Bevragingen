# language: nl
Functionaliteit: Gebruiksvriendelijke en duidelijke fout meldingen

    Als developer van een consumer applicatie
    Wil ik gebruikers vriendelijke foutmeldingen
    Zodat ik deze één op één kan gebruiken in de UI van mijn applicatie

Rule: verplichte parameter(s) zijn opgegeven

    Scenario: Verplichte parameter is niet opgegeven
        Als '/adressen/zoek' wordt aangeroepen
        Dan bevat de response de volgende kenmerken
        | naam   | waarde                                         |
        | title  | Een of meerdere parameters zijn niet correct.  |
        | status | 400                                            |
        | detail | Verplichte parameter 'zoek' is niet opgegeven. |
        En bevat de response de volgende invalidParams
        | name | reason                        |
        | zoek | parameter 'zoek' is verplicht |

Rule: minimaal één optionele parameter is opgegeven

    Abstract Scenario: Er zijn geen parameters opgegeven
        Als '<path>' wordt aangeroepen
        Dan bevat de response de volgende kenmerken
        | naam   | waarde                                        |
        | title  | Een of meerdere parameters zijn niet correct. |
        | status | 400                                           |
        | detail | <error detail>                                |
        En bevat de response geen invalidParams

        Voorbeelden:
        | path                   | error detail                                                                                                          |
        | /adressen              | Parameter 'pandIdentificatie', 'adresseerbaarObjectIdentificatie' of 'zoekresultaatIdentificatie' moet zijn opgegeven |
        | /adresseerbareobjecten | Parameter 'pandIdentificatie' of 'nummeraanduidingIdentificatie' moet zijn opgegeven                                  |
        | /panden                | Parameter 'adresseerbaarObjectIdentificatie', 'nummeraanduidingIdentificatie' of 'locatie' moet zijn opgegeven        |

Rule: opgegeven parameter(s) heeft een waarde

    Scenario: Er is geen waarde voor één parameter opgegeven
        Als '/adressen?pandIdentificatie=' wordt aangeroepen
        Dan bevat de response de volgende kenmerken
        | naam   | waarde                                                      |
        | title  | Een of meerdere parameters zijn niet correct.               |
        | status | 400                                                         |
        | detail | Waarde voor parameter 'pandIdentificatie' is niet opgegeven |
        En bevat de response de volgende invalidParams
        | name              | reason                                          |
        | pandIdentificatie | parameter 'pandIdentificatie' bevat geen waarde |

    Scenario: Er is geen waarde voor meerdere parameters opgegeven
        Als '/panden?adresseerbaarObjectIdentificatie=&fields=' wordt aangeroepen
        Dan bevat de response de volgende kenmerken
        | naam   | waarde                                                                                |
        | title  | Een of meerdere parameters zijn niet correct.                                         |
        | status | 400                                                                                   |
        | detail | Waarde voor parameters 'adresseerbaarObjectIdentificatie', 'fields' is niet opgegeven |
        En bevat de response de volgende invalidParams
        | name                             | reason                |
        | adresseerbaarObjectIdentificatie | geen waarde opgegeven |
        | fields                           | geen waarde opgegeven |

Rule: fields parameter bevat geen onbekende kenmerk namen

    Abstract Scenario: Er is één of meerdere onbekende kenmerk namen opgegeven
        Als '/adressen?pandIdentificatie=0345100002016017&fields=<fields waarde>' wordt aangeroepen
        Dan bevat de response de volgende kenmerken
        | naam   | waarde                                                |
        | title  | Een of meerdere parameters zijn niet correct.         |
        | status | 400                                                   |
        | detail | Parameter 'fields' bevat een (deels) ongeldige waarde |
        En bevat de response de volgende invalidParams
        | name   | reason                |
        | fields | <reason omschrijving> |

        Voorbeelden:
        | fields waarde              | reason omschrijving                                          |
        | bestaatniet                | ongeldige waarde: 'bestaatniet' opgegeven                    |
        | bestaatniet,bestaatookniet | ongeldige waarden: 'bestaatniet', 'bestaatookniet' opgegeven |

Rule: expand parameter bevat geen onbekende resource namen

    Abstract Scenario: Er is één of meerdere onbekende resource namen opgegeven
        Als '/adressen?zoekresultaatIdentificatie=adr-f6b00930705c1ef12c2624623a797d21&expand=<expand waarde>' wordt aangeroepen
        Dan bevat de response de volgende kenmerken
        | naam   | waarde                                                |
        | title  | Een of meerdere parameters zijn niet correct.         |
        | status | 400                                                   |
        | detail | Parameter 'expand' bevat een (deels) ongeldige waarde |
        En bevat de response de volgende invalidParams
        | name   | reason                |
        | expand | <reason omschrijving> |

        Voorbeelden:
        | expand waarde              | reason omschrijving                                          |
        | bestaatniet                | ongeldige waarde: 'bestaatniet' opgegeven                    |
        | bestaatniet,bestaatookniet | ongeldige waarden: 'bestaatniet', 'bestaatookniet' opgegeven |

Rule: type van parameter waarde is correct

    Abstract Scenario: type van waarde van één parameter is niet correct
        Als '<path><query string>' wordt aangeroepen
        Dan bevat de response de volgende kenmerken
        | naam   | waarde                                                |
        | title  | Een of meerdere parameters zijn niet correct.         |
        | status | 400                                                   |
        | detail | Parameter '<parameter>' is niet van het correcte type |
        En bevat de response de volgende invalidParams
        | name        | reason                |
        | <parameter> | <reason omschrijving> |

        Voorbeelden:
        | path      | query string                                          | parameter | reason omschrijving                                   |
        | /adressen | ?pandIdentificatie=0345100002016017&page=a&pageSize=3 | page      | waarde 'a' is geen getal                              |
        | /panden   | ?locatie=abc                                          | locatie   | waarde 'abc' is geen geometrie coordinaat             |
        | /panden   | ?locatie=194189.98399146                              | locatie   | Waarde '194189.98399146' is geen geometrie coordinaat |

    Scenario: type van waarde van meerdere parameters is niet correct
        Als '/adressen?pandIdentificatie=0345100002016017&page=a&pageSize=b' wordt aangeroepen
        Dan bevat de response de volgende kenmerken
        | naam   | waarde                                                        |
        | title  | Een of meerdere parameters zijn niet correct.                 |
        | status | 400                                                           |
        | detail | Parameters 'page', 'pageSize' zijn niet van het correcte type |
        En bevat de response de volgende invalidParams
        | name     | reason                   |
        | page     | waarde 'a' is geen getal |
        | pageSize | waarde 'b' is geen getal |
    
    Scenario: type van waarde van een geometrie parameter is niet correct
        Als '/panden?locatie=194189.98399146,465870.76799701' wordt aangeroepen
        Dan bevat de response de volgende kenmerken
        | naam   | waarde                                            |
        | title  | Een of meerdere parameters zijn niet correct.     |
        | status | 400                                               |
        | detail | Parameter 'locatie' is niet van het correcte type |
        En bevat de response de volgende invalidParams
        | name    | reason                                                                   |
        | locatie | waarde '194189.98399146,465870.76799701' is niet in 'epsg:28992' formaat |

Rule: waarde van parameter is valide

    Scenario: waarde van één parameter is niet valide
        Als '/adresseerbareobjecten/0599040000' wordt aangeroepen
        Dan bevat de response de volgende kenmerken
        | naam   | waarde                                                      |
        | title  | Een of meerdere parameters zijn niet correct.               |
        | status | 400                                                         |
        | detail | Parameter 'adresseerbaarobjectidentificatie' is niet valide |
        En bevat de response de volgende invalidParams
        | name                             | reason                                                   |
        | adresseerbaarobjectidentificatie | waarde '0599040000' voldoet niet aan patroon ^[0-9]{16}$ |

    Scenario: waarde van meerdere parameters zijn niet valide
        Als '/adressen?pandIdentificatie=0345100002016017&page=-1&pageSize=2000' wordt aangeroepen
        Dan bevat de response de volgende kenmerken
        | naam   | waarde                                        |
        | title  | Een of meerdere parameters zijn niet correct. |
        | status | 400                                           |
        | detail | Parameters 'page', pageSize' zijn niet valide |
        En bevat de response de volgende invalidParams
        | name     | reason                                 |
        | page     | waarde '-1' is lager dan minimum 1     |
        | pageSize | waarde '2000' is hoger dan maximum 100 |

Rule: Een raadpleeg collectie aanroep mag slechts één identificatie parameter bevatten

    Abstract Scenario: Er zijn meerdere identificatie parameters opgegeven
        Als '<path><query string>' wordt aangeroepen
        Dan bevat de response de volgende kenmerken
        | naam   | waarde                                        |
        | title  | Een of meerdere parameters zijn niet correct. |
        | status | 400                                           |
        | detail | <fout detail>                                 |

        Voorbeelden:
        | path                   | query string                                                                                      | fout detail                                                                                                |
        | /adressen              | ?pandIdentificatie=0226100000008856&adresseerbaarObjectIdentificatie=0226010000038820             | Alleen parameter 'pandIdentificatie' of 'adresseerbaarObjectIdentificatie' moet zijn opgegeven             |
        | /adresseerbareobjecten | ?nummeraanduidingIdentificatie=0226200000038923&pandIdentificatie=0226100000008856                | Alleen parameter 'nummeraanduidingIdentificatie' of 'pandIdentificatie' moet zijn opgegeven                |
        | /panden                | ?adresseerbaarObjectIdentificatie=0226010000038820&nummeraanduidingIdentificatie=0226200000038923 | Alleen parameter 'adresseerbaarObjectIdentificatie' of 'nummeraanduidingIdentificatie' moet zijn opgegeven |

Abstract Scenario: opgegeven identificatie is niet gekoppeld aan een resource
    Als '<path>/<identificatie>' wordt aangeroepen
    Dan bevat de response de volgende kenmerken
    | naam   | waarde                                                            |
    | title  | Opgevraagde <resource naam> bestaat niet.                         |
    | status | 404                                                               |
    | detail | Geen <resource naam? gevonden met identificatie '<identificatie>' |

    Voorbeelden:
    | path                   | identificatie    | resource naam       |
    | /adresseerbareobjecten | 1599010000048400 | AdresseerbaarObject |
    | /panden                | 123456789012345  | Pand                |
