# Design decisions HaalCentraal BAG-Bevragen
Dit document beschrijft ontwerpkeuzes die gemaakt zijn voor het ontwerpen en specificeren van de API's. .

## Algemene Design Decisions
In het document [design_desicions.md](https://github.com/VNG-Realisatie/Haal-Centraal-common/blob/master/docs/design_decisions.md) dat in de Haal-Centraal-common repository is opgenomen staan beslissingen opgesomd waar alle Haal Centraal API's zich aan conformeren.

## Specifieke beslissingen t.a.v. de API BAG-Bevragen zijn hieronder vermeld.

## Resource Adres 
De resource adres wordt samengesteld uit de resources nummeraanduiding, openbare ruimte en de woonplaats. Er worden vanuit de aangeboden resource adres links aangeboden naar de resources waaruit dit adres is samengesteld en links naar gerelateerde panden en adresseerbare objecten. 

## TypeAdresseerbaarObject is uit nummeraanduiding verwijderd

## De weergavenaam uit de zoek-functie wordt opgesteld conform de logica die nu door de locatieserver wordt gehanteerd. 

## We gaan het zoeken restfull invulling geven. 
De logica van de locatieserver wordt achter de schermen afgehandeld. Op basis van een zoekstring worden suggesties gedaan en op basis van de geselecteerde zoeksuggestie wordt met de zoekresultatidentificatie wordt een adres (via /adressen) opgehaald met daarbij in de links weer de nummeraanduiding-id en de adresseerbaarobjectidentificatie aangeboden. 

Zorg ook dat dit voldoet aan de eisen die we aan HAL stellen. 

## We nemen de velden die door de provider ALTIJD (en onconditioneel) geleverd worden op als required. 

Sommige properties worden altijd geleverd door het Kadaster. De elementen die dat betreft worden 
opgenomen als required in de OAS zodat consumers zich daar ook bewust van zijn. 

In de fields parameter wordt het gedrag van verplicht meeleveren van gegevens door de provider beschreven.
Bij het endpoint wordt beschreven welke gegevens (of combinatie van -) verplicht worden geleverd door de  provider.

*Ratio*
Voor sommige properties geldt dat het Kadaster die altijd moet leveren.

## Gebruik headers acceptCrs en contenCrs en parameter accepCrs !!VOORSTEL!!
ALs parameter is acceptCrs geïmplementeerd en als header is de contentCRS gedefinieerd. Er zijn geen defaultwaardes en enumeraties gedefinieerd om toekomstige breakings changes te voorkomen. 
LVBAG ondersteunt alleen EPSG:28992  Dit moet in de descriptions toegelicht worden.

## InOnderzoek van adres moet op object niveau niet op attribuut niveau 
1 boolean op adres niveau gedefinieerd.
Als ‘let op’, niet als aggregatie. De betekenis/description is: let op, er is sprake van dat er iets in onderzoek is, wil je weten welke, zie de HaL-link.

## Objecten bevatten lijsten van attributen die in onderzoek kunnen zijn
Deze lijsten van properies krijgen de naam ....MogelijkOnjuist  (bv. woonplaatsnaamMogelijkOnjuist)
Deze indicaties hebben de rol om de consumer te attenderen op het feit dat er mogelijk iets in onderzoek is en niet om de exact juiste "Inonderzoek" gegevens te communiceren. Als de consumer dat wil weten moet de de daarvoor bestemde endpoint bevraagd worden. 

## Alleen inonderzoek info over huidige statussen 




