---
layout: page-with-side-nav
title: Functionaliteit en specificaties
---
# Functionaliteit en specificaties - BAG Huidige Bevragingen API

## <span style="color:red">De BAG Huidige Bevragingen API v 1.5 is expired.</span>
   
<span style="color:red">Start niet meer met de implementatie van deze API. Implementeer daarvoor in plaats de BAG Individuele Bevragingen API, we verwijzen je daarvoor naar de [Getting Started van de BAG Individuele Bevragingen v. 2.6](https://vng-realisatie.github.io/BAG-Gemeentelijke-wensen-tav-BAG-Bevragingen/getting-started).<br/><br/> Onderstaande informatie is alleen bedoelt voor evt. resterende gebruikers van de BAG Huidige Bevragingen API.</span>

Je kunt de Open API Specificaties (OAS3) van de API bekijken in [Swagger-formaat](./swagger-ui-HB) of [Redoc](./redoc-HB).

De (resolved) OAS3 is hier te downloaden: [openapi.yaml](https://github.com/VNG-Realisatie/BAG-Gemeentelijke-wensen-tav-BAG-Bevragingen/blob/master/specificatie/genereervariant/openapi.yaml){:target="_blank" rel="noopener"}.

## Beschikbare resources
De API kent de volgende resources:
- adressen: hierin zijn samenhangende en gerelateerde gegevens samengevoegd uit de nummeraanduiding, openbare ruimte en woonplaats die samen een adres vormen
- adresseerbareobjecten: dit kan een verblijfsobject, ligplaats of standplaats zijn
- nummeraanduidingen
- openbareruimten
- woonplaatsen
- panden

Voor de verschillende resources wordt de uri samengesteld met de identificatie van het onderliggende BAG-object. Dit is een 16 cijferige, of in geval van woonplaats 4 cijferige identificatie. Voor adressen wordt de nummeraanduiding identificatie gebruikt in de uri.  
De identificatie kan voorloopnullen bevatten, dus het is geen integer.

### Zoeken van een adres
Je kan een adres zoeken met endpoint /adressen/zoek en parameter "zoek" waarin met postcode, woonplaats, straatnaam, huisnummer, huisletter en huisnummertoevoeging kan worden gezocht. Op dit moment worden alleen deze gegevens ondersteund, het is de bedoeling dat dit later volledig "fuzzy search" wordt.  
Deze zoekfunctie, via endpoint /adressen/zoek levert voor elk gevonden adres een combinatie van een zoekresultaat identificatie en een omschrijving, plus een link voor het ophalen van de volledige adresgegevens.

Deze zoekfunctie kan soms veel zoekresultaten opleveren. Daarom wordt hier [paginering](https://github.com/VNG-Realisatie/Haal-Centraal-common/blob/v1.1.0/features/paginering.feature){:target="_blank"} toegepast.

Op basis van de zoekresultaten kan je een gevonden adres ophalen met endpoint /adressen?zoekresultaatIdentificatie={zoekresultaatIdentificatie}, waarbij je {zoekresultaatIdentificatie} moet vervangen door een waarde voor identificatie in de zoekresultaten van /adressen/zoek.

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
Het adres haal je vervolgens op met "/adressen?zoekresultaatIdentificatie=adr-89d5a4d96f09c60716c4671fdb9334b8".

### Zoeken van adressen in een pand
Wanneer je alle adressen in een pand wilt zoeken, kan je dit doen met /adressen?pandIdentificatie={pandIdentificatie}, waarbij {pandIdentificatie} moet worden vervangen door de identificatie van het betreffende pand. Bijvoorbeeld /adressen?pandIdentificatie=0826100000000467.

Aangezien dit veel adressen kan opleveren, wordt hier [paginering](https://github.com/VNG-Realisatie/Haal-Centraal-common/blob/v1.1.0/features/paginering.feature){:target="_blank"} toegepast.

Met dit endpoint kun je ook zoeken op postcode, huisnummer, huisletter en huisnummertoevoeging.
De manier waarop je met de parameter exacteMatch kunt zoeken, kun je vinden in de feature.

### Geometrie van een woonplaats
De geometrie van een woonplaats kan zeer omvangrijk zijn. Daarom wordt de geometrie niet standaard met een woonplaats meegeleverd. Wanneer je de geometrie van de woonplaats wel wilt krijgen, dan moet je de expand parameter gebruiken. Bijvoorbeeld /woonplaatsen/2258?expand=geometrie.

## Algemene functionaliteit
Verder zijn er nog een paar algemene functies die gelden voor alle bovenstaande aanvragen:
- Gebruik van de **fields** parameter om de response te filteren. Voor werking, zie feature [fields](https://github.com/VNG-Realisatie/Haal-Centraal-common/blob/v1.1.0/features/fields.feature){:target="_blank"}
- Gebruik van de **expand** parameter om subresources te ontsluiten. Voor werking, zie feature [expand](https://github.com/VNG-Realisatie/Haal-Centraal-common/blob/v1.1.0/features/expand.feature){:target="_blank"}
- Gebruik van paginering om het aantal zoekresultaten per zoekvraag te beperken. Met de **page** parameter kan een volgende pagina worden gevraagd. Met de **pageSize** parameter kan gekozen worden voor meer of minder zoekresultaten per pagina (standaard is 20, maximum is 100). Voor werking, zie feature [paginering](https://github.com/VNG-Realisatie/Haal-Centraal-common/blob/v1.1.0/features/paginering.feature){:target="_blank"}
- Soms kan er een onderzoek lopen of een gegeven wel correct is. Er zijn dan twijfels over de juistheid van de geregistreerde waarde. De API levert deze waarde wel, maar neemt die velden dan op in **mogelijkOnjuist** met de waarde True.
- Sommige resources bevatten geometrie. De API ondersteunt op dit moment alleen het RD coördinatenstelsel (epsg:28992). Bij een aanvraag die geometrie teruglevert moet de request header **Accept-Crs** worden meegestuurd.
- Bij het zoeken van een pand op **locatie** mag de header **Content-Crs** worden meegestuurd. Wanneer je deze header weglaat wordt default coördinatenstelsel RD (epsg:28992) gebruikt wat op dit moment ook het enige het coördinatenstelsel is dat de API ondersteunt.
- Bij het zoeken naar panden en adresseerbare objecten kun je gebruik maken van bbox.
- [HAL links](https://tools.ietf.org/html/draft-kelly-json-hal-08){:target="_blank"}, die soms [templated](https://github.com/VNG-Realisatie/Haal-Centraal-common/blob/v1.1.0/features/uri-templating.feature){:target="_blank"} worden geleverd.

## Test de API
De werking van de API is het makkelijkst te testen met behulp van [Postman](https://www.getpostman.com/){:target="_blank"}.
De [openapi.yaml](https://github.com/VNG-Realisatie/BAG-Gemeentelijke-wensen-tav-BAG-Bevragingen/blob/master/specificatie/genereervariant/openapi.yaml){:target="_blank"} kun je importeren als project, waarna de verschillende requests worden ingeladen die deze API ondersteunt.
Je kunt ook het project dat we voor je heben gemaakt gebruiken: [BAG-Bevragen-postman-collection.json](https://github.com/VNG-Realisatie/BAG-Gemeentelijke-wensen-tav-BAG-Bevragingen/blob/master/test/BAG-Bevragen-postman-collection.json){:target="_blank"}. Hierin moet je alleen de base url en authenticatie (API-key) nog invullen.

<!--### API key
Om de API te kunnen bevragen is de API key nodig die je al eerder hebt ontvangen. Deze moet je bij het request opnemen in request header "X-Api-Key".-->

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

Tip: Je kan ook de [BAG Viewer](https://bagviewer.kadaster.nl/lvbag/bag-viewer/index.html){:target="_blank"} gebruiken om meer testgevallen te zoeken.
<!--
### URL
De API is te benaderen via de volgende url: https://api.bag.kadaster.nl/esd/huidigebevragingen/v1.-->
