# language: nl

Functionaliteit: Als gebruiker wil ik een pand kunnen zoeken op locatiecoördinaten
    Zodat ik gegevens over het pand kan raadplegen door op het pand in een kaart te klikken 


Rule: De standaardwaarde voor het coördinatenstelsel (CRS) voor de locatieparameter is Rijksdriehoekscoördinaten New Nederlands

    Scenario: zoek op locatie zonder het coördinatenstelsel aan te geven
        Gegeven het pand met identificatie "0826100000036343" heeft de volgende geometrie polygoon coördinaten
        | geometriecoördinaten                                                                                                        |
        | [ [118315.606,404844.967],[118324.183,404843.509],[118325.179,404849.365],[118316.604,404850.835],[118315.606,404844.967] ] |
        Als met "GET" "/panden?locatie=118320,404848" wordt gezocht zonder requestheader "Content-Crs"
        Dan bevat het resultaat het pand met identificatie "0826100000036343"

    Scenario: zoek op locatie met het coördinatenstelsel dat je gebruikt in de locatieparameter
        Gegeven het pand met identificatie "0826100000036343" heeft de volgende geometrie polygoon coördinaten
        | geometriecoördinaten                                                                                                        |
        | [ [118315.606,404844.967],[118324.183,404843.509],[118325.179,404849.365],[118316.604,404850.835],[118315.606,404844.967] ] |
        Als met "GET" "/panden?locatie=118320,404848" wordt gezocht met requestheader "Content-Crs" met waarde "epsg:28992"
        Dan bevat het resultaat het pand met identificatie "0826100000036343"

Rule: Pand wordt gevonden wanneer de coördinaat van de locatieparameter binnen de pandgeometrie valt

    Scenario: coördinaat locatie valt binnen geometrievlak van gezochte pand
        Gegeven het pand met identificatie "0826100000036343" heeft de volgende geometrie polygoon coördinaten
        | geometriecoördinaten                                                                                                        |
        | [ [118315.606,404844.967],[118324.183,404843.509],[118325.179,404849.365],[118316.604,404850.835],[118315.606,404844.967] ] |
        Als met "GET" "/panden?locatie=118320,404848" wordt gezocht
        Dan bevat het resultaat het pand met identificatie "0826100000036343"

    Scenario: coördinaat locatie valt buiten geometrievlak van gezochte pand
        Gegeven het pand met identificatie "0826100000036343" heeft de volgende geometrie polygoon coördinaten
        | geometriecoördinaten                                                                                                        |
        | [ [118315.606,404844.967],[118324.183,404843.509],[118325.179,404849.365],[118316.604,404850.835],[118315.606,404844.967] ] |
        Als met "GET" "/panden?locatie=118320,404848" wordt gezocht
        Dan bevat het resultaat GEEN pand met identificatie "0826100000036343"

    Scenario: coördinaat locatie valt tussen binnenrand en buitenrand van gezochte pand met uitsnede
        Gegeven het pand met identificatie "1926100000495231" heeft de volgende geometrie polygoon coördinaten
        | geometriecoördinaten                                                                                                                                                 |
        | [ [90275.639,446939.302],[90241.499,446929.194],[90265.134,446876.961],[90301.792,446899.558],[90293.907,446944.715],[90279.026,446940.298],[90275.639,446939.302] ] |
        | [ [90257.962,446920.845],[90277.66,446926.938],[90282.005,446928.282],[90285.691,446907.282],[90268.911,446896.459],[90257.962,446920.845] ]                         |
        Als met "GET" "/panden?locatie=90290,446910" wordt gezocht
        Dan bevat het resultaat het pand met identificatie "1926100000495231"

    Scenario: coördinaat locatie valt binnen geometrie van binnenvlak (binnen de uitsnede) van gezochte pand met uitsnede
        Gegeven het pand met identificatie "1926100000495231" heeft de volgende geometrie polygoon coördinaten
        | geometriecoördinaten                                                                                                                                                 |
        | [ [90275.639,446939.302],[90241.499,446929.194],[90265.134,446876.961],[90301.792,446899.558],[90293.907,446944.715],[90279.026,446940.298],[90275.639,446939.302] ] |
        | [ [90257.962,446920.845],[90277.66,446926.938],[90282.005,446928.282],[90285.691,446907.282],[90268.911,446896.459],[90257.962,446920.845] ]                         |
        Als met "GET" "/panden?locatie=90270,446910" wordt gezocht
        Dan bevat het resultaat GEEN pand met identificatie "1926100000495231"

Rule: Pand wordt gevonden wanneer de coördinaat van de locatieparameter op de buitenrand van de pandgeometrie ligt

    Scenario: coördinaat locatie is een geometriecoördinaat van gezochte pand
        Gegeven het pand met identificatie "0826100000036343" heeft de volgende geometrie polygoon coördinaten
        | geometriecoördinaten                                                                                                        |
        | [ [118315.606,404844.967],[118324.183,404843.509],[118325.179,404849.365],[118316.604,404850.835],[118315.606,404844.967] ] |
        Als met "GET" "/panden?locatie=118315.606,404844.967" wordt gezocht
        Dan bevat het resultaat het pand met identificatie "0826100000036343"

    Scenario: coördinaat locatie ligt op de verbindingslijn tussen twee geometriecoördinaten van gezochte pand
        Gegeven het pand met identificatie "0826100000036343" heeft de volgende geometrie polygoon coördinaten
        | geometriecoördinaten                                                                                                        |
        | [ [118315.606,404844.967],[118324.183,404843.509],[118325.179,404849.365],[118316.604,404850.835],[118315.606,404844.967] ] |
        Als met "GET" "/panden?locatie=118315.606,404844.967" wordt gezocht
        Dan bevat het resultaat het pand met identificatie "0826100000036343"

    Scenario: coördinaat locatie ligt op de verbindingslijn tussen twee geometriecoördinaten van de binnen vlak van gezochte pand
        Gegeven het pand met identificatie "0826100000036343" heeft de volgende geometrie polygoon coördinaten
        | geometriecoördinaten                                                                                                        |
        | [ [118315.606,404844.967],[118324.183,404843.509],[118325.179,404849.365],[118316.604,404850.835],[118315.606,404844.967] ] |
        Als met "GET" "/panden?locatie=118324.681,404846.437" wordt gezocht
        Dan bevat het resultaat het pand met identificatie "0826100000036343"

Rule: Pand wordt gevonden wanneer de coördinaat van de locatieparameter niet meer dan een halve milimeter van de buitenrand van de pandgeometrie ligt

    Abstract Scenario: coördinaat locatie <scenario> van gezochte pand
        Gegeven het pand met identificatie "0826100000036343" heeft de volgende geometrie polygoon coördinaten
        | geometriecoördinaten                                                                                                        |
        | [ [118315.606,404844.967],[118324.183,404843.509],[118325.179,404849.365],[118316.604,404850.835],[118315.606,404844.967] ] |
        Als met "GET" "/panden?locatie=<locatie>" wordt gezocht
        Dan bevat het resultaat <resultaat> het pand met identificatie "0826100000036343"

        Voorbeelden:
        | locatie                 | resultaat | scenario                                                           |
        | 118315.606,404844.967   | wel       | is een geometriecoördinaat                                         |
        | 118315.605,404844.967   | niet      | ligt 1mm van een geometriecoördinaat                               |
        | 118324.681,404846.437   | wel       | ligt op de verbindingslijn tussen twee geometriecoördinaten        |
        | 118324.682,404846.437   | niet      | ligt 0,9mm van de verbindingslijn tussen twee geometriecoördinaten |
        | 118325.1795,404849.3650 | wel       | ligt 0,5mm van een geometriecoördinaat                             |
        | 118325.1796,404849.3650 | niet      | ligt 0,6mm van een geometriecoördinaat                             |
        | 118315.60,404844.96     | niet      | in centimeters valt buiten geometrie                               |
        | 118325.17,404849.36     | wel       | in centimeters valt binnen geometrie                               |
        | 118315,404844           | niet      | in meters valt buiten geometrie                                    |
        | 118325,404849           | wel       | in meters valt binnen geometrie                                    |
