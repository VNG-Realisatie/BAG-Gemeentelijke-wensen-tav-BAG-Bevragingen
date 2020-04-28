# Haal Centraal BAG bevragen

## Planning
https://eu-rm.roadmunk.com/publish/29a13c572a0dfc79f1d0386fc572e15383afe11f

## APIlab-specificatie 26-03-2020
* De openapi.yaml voor het apilab op 26-03-2020 is [hier](./api-specificatie/resolved/openapi.yaml) te vinden. en in [Swagger-formaat](https://petstore.swagger.io/?url=https://raw.githubusercontent.com/VNG-Realisatie/Haal-Centraal-BAG-Bevragen/master/api-specificatie/resolved/openapi.yaml)

## Introductie
Doel van het programma Haal Centraal is om de verstrekking van basisgegevens aan binnengemeentelijke afnemers te outsourcen naar Landelijke Registraties (RvIG, Kadaster, KVK). Dit moet leiden tot een forse reductie van lokale kopieën bij gemeenten.

Haal Centraal wil voor iedere activiteit op een lokale kopie een Haal Centraal alternatief te bieden in de vorm van een API.

### Toegevoegde waarde voor gemeenten
- sneller aansluiten afnemers
- goedkoper aansluiten afnemers (besparing x aantal binnengemeentelijke aansluiters x 355 gemeenten)
- lagere investeringen (geen lokale kopie/ gegevensmagazijn)
- lagere beheerkosten (geen gegevensbeheer lokale kopieën)
- hogere ROI: hergebruik API Landelijke Registratie door alle gemeenten
- betere technologie-business alignment (Landelijke Registratie voert sneller een wijziging door dan 355 afzonderlijke gemeenten)
- meer focus op de businessvraag van afnemers (i.p.v. op betrouwbaarheid etc. lokale kopieën)
- maximale compliancy op de gemeentelijke softwaremarkt (aansluiting gemeente x = 100% herbruikbaar in gemeente y)

### Toegevoegde waarde voor leveranciers
- leveranciers kunnen zich richten op het bieden van toegevoegde waarde voor burgers, bedrijven en medewerkers i.p.v. plumbing concerns.

## Context
Haal Centraal is een G5 initiatief (Amsterdam, Rotterdam, Den Haag, Utrecht en Eindhoven). Het concept is getoetst in de BRK pilot van de gemeente Den Haag met het Kadaster op basis van de RSGB bevragingen standaard (voorloper BRP- en BRK-bevragen). De businesscase is gebaseerd op ervaringscijfers van de gemeente Den Haag en de softwareontwikkeling gedurende de pilot.

## BAG bevragen
Deze repository bevat alle info over de ontwikkeling van de Haal Centraal BAG bevragen API.

## Technische specificaties

* [Technische specificaties van zoeken en ophalen van een ADRES met gerelateerde BAG-objecten](https://github.com/VNG-Realisatie/Haal-Centraal-BAG-Bevragen/tree/master/api-specificatie/) (Open API Specificaties en JSON schema) en in [Swagger-formaat](https://petstore.swagger.io/?url=https://raw.githubusercontent.com/VNG-Realisatie/Haal-Centraal-BAG-Bevragen/master/api-specificatie/openapi.yaml)

## Licentie
Copyright &copy; VNG Realisatie 2018
Licensed under the [EUPL](https://github.com/VNG-Realisatie/Haal-Centraal-BAG-bevragen/blob/master/LICENCE.md)
