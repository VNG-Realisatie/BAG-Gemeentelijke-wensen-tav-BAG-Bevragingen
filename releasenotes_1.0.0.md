# Release notes BAG Huidige bevragingen API versie 1.0.0 (12-08-2020)

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

  ## Known issues
  De volgende functionaliteiten zijn nog niet beschikbaar, dit volgt in een latere versie:

  | Link Github	| Beschrijving |
  | [307](https://github.com/VNG-Realisatie/Haal-Centraal-BAG-bevragen/issues/307) | Adres bevragen met adresseerbaarobject-identificatie |
  | [271](https://github.com/VNG-Realisatie/Haal-Centraal-BAG-bevragen/issues/271) | Panden bevragen met nummeraanduiding-identificatie |
  | [288](https://github.com/VNG-Realisatie/Haal-Centraal-BAG-bevragen/issues/288) | Toelichtingen bij de "mogelijk onjuist" |
  | [23](https://github.com/VNG-Realisatie/Haal-Centraal-BAG-bevragen/issues/23) [305](https://github.com/VNG-Realisatie/Haal-Centraal-BAG-bevragen/issues/305) | Uitbreiding foutafhandeling zodat foutmeldingen consequent zijn over alle Haal Centraal API’s |
  | -	| Opvragen nummeraanduiding die niet gekoppeld is aan een verblijfsobject|
  | -	| Controle Accept-Crs nauwkeuriger maken bij vragen specifieke velden uit een gerelateerde resource met de expand parameter |
  | [265](https://github.com/VNG-Realisatie/Haal-Centraal-BAG-bevragen/issues/265) | Via fields-parameter opvragen van link zonder "\_links" toe te voegen |
  | [234](https://github.com/VNG-Realisatie/Haal-Centraal-BAG-bevragen/issues/234) | Interne URL’s in de response worden relatief (zijn nu allemaal absolute links) |
  | [310](https://github.com/VNG-Realisatie/Haal-Centraal-BAG-bevragen/issues/310) | Pagination headers niet correct |
