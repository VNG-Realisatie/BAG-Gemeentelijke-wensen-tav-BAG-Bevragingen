# Release notes BAG Huidige bevragingen API

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
  De volgende functionaliteiten zijn nog niet beschikbaar, dit volgt in een latere versie:

  | Link Github	| Beschrijving |
  | --- | --- |
  | -	| Opvragen nummeraanduiding die niet gekoppeld is aan een verblijfsobject|
  | [234](https://github.com/VNG-Realisatie/Haal-Centraal-BAG-bevragen/issues/234) | Interne URL’s in de response worden relatief (zijn nu allemaal absolute links) |
  | [265](https://github.com/VNG-Realisatie/Haal-Centraal-BAG-bevragen/issues/265) | Via fields-parameter opvragen van link zonder "\_links" toe te voegen |
  | [293](https://github.com/VNG-Realisatie/Haal-Centraal-BAG-bevragen/issues/293) | Communiceren dat een relatie mogelijk onjuist is bij het met fields vragen om _links of met expand vragen om de gerelateerde resource |


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
