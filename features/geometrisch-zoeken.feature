# language: nl

Functionaliteit: Als gebruiker wil ik met een geometrie (punt, bounding box) kunnen zoeken naar resources, 
                 zodat ik gericht vervolgstappen kan definiëren m.b.t. de gevonden resources.

    Bij het bepalen of een resource geometrie binnen de opgegeven contour ligt (bbox) of 
    dat een opgegeven geometrie (punt) binnen de resource geometrie ligt, wordt een intersects spatial operator gebruikt.

    Intersects:
    Om te bepalen of een geometrie A binnen een geometrie B ligt, deze raakt, kruist of (deels) overlapt, wordt gebruik gemaakt van de spatial operator INTERSECTS:

      intersects(geometrie A, geometrie B)

    Intersects betekent dat geometrie A en geometrie B tenminste één gemeenschappelijk punt hebben.
    Anders gezegd geometrie A en geometrie B mogen niet volledig los van elkaar staan.
    Het resultaat van intersects(geometrie A, geometrie B) levert hetzelfde op als intersects(geometrie B, geometrie A).
    Het maakt niet uit of geometrie A of geometrie B de geometrie is waarmee gezocht wordt en
    h.Het maakt niet uit of geometrie A of geometrie B de resource geometrie is.
    Als intersects true oplevert, dan wordt de resource waar de geometrie onderdeel van is, geretourneerd.

    Referenties:
    - Haal Centraal Common - foutafhandeling.feature
    
    Het geometrisch zoeken met een bounding box geometrie kan met de parameter: bbox.

    Het geometrisch zoeken met een punt geometrie kan met de parameter: locatie.
    Het is echter ook mogelijk om een bounding box op te geven waarbij de coördinaten van de linker onderhoek en de rechter bovenhoek exact gelijk zijn.


  Scenario: zoeken met geometrisch punt met CRS
  
    Gegeven een resource endpoint waar met een GET methode en geometrisch punt gezocht kan worden
    Als er met een geometrisch punt wordt gezocht
    En in de Content-Crs header staat in welk CRS het punt is geëncodeerd (optioneel)
    En de provider ondersteund dit CRS
    En de resource geometrie intersects met het opgegeven geometrisch punt
    Dan wordt de resource geretourneerd
    
    Bijvoorbeeld:
    
      /panden?locatie=196733.510,439931.890
      
  Scenario: zoeken met geometrisch punt met CRS geen resources
  
    Gegeven een resource endpoint waar met een GET methode en geometrisch punt gezocht kan worden
    Als er met een geometrisch punt wordt gezocht
    En in de Content-Crs header staat in welk CRS het punt is geëncodeerd (optioneel)
    En de provider ondersteund dit CRS
    En er geldt niet dat de resource geometrie intersects met het opgegeven geometrisch punt
    Dan wordt de resources niet geretourneerd
  
  Scenario: zoeken met geometrisch punt en niet ondersteund CRS
  
    Gegeven een resource endpoint waar met een GET methode en geometrisch punt gezocht kan worden
    Als er met een geometrisch punt wordt gezocht
    En in de Content-Crs header staat in welk CRS het punt is geëncodeerd (optioneel)
    En de provider ondersteund dit CRS niet
    Dan worden er een 400 crsNotSupported foutmelding geretourneerd
    En dan bevat de Accept-Crs de door de provider ondersteunde CRS-en
  
  Scenario: zoeken met geometrisch punt zonder CRS
  
    Gegeven een resource endpoint waar met een GET methode en geometrisch punt gezocht kan worden
    Als er met een geometrisch punt wordt gezocht
    En er wordt geen Content-Crs header meegegeven
    Dan wordt er een 412 contentCrsMissing foutmelding geretourneerd
  
  
  Scenario: zoeken met een bounding box met CRS
  
    Gegeven een resource endpoint waar met een GET methode en bounding box gezocht kan worden
    Als er met een bounding box wordt gezocht met 2D coördinaten
    En in de Content-Crs header staat in welk CRS de bounding box geometrie is geëncodeerd
    En de provider ondersteund dit CRS
    En de resource geometrie intersects met de opgegeven bounding box geometrie
    Dan wordt de resource geretourneerd 

    Bijvoorbeeld:
    
      /panden?bbox=196733.510,439931.890,197033.510,440031.890

  Scenario: zoeken met een bounding box met CRS gelijke coördinaten
  
    Gegeven een resource endpoint waar met een GET methode en bounding box gezocht kan worden
    Als er met een bounding box wordt gezocht waarbij de coördinaten voor het punt linksonder en rechtsboven gelijk zijn
    En in de Content-Crs header staat in welk CRS de bounding box geometrie is geëncodeerd (optioneel)
    En de provider ondersteund dit CRS
    En de resource geometrie intersects met de opgegeven bounding box geometrie
    Dan wordt de resource geretourneerd
    En is het resultaat hetzelfde wanneer er bij het endpoint /panden?locatie=<coördinaat> dezelfde coördinaat wordt opgegeven

    Bijvoorbeeld:
    
      /panden?bbox=196733.510,439931.890,196733.510,439931.890

  Scenario: zoeken met bounding box met CRS geen resources
  
    Gegeven een resource endpoint waar met een GET methode en bounding box gezocht kan worden
    Als er met een bounding box wordt gezocht
    En in de Content-Crs header staat in welk CRS de bounding box geometrie is geëncodeerd (optioneel)
    En de provider ondersteund dit CRS
    En de resource geometrie intersects niet (disjoint) met de opgegeven bounding box geometrie
    Dan wordtn de resources niet geretourneerd
  
  Scenario: zoeken met bounding box en niet ondersteund CRS
  
    Gegeven een resource endpoint waar met een GET methode en bounding box gezocht kan worden
    Als er met een bounding box wordt gezocht
    En in de Content-Crs header staat in welk CRS de bounding box geometrie is geëncodeerd (optioneel)
    En de provider ondersteund dit CRS niet
    Dan worden er een 400 crsNotSupported foutmelding geretourneerd
    En dan bevat de Accept-Crs de door de provider ondersteunde CRS-en
  
  Scenario: zoeken met bounding box zonder CRS
  
    Gegeven een resource endpoint waar met een GET methode en bounding box gezocht kan worden
    Als er met een bounding box wordt gezocht
    En er wordt geen Content-Crs header meegegeven
    Dan worden er een 412 contentCrsMissing foutmelding geretourneerd

  Scenario: zoeken met een bounding box met CRS
  
    Gegeven een resource endpoint waar met een GET methode en bounding box gezocht kan worden
    Als er met minder dan twee 2D coördinaten wordt gezocht
    En in de Content-Crs header staat in welk CRS de bounding box geometrie is geëncodeerd (optioneel)
    En de provider ondersteund dit CRS
    Dan wordt er een 400 foutmelding met foutcode paramsValidation en validatie minItems geretourneerd 
  
  Scenario: zoeken met een bounding box met CRS
  
    Gegeven een resource endpoint waar met een GET methode en bounding box gezocht kan worden
    Als er met meer dan twee 2D coördinaten wordt gezocht
    En in de Content-Crs header staat in welk CRS de bounding box geometrie is geëncodeerd (optioneel)
    En de provider ondersteund dit CRS
    Dan wordt er een 400 foutmelding met foutcode paramsValidation en validatie maxItems geretourneerd 
  
