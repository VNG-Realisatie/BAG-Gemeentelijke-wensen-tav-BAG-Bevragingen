---
layout: page-with-side-nav
title: Releasenotes
---

# Release notes BAG Huidige bevragingen API

## Versie 1.4.0 (09-12-2021)
In deze release is ....


## Versie 1.3.0 (20-09-2021)
In deze release is een bugfix opgenomen over "mogelijk onjuist" bij een adres. Naast wijzigingen in de API specificaties is een feature-file toegevoegd.

### Opgeloste issues

  | Link Github	| Beschrijving |
  | --- | --- |
  | [306](https://github.com/VNG-Realisatie/Haal-Centraal-BAG-bevragen/issues/306) | Als medewerker gebiedsontwikkeling wil ik op basis van bepaalde kenmerken van appartements-adressen/verblijfsobjecten zoals bouwjaar Pand (en energielabel) in een bepaald gebied kunnen zoeken |
  | [370](https://github.com/VNG-Realisatie/Haal-Centraal-BAG-bevragen/issues/370) | Http status code 415 voor fout "Coördinatenstelsel {crs} in Content-Crs wordt niet ondersteund." incorrect |
  | [404](https://github.com/VNG-Realisatie/Haal-Centraal-BAG-bevragen/issues/404) | Als gebruikers van de API wil ik exact kunnen zoeken zoeken op postcode en huisnummer |


## Versie 1.2.0 (22-06-2021)
In deze release zijn enkele bugs in productie opgelost. Tevens zijn er enkele wijzigingen aan de API-specificaties en de feature-files aangebracht.
Er worden nu adresregels geleverd met daarin het samengestelde adres.
De Header Content-Crs is voorzien van een default waarde.
Op /adressen worden de resultaten gesorteerd geretourneerd.  

### Opgeloste issues

  | Link Github	| Beschrijving |
  | --- | --- |
  | [234](https://github.com/VNG-Realisatie/Haal-Centraal-BAG-bevragen/issues/234) | gebruik relatieve urls voor interne links |
  | [293](https://github.com/VNG-Realisatie/Haal-Centraal-BAG-bevragen/issues/293) | Expand gerelateerde resource als relatie in onderzoek is |
  | [294](https://github.com/VNG-Realisatie/Haal-Centraal-BAG-bevragen/issues/294) | Als gebruiker (nader te bepalen) wil ik de inhoud van de mogelijkOnjuist gegevensgroep kunnen filteren |
  | [309](https://github.com/VNG-Realisatie/Haal-Centraal-BAG-bevragen/issues/309) | wijzigen description zoekparameter zoekresultaat get/adressen/zoek e.a. |
  | [338](https://github.com/VNG-Realisatie/Haal-Centraal-BAG-bevragen/issues/338) | Underscores verwijderen uit componentnamen en enumeratienamen. |
  | [343](https://github.com/VNG-Realisatie/Haal-Centraal-BAG-bevragen/issues/343) | Gebruiker mag niet worden verplicht om Accept-Crs te definieren |\
  | [360](https://github.com/VNG-Realisatie/Haal-Centraal-BAG-bevragen/issues/360) | Als gebruiker wil ik het samengesteld adres krijgen |  
  | [363](https://github.com/VNG-Realisatie/Haal-Centraal-BAG-bevragen/issues/363) | als developer van de BRK API wil ik de korteNaam kunnen leveren bij het adres van een kadastraal object |  
  | [364](https://github.com/VNG-Realisatie/Haal-Centraal-BAG-bevragen/issues/364) | toevoegen controle op minimale en maximale lengte invoer zoek |  
  | [371](https://github.com/VNG-Realisatie/Haal-Centraal-BAG-bevragen/issues/371) | Is Content-Crs noodzakelijk bij bevraging van panden endpoint |


## Versie 1.1.1 (03-03-2021)
In deze release zijn enkele bugs in productie opgelost. Er zijn geen wijzigingen gedaan aan de API specificaties.

  | Link Github	| Beschrijving |
  | --- | --- |
  | [340](https://github.com/VNG-Realisatie/Haal-Centraal-BAG-bevragen/issues/340) | Links geven http in plaats van https |
  | [376](https://github.com/VNG-Realisatie/Haal-Centraal-BAG-bevragen/issues/376) | last link verwijst niet naar de laatste pagina |



## Versie 1.1.0 (16-09-2020)

  In deze release is functionaliteit toegevoegd voor het raadplegen van een adres op basis van de adresseerbaar object identificatie ([307](https://github.com/VNG-Realisatie/Haal-Centraal-BAG-bevragen/issues/307)), en voor het zoeken van panden op basis van de nummeraanduiding identificatie ([271](https://github.com/VNG-Realisatie/Haal-Centraal-BAG-bevragen/issues/271)).

### Opgeloste issues
  De volgende issues zijn in deze release opgelost.

  | Link Github	| Beschrijving |
  | --- | --- |
  | [305](https://github.com/VNG-Realisatie/Haal-Centraal-BAG-bevragen/issues/305) | Juiste foutmelding bij niet-toegestane combinatie van queryparameters |
  | [308](https://github.com/VNG-Realisatie/Haal-Centraal-BAG-bevragen/issues/308) | Toelichtingen bij mogelijkOnjuist |
  | [310](https://github.com/VNG-Realisatie/Haal-Centraal-BAG-bevragen/issues/310) | Pagination headers niet correct |
  | [320](https://github.com/VNG-Realisatie/Haal-Centraal-BAG-bevragen/issues/320)	| Controle Accept-Crs nauwkeuriger maken bij vragen specifieke velden uit een gerelateerde resource met de expand parameter |


### Known issues
  De volgende issues staan nog open, oplossing volgt in een latere versie:

  | Link Github	| Beschrijving |
  | --- | --- | --- |






## Versie 1.0.0 (12-08-2020)

  De OpenAPI Specificatie (v3) van de Huidige bevragingen API is te vinden via de volgende URL:
  https://api.bag.kadaster.nl/esd/huidigebevragingen/v1/openapi.yaml

  Hieronder staan de endpoints die op dit moment te benaderen zijn. Verdere details staan in de specificatie.
  -	/adressen/zoek
  -	/adressen
  -	/adressen/{nummeraanduidingidentificatie}
  -	/adresseerbareobjecten/{adresseerbaarobjectidentificatie}
  -	/adresseerbareobjecten
  -	/woonplaatsen/{woonplaatsidentificatie}:
  -	/openbareruimten/{openbareruimteidentificatie}
  -	/nummeraanduidingen/{nummeraanduidingidentificatie}
  -	/panden/{pandidentificatie}
  -	/panden

### Known issues
  De volgende functionaliteiten zijn nog niet beschikbaar, dit volgt in een latere versie:

  | Link Github	| Beschrijving |
  | --- | --- |
  | [307](https://github.com/VNG-Realisatie/Haal-Centraal-BAG-bevragen/issues/307) | Adres bevragen met adresseerbaarobject-identificatie |
  | [271](https://github.com/VNG-Realisatie/Haal-Centraal-BAG-bevragen/issues/271) | Panden bevragen met nummeraanduiding-identificatie |
  | [288](https://github.com/VNG-Realisatie/Haal-Centraal-BAG-bevragen/issues/288) | Toelichtingen bij de "mogelijk onjuist" |
  | [23](https://github.com/VNG-Realisatie/Haal-Centraal-BAG-bevragen/issues/23) [305](https://github.com/VNG-Realisatie/Haal-Centraal-BAG-bevragen/issues/305) | Uitbreiding foutafhandeling zodat foutmeldingen consequent zijn over alle Haal Centraal API’s |
  | -	| Opvragen nummeraanduiding die niet gekoppeld is aan een verblijfsobject|
  | -	| Controle Accept-Crs nauwkeuriger maken bij vragen specifieke velden uit een gerelateerde resource met de expand parameter |
  | [265](https://github.com/VNG-Realisatie/Haal-Centraal-BAG-bevragen/issues/265) | Via fields-parameter opvragen van link zonder "\_links" toe te voegen |
  | [234](https://github.com/VNG-Realisatie/Haal-Centraal-BAG-bevragen/issues/234) | Interne URL’s in de response worden relatief (zijn nu allemaal absolute links) |
  | [310](https://github.com/VNG-Realisatie/Haal-Centraal-BAG-bevragen/issues/310) | Pagination headers niet correct |
