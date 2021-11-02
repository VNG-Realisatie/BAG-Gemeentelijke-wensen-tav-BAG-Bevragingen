# language: nl

Functionaliteit: Als gebruiker wil ik met een geometrie (punt, bounding box) kunnen zoeken naar resources, 
                 zodat ik gericht vervolgstappen kan definiëren m.b.t. de gevonden resources.

    De resources waarvan de geometrie tenminste één punt gemeenschappelijk hebben met de opgegeven geometrie worden geretourneerd.

    Bij het bepalen of een resource geometrie binnen de opgegeven contour ligt (bbox of polygoon) of 
    dat een opgegeven geometrie (punt) binnen de resource geometrie ligt, wordt een intersects spatial operator gebruikt.

    Intersects:
    Om te bepalen of een geometrie A binnen een geometrie B ligt, deze raakt, kruist of (deels) overlapt, wordt gebruik gemaakt van de spatial operator INTERSECTS:

      intersects(geometrie A, geometrie B)

    Intersects betekent dat geometrie A en geometrie B tenminste één gemeenschappelijk punt hebben.
    Anders gezegd geometrie A en geometrie B mogen niet volledig los van elkaar staan.
    Het resultaat van intersects(geometrie A, geometrie B) levert hetzelfde op als intersects(geometrie B, geometrie A).
    Het maakt niet uit of geometrie A of geometrie B de geometrie is waarmee gezocht wordt en
    het maakt niet uit of geometrie A of geometrie B de resource geometrie is.
    Als intersects true oplevert, dan wordt de resource waar de geometrie onderdeel van is, geretourneerd.

    Referenties:
    - Haal Centraal Common - foutafhandeling.feature
    
    Het geometrisch zoeken met een bounding box geometrie kan met de parameter: bbox.
    
    Het geometrisch zoeken met een polygoon geometrie kan met de parameter: polygoon.

    Het geometrisch zoeken met een punt geometrie kan met de parameter: locatie.
    Het is echter ook mogelijk om een bounding box op te geven waarbij de coördinaten van de linker onderhoek en de rechter bovenhoek exact gelijk zijn.

    In de hierna volgende voorbeelden is een vereenvoudigde representatie gebruikt voor coördinaten.
    
    ![Zoeken met locatie voorbeelden](../images/locatie-voorbeelden.png)    
    ![Zoeken met bounding box voorbeelden](../images/bbox-voorbeelden.png)    
    ![Zoeken met polygoon voorbeelden](../images/locatie-voorbeelden.png)      

  Achtergrond:

    Gegeven de volgende verzameling van objecten

    | identificatie | geometrie                          |
    |---------------|------------------------------------|
    | 0001          | (0,0),   (10,0),  (10,10), (0,10)  |
    | 0002          | (12,0),  (22,0),  (22,10), (12,10) |
    | 0003          | (12,12), (22,12), (22,22), (12,22) |
    | 0004          | (0,8),   (10,8),  (10,18), (0,18)  |
    
  Scenario: GET met locatie, Content-Crs (optioneel) en Accept-Crs (optioneel) één resource
  
    Als er met de volgende parameters wordt gezocht:
    | locatie | Content-Crs | Accept-Crs |
    |---------|-------------|------------|
    | (5,5)   | -           | -          |
    | (5,5)   | EPSG:28992  | -          |
    | (5,5)   | -           | EPSG:28992 |
    | (5,5)   | EPSG:28992  | EPSG:28992 |
    | (10,5)  | -           | -          |
    | (10,5)  | EPSG:28992  | -          |
    | (10,5)  | -           | EPSG:28992 |
    | (10,5)  | EPSG:28992  | EPSG:28992 |
    En de provider ondersteund het CRS in Content-Crs
    En de provicer ondersteund het CRS in Accept-Crs
    En de resource geometrie intersects met de opgegeven bounding box geometrie
    Dan bevat het resultaat de volgende objecten:
    | identificatie | geometrie                      |
    |---------------|--------------------------------| 
    | 0001          | (0,0), (10,0), (10,10), (0,10) |

    Bijvoorbeeld:
      /panden?locatie=5,5

  Scenario: GET met locatie, Content-Crs (optioneel) en Accept-Crs (optioneel) meerdere resources
  
    Als er met de volgende parameters wordt gezocht:
    | locatie | Content-Crs | Accept-Crs |
    |---------|-------------|------------|
    | (5,9)   | -           | -          |
    | (5,9)   | EPSG:28992  | -          |
    | (5,9)   | -           | EPSG:28992 |
    | (5,9)   | EPSG:28992  | EPSG:28992 |
    En de provider ondersteund het CRS in Content-Crs
    En de provicer ondersteund het CRS in Accept-Crs
    En de resource geometrie intersects met de opgegeven bounding box geometrie
    Dan bevat het resultaat de volgende objecten:
    | identificatie | geometrie                    
    |---------------|--------------------------------| 
    | 0001          | (0,0), (10,0), (10,10), (0,10) |
    | 0004          | (0,8), (10,8), (10,18), (0,18) |

    Bijvoorbeeld:
      /panden?locatie=5,9

  Scenario: GET met locatie, Content-Crs (optioneel) en Accept-Crs (optioneel) geen resources
  
    Als er met de volgende parameters wordt gezocht:
    | locatie | Content-Crs | Accept-Crs |
    |---------|-------------|------------|
    | (11,11) | -           | -          |
    | (11,11) | EPSG:28992  | -          |
    | (11,11) | -           | EPSG:28992 |
    | (11,11) | EPSG:28992  | EPSG:28992 |
    En de provider ondersteund het CRS in Content-Crs
    En de provicer ondersteund het CRS in Accept-Crs
    En de resource geometrie intersects met de opgegeven bounding box geometrie
    Dan bevat het resultaat geen objecten

    Bijvoorbeeld:
      /panden?locatie=11,11


  Scenario: GET met bounding box, Content-Crs (optioneel) en Accept-Crs (optioneel) één resource
  
    Als er met de volgende parameters wordt gezocht:
    | bbox           | Content-Crs | Accept-Crs |
    |----------------|-------------|------------|
    | (14,2),(18,6)  | -           | -          |
    | (14,2),(18,6)  | EPSG:28992  | -          |
    | (14,2),(18,6)  | -           | EPSG:28992 |
    | (14,2),(18,6)  | EPSG:28992  | EPSG:28992 |
    | (20,2),(24,6)  | -           | -          |
    | (20,2),(24,6)  | EPSG:28992  | -          |
    | (20,2),(24,6)  | -           | EPSG:28992 |
    | (20,2),(24,6)  | EPSG:28992  | EPSG:28992 |
    | (20,7),(24,11) | -           | -          |
    | (20,7),(24,11) | EPSG:28992  | -          |
    | (20,7),(24,11) | -           | EPSG:28992 |
    | (20,7),(24,11) | EPSG:28992  | EPSG:28992 |
    En de provider ondersteund het CRS in Content-Crs
    En de provicer ondersteund het CRS in Accept-Crs
    En de resource geometrie intersects met de opgegeven bounding box geometrie
    Dan bevat het resultaat de volgende objecten:
    | identificatie | geometrie                        |
    |---------------|----------------------------------| 
    | 0002          | (12,0), (22,0), (22,10), (12,10) |

    Bijvoorbeeld:
      /panden?bbox=20,2,24,6

  Scenario: GET met bounding box, Content-Crs (optioneel) en Accept-Crs (optioneel) meerdere resources
  
    Als er met de volgende parameters wordt gezocht:
    | bbox          | Content-Crs | Accept-Crs |
    |---------------|-------------|------------|
    | (9,9),(13,13) | -           | -          |
    | (9,9),(13,13) | EPSG:28992  | -          |
    | (9,9),(13,13) | -           | EPSG:28992 |
    | (9,9),(13,13) | EPSG:28992  | EPSG:28992 |
    En de provider ondersteund het CRS in Content-Crs
    En de provicer ondersteund het CRS in Accept-Crs
    En de resource geometrie intersects met de opgegeven bounding box geometrie
    Dan bevat het resultaat de volgende objecten:
    | identificatie | geometrie                          |
    |---------------|------------------------------------|
    | 0001          | (0,0),   (10,0),  (10,10), (0,10)  |
    | 0002          | (12,0),  (22,0),  (22,10), (12,10) |
    | 0003          | (12,12), (22,12), (22,22), (12,22) |
    | 0004          | (0,8),   (10,8),  (10,18), (0,18)  |

    Bijvoorbeeld:
      /panden?bbox=9,9,13,13

  Scenario: GET met bounding box, Content-Crs (optioneel) en Accept-Crs (optioneel) gelijke coördinaten
  
    Als er met de volgende parameters wordt gezocht:
    | bbox        | Content-Crs | Accept-Crs |
    |-------------|-------------|------------|
    | (5,5),(5,5) | -           | -          |
    | (5,5),(5,5) | EPSG:28992  | -          |
    | (5,5),(5,5) | -           | EPSG:28992 |
    | (5,5),(5,5) | EPSG:28992  | EPSG:28992 |
    En de provider ondersteund het CRS in Content-Crs
    En de provicer ondersteund het CRS in Accept-Crs
    En de resource geometrie intersects met de opgegeven bounding box geometrie
    Dan bevat het resultaat de volgende objecten:
    | identificatie | geometrie                      |
    |---------------|--------------------------------| 
    | 0001          | (0,0), (10,0), (10,10), (0,10) |
    En is het resultaat hetzelfde wanneer er bij het endpoint /panden?locatie=<coördinaat> dezelfde coördinaat wordt opgegeven

    Bijvoorbeeld:
      /panden?bbox=5,5,5,5

  Scenario: GET met bounding box, Content-Crs (optioneel) en Accept-Crs (optioneel) geen resources
  
    Als er met de volgende parameters wordt gezocht:
    | bbox          | Content-Crs | Accept-Crs |
    |---------------|-------------|------------|
    | (2,20),(6,24) | -           | -          |
    | (2,20),(6,24) | EPSG:28992  | -          |
    | (2,20),(6,24) | -           | EPSG:28992 |
    | (2,20),(6,24) | EPSG:28992  | EPSG:28992 |
    En de provider ondersteund het CRS in Content-Crs
    En de provicer ondersteund het CRS in Accept-Crs
    En de resource geometrie intersects niet met de opgegeven bounding box geometrie
    Dan bevat het resultaat geen objecten

    Bijvoorbeeld:
      /panden?bbox=2,20,6,24


  Scenario: POST met polygoon, Content-Crs (optioneel) en Accept-Crs (optioneel) één resource
  
    Als er met de volgende parameters wordt gezocht:
    | polygoon                                     | Content-Crs | Accept-Crs |
    |----------------------------------------------|-------------|------------|
    | (13,3),(21,1),(21,6),(17,8),(17,5),(13,3)    | -           | -          |
    | (13,3),(21,1),(21,6),(17,8),(17,5),(13,3)    | EPSG:28992  | -          |
    | (13,3),(21,1),(21,6),(17,8),(17,5),(13,3)    | -           | EPSG:28992 |
    | (13,3),(21,1),(21,6),(17,8),(17,5),(13,3)    | EPSG:28992  | EPSG:28992 |
    | (22,2),(30,0),(30,5),(26,7),(26,4),(22,2)    | -           | -          |
    | (22,2),(30,0),(30,5),(26,7),(26,4),(22,2)    | EPSG:28992  | -          |
    | (22,2),(30,0),(30,5),(26,7),(26,4),(22,2)    | -           | EPSG:28992 |
    | (22,2),(30,0),(30,5),(26,7),(26,4),(22,2)    | EPSG:28992  | EPSG:28992 |
    | (20,9),(28,7),(28,12),(24,14),(24,11),(20,9) | -           | -          |
    | (20,9),(28,7),(28,12),(24,14),(24,11),(20,9) | EPSG:28992  | -          |
    | (20,9),(28,7),(28,12),(24,14),(24,11),(20,9) | -           | EPSG:28992 |
    | (20,9),(28,7),(28,12),(24,14),(24,11),(20,9) | EPSG:28992  | EPSG:28992 |
    En de provider ondersteund het CRS in Content-Crs
    En de provicer ondersteund het CRS in Accept-Crs
    En de resource geometrie intersects met de opgegeven bounding box geometrie
    Dan bevat het resultaat de volgende objecten:
    | identificatie | geometrie                        |
    |---------------|----------------------------------| 
    | 0002          | (12,0), (22,0), (22,10), (12,10) |

    Bijvoorbeeld:
      /panden
      Request body:
      {
        "geometrie": {
          "intersects": "POLYGON ((20 9,28 7,28 12,24 14,24 11,20 9))"
        }
      }

  Scenario: POST met polygoon, Content-Crs (optioneel) en Accept-Crs (optioneel) meerdere resources
  
    Als er met de volgende parameters wordt gezocht:
    | polygoon                                   | Content-Crs | Accept-Crs |
    |--------------------------------------------|-------------|------------|
    | (7,9),(15,7),(15,12),(11,13),(11,11),(7,9) | -           | -          |
    | (7,9),(15,7),(15,12),(11,13),(11,11),(7,9) | EPSG:28992  | -          |
    | (7,9),(15,7),(15,12),(11,13),(11,11),(7,9) | -           | EPSG:28992 |
    | (7,9),(15,7),(15,12),(11,13),(11,11),(7,9) | EPSG:28992  | EPSG:28992 |
    En de provider ondersteund het CRS in Content-Crs
    En de provicer ondersteund het CRS in Accept-Crs
    En de resource geometrie intersects met de opgegeven bounding box geometrie
    Dan bevat het resultaat de volgende objecten:
    | identificatie | geometrie                          |
    |---------------|------------------------------------|
    | 0001          | (0,0),   (10,0),  (10,10), (0,10)  |
    | 0002          | (12,0),  (22,0),  (22,10), (12,10) |
    | 0003          | (12,12), (22,12), (22,22), (12,22) |
    | 0004          | (0,8),   (10,8),  (10,18), (0,18)  |

    Bijvoorbeeld:
      /panden
      Request body:
      {
        "geometrie": {
          "intersects": "POLYGON ((7 9,15 7,15 12,11 13,11 11,7 9))"
        }
      }

  Scenario: POST met polygoon, Content-Crs (optioneel) en Accept-Crs (optioneel) geen resources
  
    Als er met de volgende parameters wordt gezocht:
    | polygoon                                  | Content-Crs | Accept-Crs |
    |-------------------------------------------|-------------|------------|
    | (1,21),(9,19),(9,24),(5,26),(5,23),(1,21) | -           | -          |
    | (1,21),(9,19),(9,24),(5,26),(5,23),(1,21) | EPSG:28992  | -          |
    | (1,21),(9,19),(9,24),(5,26),(5,23),(1,21) | -           | EPSG:28992 |
    | (1,21),(9,19),(9,24),(5,26),(5,23),(1,21) | EPSG:28992  | EPSG:28992 |
    En de provider ondersteund het CRS in Content-Crs
    En de provicer ondersteund het CRS in Accept-Crs
    En de resource geometrie intersects niet met de opgegeven bounding box geometrie
    Dan bevat het resultaat geen objecten

    Bijvoorbeeld:
      /panden
      Request body:
      {
        "geometrie": {
          "intersects": "POLYGON ((1 21,9 19,9 24,5 26,5 23,1 21))"
        }
      }


  Scenario: GET met geometrie en niet ondersteunde Content-Crs
  
    Als er met de volgende parameters wordt gezocht:
    | geometrie                                  | Content-Crs | Accept-Crs |
    |--------------------------------------------|-------------|------------|
    | (5,9)                                      | EPSG:4326   | -          |
    | (5,9)                                      | EPSG:4326   | EPSG:28992 |
    | (9,9),(13,13)                              | EPSG:4326   | -          |
    | (9,9),(13,13)                              | EPSG:4326   | EPSG:28992 |
    | (7,9),(15,7),(15,12),(11,13),(11,11),(7,9) | EPSG:4326   | -          |
    | (7,9),(15,7),(15,12),(11,13),(11,11),(7,9) | EPSG:4326   | EPSG:28992 |
    En de provider ondersteund het CRS in Content-Crs niet
    En de provicer ondersteund het CRS in Accept-Crs
    Dan worden er een 400 crsNotSupported foutmelding geretourneerd
    En dan bevat de Accept-Crs de door de provider ondersteunde CRS-en
  
  Scenario: GET met geometrie en niet ondersteunde Accept-Crs
  
    Als er met de volgende parameters wordt gezocht:
    | geometrie                                  | Content-Crs | Accept-Crs |
    |--------------------------------------------|-------------|------------|
    | (5,9)                                      | -           | EPSG:4326  |
    | (5,9)                                      | EPSG:28992  | EPSG:4326  |
    | (9,9),(13,13)                              | -           | EPSG:4326  |
    | (9,9),(13,13)                              | EPSG:28992  | EPSG:4326  |
    | (7,9),(15,7),(15,12),(11,13),(11,11),(7,9) | -           | EPSG:4326  |
    | (7,9),(15,7),(15,12),(11,13),(11,11),(7,9) | EPSG:28992  | EPSG:4326  |
    En de provider ondersteund het CRS in Content-Crs
    En de provicer ondersteund het CRS in Accept-Crs niet
    Dan worden er een 406 crsNotAcceptable foutmelding geretourneerd
    En dan bevat de Accept-Crs de door de provider ondersteunde CRS-en

  Scenario: GET met geometrie anders dan Content-Crs (optioneel) en Accept-Crs (optionee)
  
    Als er met coördinaten wordt gezocht die niet overeenkomen met het CRS in Content-Crs
    En de provider ondersteund het CRS in Content-Crs
    En de provicer ondersteund het CRS in Accept-Crs
    Dan worden er een 400 paramsValidation foutmelding geretourneerd
