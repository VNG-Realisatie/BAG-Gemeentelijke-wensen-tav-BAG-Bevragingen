# Haal Centraal BAG Huidige Bevragingen v1.1 is live!
BAG Huidige bevragingen is een Haal Centraal API voor het zoeken en raadplegen van gegevens in de basisregistratie Adressen en Gebouwen voor alle binnengemeentelijke afnemers in NL, maar ook voor waterschappen, belastingsamenwerkingen en andere overheden.
We doen ons uiterste best om de API evolvable door te ontwikkelen en geen breaking changes te introduceren.

## Getting started
Wil je een aansluiting ontwikkelen? Dan is de [getting started](./docs/getting-started.md) een goed begin.
Meld je aan bij het kadaster [om aan te sluiten](https://formulieren.kadaster.nl/aanvraag_bag_api_huidige_bevragingen_productie), of voor [toegang tot de testomgeving](
https://formulieren.kadaster.nl/aanvraag_bag_api_huidige_bevragingen_test).

## Planning
https://eu-rm.roadmunk.com/publish/4ac89376551785bace5e22f09c8247f307e1c061

## Introductie
Doel van het programma Haal Centraal is om de verstrekking van basisgegevens aan binnengemeentelijke afnemers te outsourcen naar Landelijke Registraties (RvIG, Kadaster, KVK). Dit moet leiden tot een forse reductie van lokale kopieën bij gemeenten.

Haal Centraal wil voor iedere activiteit op een lokale kopie een Haal Centraal alternatief te bieden in de vorm van een API.

### Toegevoegde waarde voor gemeenten
- sneller & goedkoper aansluiten door best mogelijke DX
- lagere investeringen (geen lokale kopie/ gegevensmagazijn)
- lagere beheerkosten (geen beheer lokale kopieën)
- hogere ROI: hergebruik API Landelijke Registratie door alle gemeentelijke taakapplicaties
- betere technologie-business alignment (Landelijke Registratie voert sneller een wijziging door dan 355 afzonderlijke gemeenten)
- biedt ruimte voor focus op de businessvraag van afnemers (i.p.v. op betrouwbaarheid en actualiteit van lokale kopieën)
- maximale compliancy op de gemeentelijke softwaremarkt (aansluiting gemeente x = 100% herbruikbaar in gemeente y)

### Toegevoegde waarde voor leveranciers
- leveranciers kunnen zich richten op het bieden van toegevoegde waarde voor burgers, bedrijven en medewerkers en hun core domain i.p.v. plumbing concerns in supporting domains zoals het gebruik van basisgegevens.

## Context
Haal Centraal is een G5 initiatief (Amsterdam, Rotterdam, Den Haag, Utrecht en Eindhoven). Het concept is getoetst in de BRK pilot van de gemeente Den Haag met het Kadaster op basis van de RSGB bevragingen standaard (voorloper Haal Centraal API's). De businesscase is gebaseerd op ervaringscijfers van de gemeente Den Haag en de softwareontwikkeling gedurende de pilot.

## BAG Huidige Bevragingen
Deze repository bevat alle info over de ontwikkeling van de Haal Centraal BAG Huidige Bevragingen API.

## Technische specificaties

* [Technische specificaties van zoeken en ophalen van een ADRES met gerelateerde BAG-objecten](https://github.com/VNG-Realisatie/Haal-Centraal-BAG-Bevragen/tree/master/specificatie/) (Open API Specificaties en JSON schema) en in [Swagger-formaat](https://petstore.swagger.io/?url=https://raw.githubusercontent.com/VNG-Realisatie/Haal-Centraal-BAG-Bevragen/master/specificatie/openapi.yaml)

## Release notes
* [Release notes BAG Huidige bevragingen API versie 1.1.0](./releasenotes.md)

## Licentie
Copyright &copy; VNG Realisatie 2018
Licensed under the [EUPL](./docs/LICENCE.md)
