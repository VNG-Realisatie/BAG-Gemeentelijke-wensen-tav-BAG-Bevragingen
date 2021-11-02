# language: nl
Functionaliteit: Mogelijk onjuist
  In de resource wordt aangegeven of bepaalde teruggegeven waarden in de resource mogelijk onjuist zijn. Waarden in de resource zijn mogelijk onjuist wanneer er onderzoek wordt gedaan naar de juistheid van onderliggende gegevens in de registratie.

  Scenario: wanneer de status van een object in onderzoek is, zijn alle uit dat object afgeleide properties van de resource mogelijk onjuist
    Gegeven in object nummeraanduiding is gegeven Status nummeraanduiding in onderzoek
    Als de afgeleide Adres resource wordt opgevraagd
    Dan bevat het antwoord:
      """
          "mogelijkOnjuist": {
              "korteNaam": true,
              "straat": true,
              "huisnummer": true,
              "huisletter": true,
              "huisnummertoevoeging": true,
              "postcode": true,
              "woonplaats": true,
              "woonplaatsIdentificatie": true,
              "nummeraanduidingIdentificatie": true,
              "openbareRuimteIdentificatie": true,
              "adresregel1": true,
              "adresregel2": true,
              "toelichting": [ "Adres bestaat mogelijk niet (meer)." ]
          }
      """

  Scenario: wanneer meerdere properties in de resource afgeleid zijn van hetzelfde gegeven in de registratie zijn al deze properties van de resource mogelijk onjuist
    Gegeven in object Openbare ruimte is gegeven Naam in onderzoek
    Als de afgeleide Adres resource wordt opgevraagd
    Dan bevat het antwoord:
      """
          "mogelijkOnjuist": {
              "straat": true,
              "korteNaam": true,
              "adresregel1": true,
              "toelichting": [ 
                "Straatnaam komt mogelijk niet overeen met de vermelding in het straatnaambesluit."'
                "Korte naam is mogelijk onjuist, omdat de straatnaam mogelijk niet overeen komt met de vermelding in het straatnaambesluit. Dit is geen indicatie dat de straatnaam mogelijk onjuist is verkort." ]
          }
      """


  Abstract Scenario: mogelijkOnjuist wordt gevuld op basis van in onderzoek staan van gegevens in de registratie
    Gegeven in object <Objecttype> is gegeven <Attribuut in de BAG> in onderzoek
    Als de afgeleide <Resource> resource wordt opgevraagd
    Dan bevat het antwoord in property mogelijkOnjuist de property of properties <mogelijkOnjuist property> met de boolean waarde true
    En bevat het antwoord in property mogelijkOnjuist de property toelichting met een waarde "<Toelichting>"
    En bevat het antwoord in property mogelijkOnjuist geen andere properties dan <mogelijkOnjuist property> en toelichting

    Voorbeelden:
      | Objecttype       | Attribuut in de BAG                      | Resource             | mogelijkOnjuist property | Toelichting |
      | Woonplaats       | Naam woonplaats                          | Adres                | woonplaats,adresregel2               | Woonplaatsnaam is mogelijk onjuist geschreven. |
      | Woonplaats       | Status woonplaats                        | Adres                | woonplaats,woonplaatsIdentificatie,adresregel2 | Woonplaats bestaat mogelijk niet. |
      | Woonplaats       | Geometrie                                | Adres                | woonplaats,woonplaatsIdentificatie,adresregel2 | Geometrie of woonplaatsgrens is mogelijk onjuist, waardoor gaten of overlappingen ontstaan in de registratie van woonplaatsen. Gevolg kan zijn dat een object in een verkeerde woonplaats, in twee woonplaatsen, of in geen enkele woonplaats ligt. |
      | Openbare ruimte  | Naam openbare ruimte                     | Adres                | straat,adresregel1                   | Straatnaam komt mogelijk niet overeen met de vermelding in het straatnaambesluit. |
      | Openbare ruimte  | Naam openbare ruimte                     | Adres                | korteNaam,adresregel1                | Korte naam is mogelijk onjuist, omdat de straatnaam mogelijk niet overeen komt met de vermelding in het straatnaambesluit. Dit is geen indicatie dat de straatnaam mogelijk onjuist is verkort. |
      | Openbare ruimte  | Status openbare ruimte                   | Adres                | straat,korteNaam,openbareRuimteIdentificatie,woonplaats,woonplaatsIdentificatie,adresregel1,adresregel2 | Straat bestaat mogelijk niet (meer). |
      | Openbare ruimte  | Ligt in gerelateerde woonplaats          | Adres                | woonplaats,woonplaatsIdentificatie,adresregel2 | Mogelijk verkeerde woonplaats gebruikt. De straat moet verwijzen naar de woonplaats waarin de straat fysiek ligt. |
      | Nummeraanduiding | Huisnummer                               | Adres                | huisnummer,adresregel1               | Mogelijk is het verkeerde huisnummer geregistreerd. |
      | Nummeraanduiding | Huisletter                               | Adres                | huisletter,adresregel1               | Mogelijk is ten onrechte een huisletter toegekend, ontbreekt de huisletter ten onrechte, of is een verkeerde huisletter toegekend. |
      | Nummeraanduiding | Huisnummertoevoeging                     | Adres                | huisnummertoevoeging, adresregel1     | Mogelijk is ten onrechte een huisnummertoevoeging toegekend, ontbreekt de huisnummertoevoeging ten onrechte, of is een verkeerde huisnummertoevoeging toegekend. |
      | Nummeraanduiding | Postcode                                 | Adres                | postcode,adresregel2                 | Mogelijk is ten onrechte een postcode toegekend, ontbreekt de postcode ten onrechte, of is een verkeerde postcode toegekend. |
      | Nummeraanduiding | Status nummeraanduiding                  | Adres                | straat,korteNaam,huisnummer,huisletter,huisnummertoevoeging,postcode,woonplaats,nummeraanduidingIdentificatie,woonplaatsIdentificatie,openbareRuimteIdentificatie,adresregel1,adresregel2 | Adres bestaat mogelijk niet (meer), omdat de nummeraanduiding mogelijk niet (meer) bestaat. |
      | Nummeraanduiding | Ligt in gerelateerde woonplaats          | Adres                | woonplaats,woonplaatsIdentificatie,adresregel2 | Mogelijk verkeerde woonplaats gebruikt. Het adres moet verwijzen naar de woonplaats waarin het adres fysiek ligt. |
      | Nummeraanduiding | Ligt aan gerelateerde openbare ruimte    | Adres                | straat,korteNaam,openbareRuimteIdentificatie,adresregel1 | Mogelijk verkeerde straat gebruikt. Het adres moet verwijzen naar de straat waaraan het adres ligt. |
      | Pand             | Geometrie                                | Pand                 | geometrie                | Mogelijk is de locatie van de contouren onjuist. Mogelijk is de contour onjuist, bijvoorbeeld omdat een uitbouw of een gedeeltelijke sloop niet verwerkt is. |
      | Pand             | Bouwjaar                                 | Pand                 | oorspronkelijkBouwjaar   | Bouwjaar is mogelijk onjuist. |
      | Verblijfsobject  | Geometrie                                | Adresseerbaar object | geometrie                | Locatie/contour mogelijk onjuist. |
      | Standplaats      | Geometrie                                | Adresseerbaar object | geometrie                | Locatie/contour mogelijk onjuist. |
      | Ligplaats        | Geometrie                                | Adresseerbaar object | geometrie                | Locatie/contour mogelijk onjuist. |
      | Verblijfsobject  | Gebruiksdoel                             | Adresseerbaar object | gebruiksdoelen           | Het gebruiksdoel is mogelijk onjuist. In de BAG wordt het vergunde gebruik geregistreerd. Het gebruiksdoel moet overeenkomen met het gebruik zoals beschreven in de vergunning. |
      | Verblijfsobject  | Oppervlakte                              | Adresseerbaar object | oppervlakte              | De oppervlakte is mogelijk onjuist. |
      | Standplaats      | Status                                   | Adresseerbaar object | status                   | De standplaats bestaat mogelijk niet (meer). |
      | Ligplaats        | Status                                   | Adresseerbaar object | status                   | De ligplaats bestaat mogelijk niet (meer). |
      | Verblijfsobject  | Maakt onderdeel uit van gerelateerd Pand | Adresseerbaar object | pandIdentificaties       | Verblijfsobject maakt mogelijk deel uit van een ander pand. |
      | Verblijfsobject  | Heeft als hoofadres                      | Adresseerbaar object | nummeraanduidingIdentificaties | AdresseerbaarObject heeft mogelijk een verkeerd adres. Het gerelateerde hoofdadres(ID) mag niet worden gewijzigd want is onlosmakelijk met het adresseerbaar object verbonden. Kan alleen opgelost worden door de gegevens van het adres te veranderen, zodat een ander adres ontstaat. |
      | Standplaats      | Heeft als hoofdadres                     | Adresseerbaar object | nummeraanduidingIdentificaties | AdresseerbaarObject heeft mogelijk een verkeerd adres. Het gerelateerde hoofdadres(ID) mag niet worden gewijzigd want is onlosmakelijk met het adresseerbaar object verbonden. Kan alleen opgelost worden door de gegevens van het adres te veranderen, zodat een ander adres ontstaat. |
      | Ligplaats        | Heeft als hoofdadres                     | Adresseerbaar object | nummeraanduidingIdentificaties | AdresseerbaarObject heeft mogelijk een verkeerd adres. Het gerelateerde hoofdadres(ID) mag niet worden gewijzigd want is onlosmakelijk met het adresseerbaar object verbonden. Kan alleen opgelost worden door de gegevens van het adres te veranderen, zodat een ander adres ontstaat. |
      | Verblijfsobject  | Heeft als nevenadres                     | Adresseerbaar object | nummeraanduidingIdentificaties | Mogelijk is ten onrechte een nevenadres toegekend of ontbreekt de relatie met een nevenadres. |
      | Standplaats      | Heeft als nevenadres                     | Adresseerbaar object | nummeraanduidingIdentificaties | Mogelijk is ten onrechte een nevenadres toegekend of ontbreekt de relatie met een nevenadres. |
      | Ligplaats        | Heeft als nevenadres                     | Adresseerbaar object | nummeraanduidingIdentificaties | Mogelijk is ten onrechte een nevenadres toegekend of ontbreekt de relatie met een nevenadres. |
      | Woonplaats       | Naam woonplaats                          | Woonplaats           | naam                     | Woonplaatsnaam is mogelijk onjuist geschreven. |
      | Woonplaats       | Status woonplaats                        | Woonplaats           | status                   | Woonplaats bestaat mogelijk niet. |
      | Woonplaats       | Geometrie                                | Woonplaats           | geometrie                | Geometrie van de woonplaats is mogelijk onjuist. |
      | Openbare ruimte  | Naam openbare ruimte                     | Openbare ruimte      | naam                     | Openbare ruimtenaam komt mogelijk niet overeen met de vermelding in het straatnaambesluit. |
      | Openbare ruimte  | Naam openbare ruimte                     | Openbare ruimte      | korteNaam                | Korte naam is mogelijk onjuist, omdat de openbare ruimtenaam mogelijk niet overeen komt met de vermelding in het straatnaambesluit. Dit is geen indicatie dat de openbare ruimtenaam mogelijk onjuist is verkort. |
      | Openbare ruimte  | Status openbare ruimte                   | Openbare ruimte      | status                   | Openbare ruimte bestaat mogelijk niet (meer). |
      | Openbare ruimte  | Ligt in gerelateerde woonplaats          | Openbare ruimte      | woonplaatsIdentificatie  | Mogelijk verkeerde woonplaats gebruikt. |
      | Openbare ruimte  | Type                                     | Openbare ruimte      | type                     | Type openbare ruimte mogelijk onjuist. |
      | Nummeraanduiding | Huisnummer                               | Nummeraanduiding     | huisnummer               | Mogelijk is het verkeerde huisnummer geregistreerd. |
      | Nummeraanduiding | Huisletter                               | Nummeraanduiding     | huisletter               | Mogelijk is ten onrechte een huisletter toegekend, ontbreekt de huisletter ten onrechte, of is een verkeerde huisletter toegekend. |
      | Nummeraanduiding | Huisnummertoevoeging                     | Nummeraanduiding     | huisnummertoevoeging     | Mogelijk is ten onrechte een huisnummertoevoeging toegekend, ontbreekt de huisnummertoevoeging ten onrechte, of is een verkeerde huisnummertoevoeging toegekend. |
      | Nummeraanduiding | Postcode                                 | Nummeraanduiding     | postcode                 | Mogelijk is ten onrechte een postcode toegekend, ontbreekt de postcode ten onrechte, of is een verkeerde postcode toegekend. |
      | Nummeraanduiding | Status nummeraanduiding                  | Nummeraanduiding     | status                   | Nummeraanduiding bestaat mogelijk niet (meer). |
      | Nummeraanduiding | Ligt in gerelateerde woonplaats          | Nummeraanduiding     | woonplaatsIdentificatie  | Mogelijk verkeerde woonplaats gebruikt. |
      | Nummeraanduiding | Ligt aan gerelateerde openbare ruimte    | Nummeraanduiding     | openbareRuimteIdentificatie | Mogelijk verkeerde openbare ruimte gebruikt. |


  Abstract Scenario: mogelijkOnjuist vullen bij onderzoek naar de status van het object
    Gegeven in object <Objecttype> is gegeven status in onderzoek
    En in object <Objecttype> heeft status de waarde <Status>
    Als de afgeleide <Resource> resource wordt opgevraagd
    Dan bevat het antwoord in property mogelijkOnjuist de property of properties <mogelijkOnjuist property> met de boolean waarde true
    En bevat het antwoord in property mogelijkOnjuist de property toelichting met een waarde "<Toelichting>"
    En bevat het antwoord in property mogelijkOnjuist geen andere properties dan <mogelijkOnjuist property> en toelichting

    Voorbeelden:
      | Objecttype       | Status                                      | Resource             | mogelijkOnjuist property | Toelichting |
      | Pand             | Bouwvergunning verleend                     | Pand                 | status                   | Mogelijk is de bouw al gestart, is de bouw al gereed of is het pand niet gerealiseerd. |
      | Pand             | Bouw gestart                                | Pand                 | status                   | Mogelijk is de bouw al gereed of is het pand niet gerealiseerd. |
      | Pand             | Pand in gebruik (niet ingemeten)            | Pand                 | status                   | Mogelijk is de geometrie al ingemeten, of is de bouw ten onrechte gereedgemeld. |
      | Pand             | Pand in gebruik                             | Pand                 | status                   | Mogelijk is het pand nog niet in gebruik, is het pand al gesloopt, is er een vergunning tot verbouw verleend of is er een sloopmelding gedaan. |
      | Pand             | Sloopvergunning verleend                    | Pand                 | status                   | Mogelijk wordt het pand toch niet gesloopt of is het pand al gesloopt. |
      | Pand             | Verbouwing pand                             | Pand                 | status                   | Mogelijk is de verbouwing al afgerond of wordt de verbouwing niet uitgevoerd. |
      | Pand             | Pand buiten gebruik                         | Pand                 | status                   | Mogelijk is het pand weer in gebruik of is het pand gesloopt. |
      | Verblijfsobject  | Verblijfsobject gevormd                     | Adresseerbaar object | status                   | Mogelijk is de bouw al gereed of is het verblijfsobject niet gerealiseerd. |
      | Verblijfsobject  | Verblijfsobject in gebruik (niet ingemeten) | Adresseerbaar object | status                   | Mogelijk is de geometrie al ingemeten, of is de bouw ten onrechte gereedgemeld. |
      | Verblijfsobject  | Verblijfsobject in gebruik                  | Adresseerbaar object | status                   | Mogelijk is het verblijfsobject nog niet in gebruik, is het verblijfsobject al ingetrokken of is er een vergunning tot verbouw verleend. |
      | Verblijfsobject  | Verbouwing verblijfsobject                  | Adresseerbaar object | status                   | Mogelijk is de verbouwing al afgerond of wordt de verbouwing niet uitgevoerd. |
      | Verblijfsobject  | Verblijfsobject buiten gebruik              | Adresseerbaar object | status                   | Mogelijk is het verblijfsobject weer in gebruik of is het verblijfsobject ingetrokken. |

  Scenario: wanneer meerdere gegevens in onderzoek zijn, worden de toelichtingen van beide onderzoeken toegevoegd.
    Gegeven in object nummeraanduiding is gegeven huisnummer in onderzoek
    En in object nummeraanduiding is gegeven huisletter in onderzoek
    Als de afgeleide Adres resource wordt opgevraagd
    Dan bevat het antwoord:
      """
          "mogelijkOnjuist": {
              "huisnummer": true,
              "huisletter": true,
              "adresregel1":true,
              "toelichting": [
                "Mogelijk is het verkeerde huisnummer geregistreerd.",
                "Mogelijk is ten onrechte een huisletter toegekend, ontbreekt de huisletter ten onrechte, of is een verkeerde huisletter toegekend."
              ]
          }
      """

    Scenario: mogelijkOnjuist wordt ook geleverd wanneer het gegeven geen waarde heeft
      Gegeven in object nummeraanduiding is gegeven huisletter in onderzoek
      En in object nummeraanduiding heeft huisletter geen waarde of is leeg
      Als de afgeleide Adres resource wordt opgevraagd
      Dan bevat het antwoord geen property huisletter
      En bevat het antwoord:
        """
            "mogelijkOnjuist": {
                "huisletter": true,
                "adresregel1":true,
                "toelichting": [
                  "Mogelijk is ten onrechte een huisletter toegekend, ontbreekt de huisletter ten onrechte, of is een verkeerde huisletter toegekend."
                ]
            }
        """
    Scenario: mogelijkOnjuist wordt geleverd voor velden die gevraagd zijn met fields
      Gegeven in object nummeraanduiding is gegeven huisnummer in onderzoek
      Als de afgeleide Adres resource wordt opgevraagd met fields=postcode,huisnummer
      Dan bevat het antwoord property mogelijkOnjuist.huisnummer met de waarde true
      En bevat het antwoord geen property mogelijkOnjuist.adresregel1
      En bevat het antwoord geen andere properties mogelijkOnjuist
      En bevat het antwoord property postcode met een waarde
      En bevat het antwoord property huisnummer met een waarde

    Scenario: mogelijkOnjuist bij objectstatus in onderzoek en gebruik fields
      Gegeven in object nummeraanduiding is gegeven Status nummeraanduiding in onderzoek
      Als de afgeleide Adres resource wordt opgevraagd met fields=postcode,huisnummer
      Dan bevat het antwoord:
        """
            "mogelijkOnjuist": {
                "huisnummer": true,
                "postcode": true,
                "toelichting": [ "Adres bestaat mogelijk niet (meer)." ]
            }
        """

    Scenario: mogelijkOnjuist properties vragen met fields
      Gegeven in object nummeraanduiding is gegeven huisnummer in onderzoek
      En in object nummeraanduiding is gegeven huisletter in onderzoek
      En in object nummeraanduiding is gegeven postcode niet in onderzoek
      En hebben gegevens postcode en huisnummer een waarde
      En hebben gegevens huisletter en huisnummertoevoeging geen waarde
      Als de afgeleide Adres resource wordt opgevraagd met fields=huisnummer,mogelijkOnjuist.huisletter,mogelijkOnjuist.postcode
      Dan bevat het antwoord property mogelijkOnjuist.huisnummer met de waarde true
      En bevat het antwoord property mogelijkOnjuist.huisletter met de waarde true
      En bevat het antwoord geen property mogelijkOnjuist.postcode
      En bevat het antwoord geen property postcode
      En bevat het antwoord property huisnummer met een waarde
      En bevat het antwoord geen property huisletter

    Scenario: mogelijkOnjuist vragen met fields
      Gegeven in object nummeraanduiding is gegeven huisnummer in onderzoek
      En in object nummeraanduiding is gegeven huisletter in onderzoek
      Als de afgeleide Adres resource wordt opgevraagd met fields=mogelijkOnjuist
      Dan bevat het antwoord property mogelijkOnjuist.huisnummer met de waarde true
      En bevat het antwoord property mogelijkOnjuist.huisletter met de waarde true
      En bevat het antwoord geen property mogelijkOnjuist.postcode
      En bevat het antwoord geen property postcode
      En bevat het antwoord geen property huisnummer
      En bevat het antwoord geen property huisletter

    Scenario: woonplaats geometrie is in onderzoek maar geometrie wordt niet opgevraagd
      Gegeven in object woonplaats is gegeven geometrie in onderzoek
      En geen andere gegevens van de woonplaats zijn in onderzoek
      Als de afgeleide resource Woonplaats wordt opgevraagd
      En daarbij geen expand parameter wordt meegegeven
      Dan bevat het antwoord geen property mogelijkOnjuist

    Scenario: woonplaats geometrie is in onderzoek en geometrie wordt meegeleverd
      Gegeven in object woonplaats is gegeven geometrie in onderzoek
      En geen andere gegevens van de woonplaats zijn in onderzoek
      Als de afgeleide resource Woonplaats wordt opgevraagd met expand=geometrie
      Dan bevat het antwoord:
        """
            "mogelijkOnjuist": {
                "geometrie": true,
                "toelichting": [ "Geometrie van de woonplaats is mogelijk onjuist." ]
            }
        """
    Scenario: mogelijkOnjuist wordt meegeleverd bij embedded resources voor gevraagde gegevens
      Gegeven in object woonplaats is gegeven naam in onderzoek
      Als de afgeleide resource Adres wordt opgevraagd met expand=woonplaats
      Dan bevat het antwoord:
        """
            "mogelijkOnjuist": {
                "woonplaats": true,
                "toelichting": [
                  "Woonplaatsnaam is mogelijk onjuist geschreven."
                ]
            }
        """
      En bevat in het antwoord property _embedded.woonplaats:
        """
            "mogelijkOnjuist": {
                "naam": true,
                "toelichting": [
                  "Woonplaatsnaam is mogelijk onjuist geschreven."
                ]
            }
        """

    Scenario: niet leveren mogelijkOnjuist voor een property dat niet gevraagd is in fields
      Gegeven in object Openbare Ruimte is gegeven "Ligt in gerelateerde woonplaats" in onderzoek
      Als de afgeleide resource Adres wordt opgevraagd met fields=postcode,huisnummer
      Dan bevat het antwoord property "postcode"
      En bevat het antwoord property "huisnummer"
      En bevat het antwoord geen property "woonplaats"
      En bevat het antwoord geen property "woonplaatsIdentificatie"
      En bevat het antwoord geen property "mogelijkOnjuist"

      Als de afgeleide resource Adres wordt opgevraagd met fields=postcode,straat,huisnummer,woonplaats
      Dan bevat het antwoord property "postcode"
      En bevat het antwoord property "straat"
      En bevat het antwoord property "huisnummer"
      En bevat het antwoord property "woonplaats"
      En bevat het antwoord geen property "woonplaatsIdentificatie"
      En bevat het antwoord:
        """
            "mogelijkOnjuist": {
                "woonplaats": true,
                "toelichting": [
                  "Mogelijk verkeerde woonplaats gebruikt. De straat moet verwijzen naar de woonplaats waarin de straat fysiek ligt."
                ]
            }
        """
      En bevat het antwoord geen property "mogelijkOnjuist.woonplaatsIdentificatie"

    Scenario: leveren mogelijkOnjuist voor een property dat verplicht wordt meegeleverd bij een ander property dat gevraagd is met fields
      Gegeven in object Nummeraanduiding is gegeven "Huisletter" in onderzoek
      En heeft gegeven "Huisletter" geen waarde
      Als de afgeleide resource Adres wordt opgevraagd met fields=postcode,huisnummer
      Dan bevat het antwoord property "postcode"
      En bevat het antwoord property "huisnummer"
      En bevat het antwoord geen property "huisletter"
      En bevat het antwoord:
        """
            "mogelijkOnjuist": {
                "huisletter": true,
                "toelichting": [
                  "Mogelijk is ten onrechte een huisletter toegekend, ontbreekt de huisletter ten onrechte, of is een verkeerde huisletter toegekend."
                ]
            }
        """
      En bevat het antwoord geen property "mogelijkOnjuist.huisnummer"

   Scenario: Openbare ruimte "ligt in" is in onderzoek, maar relatie naar woonplaats wordt gelegd via nummeraanduiding
      Gegeven in object openbare ruimte is gegeven "ligt in" (woonplaats) in onderzoek
      En in object nummeraanduiding heeft attribuut "ligt in" (woonplaats) een waarde
      En verder zijn er geen aan het adres gerelateerde attributen in onderzoek
      Als de afgeleide Adres resource wordt opgevraagd
      Dan bevat het antwoord geen property "mogelijkOnjuist"      

Onderstaande scenario's zijn erop gericht dat afnemers altijd de noodzakelijke mogelijk onjuist informatie ontvangen als deze door toepassing van de fieldsparameter in principe niet zou worden geleverd.

    Scenario: leveren mogelijkOnjuist wanneer een woonplaats geometrie mogelijk onjuist is en vragen expand van woonplaats bij resource adressen
      Gegeven bij object Woonplaats is “geometrie” in onderzoek
      Als de resource adressen wordt opgevraagd met parameter fields=<property> en de gevraagde properties zijn niet woonplaats en/of woonplaatsIdentificatie en/of adresregel2
      En met parameter expand=woonplaats of expand=woonplaats.<property>
      Dan bevat het antwoord:
        """
            "mogelijkOnjuist": {
                "woonplaatsIdentificatie": true,
                "toelichting": [ "Geometrie of woonplaatsgrens is mogelijk onjuist, waardoor gaten of overlappingen ontstaan in de registratie van woonplaatsen. Gevolg kan zijn dat een object in een verkeerde woonplaats, in twee woonplaatsen, of in geen enkele woonplaats ligt." ]
            }
        """
      En bevat het antwoord geen property woonplaatsIdentificatie
      En bevat het antwoord geen property woonplaats
      En bevat het antwoord geen property adresregel2

    Scenario: leveren mogelijkOnjuist bij een relatie die mogelijk onjuist is en vragen expand van gerelateerde resource
      Gegeven in object Nummeraanduiding is “ligt aan” (openbare ruimte) in onderzoek
      En voor gerelateerde openbare ruimte is niets in onderzoek
      Als de resource adressen wordt opgevraagd met parameter fields=huisnummer,woonplaats&expand=openbareRuimte
      Dan bevat het antwoord:
        """
            "mogelijkOnjuist": {
                "openbareRuimteIdentificatie": true,
                "toelichting": [ "Mogelijk verkeerde straat gebruikt. Het adres moet verwijzen naar de straat waaraan het adres ligt." ]
            }
        """
      En bevat het antwoord geen property _embedded.openbareRuimte.mogelijkOnjuist
      En bevat het antwoord geen property openbareRuimteIdentificatie
      En bevat het antwoord property "huisnummer"
      En bevat het antwoord property "woonplaats"

    Abstract Scenario: Wel leveren mogelijkOnjuist wanneer met expand een object wordt gevraagd waar mogelijk een onjuiste relatie bestaat.
      Gegeven in object <Objecttype> is gegeven <Attribuut in de BAG> in onderzoek
      Als de resource <Resource> wordt opgevraagd met parameter fields en deze bevat niet de waarde uit de kolom <Fields bevat niet>
      En met parameter expand=<resource> of expand=<resource.property>
      En de met fields opgevraagde property is geen property van de gerelateerde resource die wordt gevraagd met expand en expand=<resource> of expand=<resource.property>
      Dan bevat het antwoord property mogelijkOnjuist.<Property> met waarde true
      En bevat het antwoord property mogelijkOnjuist.toelichting met een waarde <Toelichting>

      Voorbeelden:
      | Objecttype       | Attribuut in de BAG                      | Resource              | Fields bevat niet                                        | Expand         | Property                       | Toelichting |
      | Openbare ruimte  | Ligt in gerelateerde woonplaats          | adressen              | woonplaats,woonplaatsIdentificatie,adresregel2           | woonplaats     | woonplaatsIdentificatie        | Mogelijk verkeerde woonplaats gebruikt. De straat moet verwijzen naar de woonplaats waarin de straat fysiek ligt. |
      | Nummeraanduiding | Ligt in gerelateerde woonplaats          | adressen              | woonplaats,woonplaatsIdentificatie,adresregel2           | woonplaats     | woonplaatsIdentificatie        | Mogelijk verkeerde woonplaats gebruikt. Het adres moet verwijzen naar de woonplaats waarin het adres fysiek ligt. |
      | Nummeraanduiding | Ligt aan gerelateerde openbare ruimte    | adressen              | straat,korteNaam,openbareRuimteIdentificatie,adresregel1 | openbareRuimte | openbareRuimteIdentificatie    | Mogelijk verkeerde straat gebruikt. Het adres moet verwijzen naar de straat waaraan het adres ligt. |
      | Verblijfsobject  | Maakt onderdeel uit van gerelateerd Pand | adresseerbareobjecten | pandIdentificaties                                       | panden         | pandIdentificaties             | Verblijfsobject maakt mogelijk deel uit van een ander pand. |
      | Verblijfsobject  | Heeft als hoofadres                      | adresseerbareobjecten | nummeraanduidingIdentificaties                           | adressen       | nummeraanduidingIdentificaties | AdresseerbaarObject heeft mogelijk een verkeerd adres. Het gerelateerde hoofdadres(ID) mag niet worden gewijzigd want is onlosmakelijk met het adresseerbaar object verbonden. Kan alleen opgelost worden door de gegevens van het adres te veranderen, zodat een ander adres ontstaat. |
      | Standplaats      | Heeft als hoofdadres                     | adresseerbareobjecten | nummeraanduidingIdentificaties                           | adressen       | nummeraanduidingIdentificaties | AdresseerbaarObject heeft mogelijk een verkeerd adres. Het gerelateerde hoofdadres(ID) mag niet worden gewijzigd want is onlosmakelijk met het adresseerbaar object verbonden. Kan alleen opgelost worden door de gegevens van het adres te veranderen, zodat een ander adres ontstaat. |
      | Ligplaats        | Heeft als hoofdadres                     | adresseerbareobjecten | nummeraanduidingIdentificaties                           | adressen       | nummeraanduidingIdentificaties | AdresseerbaarObject heeft mogelijk een verkeerd adres. Het gerelateerde hoofdadres(ID) mag niet worden gewijzigd want is onlosmakelijk met het adresseerbaar object verbonden. Kan alleen opgelost worden door de gegevens van het adres te veranderen, zodat een ander adres ontstaat. |
      | Verblijfsobject  | Heeft als nevenadres                     | adresseerbareobjecten | nummeraanduidingIdentificaties                           | adressen       | nummeraanduidingIdentificaties | Mogelijk is ten onrechte een nevenadres toegekend of ontbreekt de relatie met een nevenadres. |
      | Standplaats      | Heeft als nevenadres                     | adresseerbareobjecten | nummeraanduidingIdentificaties                           | adressen       | nummeraanduidingIdentificaties | Mogelijk is ten onrechte een nevenadres toegekend of ontbreekt de relatie met een nevenadres. |
      | Ligplaats        | Heeft als nevenadres                     | adresseerbareobjecten | nummeraanduidingIdentificaties                           | adressen       | nummeraanduidingIdentificaties | Mogelijk is ten onrechte een nevenadres toegekend of ontbreekt de relatie met een nevenadres. |

    Abstract Scenario: Wel leveren mogelijkOnjuist bij met fields vragen naar link die mogelijk niet naar het juiste object verwijst.
      Gegeven in object <Objecttype> is gegeven <Attribuut in de BAG> in onderzoek
      Als ik de resource <Resource> opvraag met fields=_links.<Fields>
      Dan bevat het antwoord property mogelijkOnjuist.<Property> met waarde true
      En bevat het antwoord property mogelijkOnjuist.toelichting met een waarde <Toelichting>

      Voorbeelden:
      | Objecttype       | Attribuut in de BAG                      | Resource              | Fields                      | Property                       | Toelichting |
      | Nummeraanduiding | Ligt aan gerelateerde openbare ruimte    | adressen              | openbareRuimte              | openbareRuimteIdentificatie    | Mogelijk verkeerde straat gebruikt. Het adres moet verwijzen naar de straat waaraan het adres ligt. |
      | Openbare ruimte  | Ligt in gerelateerde woonplaats          | adressen              | woonplaats                  | woonplaatsIdentificatie        | Mogelijk verkeerde woonplaats gebruikt. De straat moet verwijzen naar de woonplaats waarin de straat fysiek ligt. |
      | Nummeraanduiding | Ligt in gerelateerde woonplaats          | adressen              | woonplaats                  | woonplaatsIdentificatie        | Mogelijk verkeerde woonplaats gebruikt. Het adres moet verwijzen naar de woonplaats waarin het adres fysiek ligt. |
      | Verblijfsobject  | Maakt onderdeel uit van gerelateerd Pand | adressen              | panden                      | pandIdentificaties             | Verblijfsobject maakt mogelijk deel uit van een ander pand. |
      | Openbare ruimte  | Ligt in gerelateerde woonplaats          | openbareruimten       | woonplaats                  | woonplaatsIdentificatie        | Mogelijk verkeerde woonplaats gebruikt. De straat moet verwijzen naar de woonplaats waarin het adres fysiek ligt. |
      | Nummeraanduiding | Ligt in gerelateerde woonplaats          | nummeraanduidingen    | woonplaats                  | woonplaatsIdentificatie        | Mogelijk verkeerde woonplaats gebruikt. Het adres moet verwijzen naar de woonplaats waarin het adres fysiek ligt. |
      | Nummeraanduiding | Ligt aan gerelateerde openbare ruimte    | nummeraanduidingen    | openbareRuimte              | openbareRuimteIdentificatie    | Mogelijk verkeerde straat gebruikt. Het adres moet verwijzen naar de straat waaraan het adres ligt. |
      | Verblijfsobject  | Maakt onderdeel uit van gerelateerd Pand | adresseerbareobjecten | panden                      | pandIdentificaties             | Verblijfsobject maakt mogelijk deel uit van een ander pand. |
      | Verblijfsobject  | Heeft als hoofadres                      | adresseerbareobjecten | adressen                    | nummeraanduidingIdentificaties | AdresseerbaarObject heeft mogelijk een verkeerd adres. Het gerelateerde hoofdadres(ID) mag niet worden gewijzigd want is onlosmakelijk met het adresseerbaar object verbonden. Kan alleen opgelost worden door de gegevens van het adres te veranderen, zodat een ander adres ontstaat. |
      | Standplaats      | Heeft als hoofdadres                     | adresseerbareobjecten | adressen                    | nummeraanduidingIdentificaties | AdresseerbaarObject heeft mogelijk een verkeerd adres. Het gerelateerde hoofdadres(ID) mag niet worden gewijzigd want is onlosmakelijk met het adresseerbaar object verbonden. Kan alleen opgelost worden door de gegevens van het adres te veranderen, zodat een ander adres ontstaat. |
      | Ligplaats        | Heeft als hoofdadres                     | adresseerbareobjecten | adressen                    | nummeraanduidingIdentificaties | AdresseerbaarObject heeft mogelijk een verkeerd adres. Het gerelateerde hoofdadres(ID) mag niet worden gewijzigd want is onlosmakelijk met het adresseerbaar object verbonden. Kan alleen opgelost worden door de gegevens van het adres te veranderen, zodat een ander adres ontstaat. |
      | Verblijfsobject  | Heeft als nevenadres                     | adresseerbareobjecten | adressen                    | nummeraanduidingIdentificaties | Mogelijk is ten onrechte een nevenadres toegekend of ontbreekt de relatie met een nevenadres. |
      | Standplaats      | Heeft als nevenadres                     | adresseerbareobjecten | adressen                    | nummeraanduidingIdentificaties | Mogelijk is ten onrechte een nevenadres toegekend of ontbreekt de relatie met een nevenadres. |
      | Ligplaats        | Heeft als nevenadres                     | adresseerbareobjecten | adressen                    | nummeraanduidingIdentificaties | Mogelijk is ten onrechte een nevenadres toegekend of ontbreekt de relatie met een nevenadres. |
