# Getting Started - BAG Bevragen API
De 'BAG Bevragen' API levert actuele gegevens uit de Basisregistratie Adressen en Gebouwen. Dit betekent dat geen historische gegevens kunnen worden gevraagd en dat gegevens met een eindstatus niet worden geleverd.

De API is gespecificeerd met behulp van de OpenAPI Specifications (OAS3).

Om aan te sluiten kun je de volgende stappen doorlopen:
1. [Meld je aan bij het kadaster om toegang te krijgen tot de testomgeving](#Aanmelden-om-aan-te-sluiten)
2. [Bekijk de functionaliteit en specificaties](#Functionaliteit)
3. [Probeer en test de API](#Probeer-en-test-de-API)
4. [Sluit aan op productie](#Sluit-aan-op-productie)

## Aanmelden om aan te sluiten
Vraag [een API-key aan](https://formulieren.kadaster.nl/aanvragen_bag_api_key_testomgeving) om toegang te krijgen tot de testomgeving van de BAG API.

## Functionaliteit
U kunt de Open API Specificaties (OAS3) van de API bekijken in [Swagger-formaat](https://petstore.swagger.io/?url=https://raw.githubusercontent.com/VNG-Realisatie/Haal-Centraal-BAG-Bevragen/master/specificatie/openapi.yaml).

De (resolved) OAS3 is hier te downloaden: [openapi.yaml](../specificatie/genereervariant/openapi.yaml).

### Beschikbare resources
De API kent de volgende resources:
- adressen: hierin zijn samenhangende en gerelateerde gegevens samengevoegd uit de nummeraanduiding, openbare ruimte en woonplaats die samen een adres vormen
- adresseerbareobjecten: dit kan een verblijfsobject, ligplaats of standplaats zijn
- nummeraanduidingen
- openbareruimten
- woonplaatsen
- panden

Voor de verschillende resources wordt de uri samengesteld met de identificatie van het onderliggende BAG-object. Dit is een 16 cijferige, of in geval van woonplaats 4 cijferige identificatie. Voor adressen wordt de nummeraanduiding identificatie gebruikt in de uri.  
De identificatie kan voorloopnullen bevatten, dus het is geen integer.

#### Zoeken van een adres
Een adres kan gezocht worden met endpoint /adressen/zoek en parameter "zoek" waarin met postcode, woonplaats, straatnaam, huisnummer, huisletter en huisnummertoevoeging kan worden gezocht. Op dit moment worden alleen deze gegevens ondersteund, het is de bedoeling dat dit later volledig "fuzzy search" wordt.  
Deze zoekfunctie, via endpoint /adressen/zoek levert voor elk gevonden adres een combinatie van een zoekresultaat identificatie en een omschrijving, plus een link voor het ophalen van de volledige adresgegevens.

Deze zoekfunctie kan soms veel zoekresultaten opleveren. Daarom wordt hier [paginering](https://github.com/VNG-Realisatie/Haal-Centraal-common/blob/v1.1.0/features/paginering.feature) toegepast.

Op basis van de zoekresultaten kan een adres worden opgehaald met endpoint /adressen?zoekresultaatIdentificatie={zoekresultaatIdentificatie}, waarbij {zoekresultaatIdentificatie} vervangen moet worden door een waarde voor identificatie in de zoekresultaten van /adressen/zoek.

Bijvoorbeeld zoeken op "/adressen/zoek?zoek=nootdorp 15c dorpsstraat" levert:
```
"_embedded" : {
   "zoekresultaten" : [
      {
         "omschrijving" : "Dorpsstraat 15c, 2631CR Nootdorp",
         "identificatie" : "adr-89d5a4d96f09c60716c4671fdb9334b8",
         "_links" : {
            "adres" : {
               "href" : "/adressen?zoekresultaatIdentificatie=adr-89d5a4d96f09c60716c4671fdb9334b8"
            }
         }
      }
   ]
}
```
Het adres kan vervolgens worden opgehaald met "/adressen?zoekresultaatIdentificatie=adr-89d5a4d96f09c60716c4671fdb9334b8".

#### Zoeken van adressen in een pand
Wanneer je alle adressen in een pand wilt zoeken, kan je dit doen met /adressen?pandIdentificatie={pandIdentificatie}, waarbij {pandIdentificatie} moet worden vervangen door de identificatie van het betreffende pand. Bijvoorbeeld /adressen?pandIdentificatie=0826100000000467.

Aangezien dit veel adressen kan opleveren, wordt hier [paginering](https://github.com/VNG-Realisatie/Haal-Centraal-common/blob/v1.1.0/features/paginering.feature) toegepast.

#### Geometrie van een woonplaats
De geometrie van een woonplaats kan zeer omvangrijk zijn. Daarom wordt bij het raadplegen van een woonplaats standaard de geometrie niet meegeleverd. Wanneer je de geometrie van de woonplaats wel geleverd wilt krijgen, dan moet bij de aanvraag de expand parameter worden gebruikt. Bijvoorbeeld /woonplaatsen/2258?expand=geometrie.

### Algemene functionaliteit
Verder zijn er nog een paar algemene functies die gelden voor alle bovenstaande aanvragen:
- Gebruik van de **fields** parameter om de response te filteren. Voor werking, zie feature [fields](https://github.com/VNG-Realisatie/Haal-Centraal-common/blob/v1.1.0/features/fields.feature)
- Gebruik van de **expand** parameter om subresources te ontsluiten. Voor werking, zie feature [expand](https://github.com/VNG-Realisatie/Haal-Centraal-common/blob/v1.1.0/features/expand.feature)
- Gebruik van paginering om het aantal zoekresultaten per zoekvraag te beperken. Met de **page** parameter kan een volgende pagina worden gevraagd. Met de **pageSize** parameter kan gekozen worden voor meer of minder zoekresultaten per pagina (standaard is 20, maximum is 100). Voor werking, zie feature [paginering](https://github.com/VNG-Realisatie/Haal-Centraal-common/blob/v1.1.0/features/paginering.feature)
- Soms kan er een onderzoek lopen of een gegeven wel correct is. Er zijn dan twijfels over de juistheid van de geregistreerde waarde. De API levert deze waarde wel, maar neemt die velden dan op in **mogelijkOnjuist** met de waarde True.
- Sommige resources bevatten geometrie. De API ondersteunt op dit moment alleen het RD coördinatenstelsel (epsg:28992). Bij een aanvraag die geometrie teruglevert moet de request header **Accept-Crs** worden meegestuurd.
- Bij het zoeken van een pand op **locatie** moet de header **Content-Crs** worden meegestuurd. De API ondersteunt op dit moment alleen het RD coördinatenstelsel (epsg:28992).
- [HAL links](https://tools.ietf.org/html/draft-kelly-json-hal-08), die soms [templated](https://github.com/VNG-Realisatie/Haal-Centraal-common/blob/v1.1.0/features/uri-templating.feature) worden geleverd.

## Probeer en test de API
De werking van de API is het makkelijkst te testen met behulp van [Postman](https://www.getpostman.com/).
De [openapi.yaml](../specificatie/genereervariant/openapi.yaml) kun je importeren als project, waarna de verschillende requests worden ingeladen die deze API ondersteunt.

### API key
Om de API te kunnen bevragen is een API key nodig. Deze wordt bij de request opgenomen in request header "X-Api-Key". Wanneer je je [aanmeldt](https://formulieren.kadaster.nl/aanvragen_bag_api_key_testomgeving) voor het gebruiken van de API ontvang je de API key.

### URL
De API is te benaderen via de volgende url: https://api.bag.acceptatie.kadaster.nl/esd/huidigebevragingen/v1.

### Testgevallen
Onderstaande tabellen bevatten testgevallen voor specifieke situaties waarmee de werking van de API kan worden getest.

| Resource              | Testsituatie                                                                     | uri                                     |
| --------------------- | -------------------------------------------------------------------------------- | --------------------------------------- |
| adressen              | Adres met diakriet in straatnaam, huisnummer, huisletter en huisnummertoevoeging | /adressen/0484200002040489              |
| adressen              | Lange straatnaam                                                                 | /adressen/0417200000000354              |
| adressen              | Nevenadres                                                                       | /adressen/0014200022197986              |
| adressen              | Geconstateerd                                                                    | /adressen/0014200022188962              |
| adressen              | Meerdere panden op zelfde adres                                                  | /adressen/0193200000096680              |
| adresseerbareobjecten | Verblijfsobject                                                                  | /adresseerbareobjecten/0599010000165822 |
| adresseerbareobjecten | Standplaats                                                                      | /adresseerbareobjecten/0503030000103062 |
| adresseerbareobjecten | Ligplaats                                                                        | /adresseerbareobjecten/0569020000012435 |
| adresseerbareobjecten | Meerdere gebruiksdoelen                                                          | /adresseerbareobjecten/0626019900006674 |
| adresseerbareobjecten | Met nevenadres                                                                   | /adresseerbareobjecten/0014010011067299 |
| adresseerbareobjecten | Meerdere panden                                                                  | /adresseerbareobjecten/0193010000096628 |
| panden                | Veel adressen                                                                    | /panden/0826100000000467                |
| panden                | Met nevenadres                                                                   | /panden/0014100010921152                |
| panden                | Zonder adres                                                                     | /panden/0503100000034877                |

Tip: Je kan ook de [BAG Viewer](https://bagviewer.kadaster.nl/lvbag/bag-viewer/index.html) gebruiken om meer testgevallen te zoeken.

## Sluit aan op productie

### API key
Vraag [een API-key aan](https://formulieren.kadaster.nl/aanvragen_bag_api_key_productieomgeving) om toegang te krijgen tot de testomgeving van de BAG API. Voor de productieomgeving wordt dus een andere API-key gebruikt dan in de testomgeving.

### URL
De API is te benaderen via de volgende url: https://api.bag.kadaster.nl/esd/huidigebevragingen/v1.
