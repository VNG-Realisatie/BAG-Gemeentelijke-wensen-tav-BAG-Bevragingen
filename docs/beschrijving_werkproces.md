Bij onderstaande procesbeschrijving wordt er vanuit gegaan, dat er branches worden gebruikt. 
De reden hiervoor is, dat er meerdere wijzigingen tegelijkertijd doorgevoerd kunnen worden, dit in tegenstelling tot het gebruik van een fork en dat het eenvoudiger is deze wijzigingen te reviewen. 
Het is verstandig de wijzigingen zo klein mogelijk te houden. 

# Procesbeschrijving issue ready maken
-	Issue staat in ‘**Backlog**’.	Deze issues kunnen ready gemaakt worden.
-	Deze issues worden tijdens ready sessies opgepakt en uitgewerkt conform de Definition of Ready (deze moet nog worden opgesteld).
  Al naar gelang het onderwerp kunnen feature beschrijvingen, design decisions, proces beschrijving, API specificatie etc. worden aangepast.
-	Daarna kan het issue naar de status ‘**Ready**’.

# Procesbeschrijving issue afhandeling
-	Issue staat in ‘**Ready**’.
-	HC PO bepaalt welke zaken er in een sprint geïmplementeerd worden. Issues met label bug worden apart afgehandeld (zie procesbeschrijving afhandeling bevindingen).
  Gedurende de sprint, bij het oppakken van een issue:
-	Issue(s) in ‘**In progress**’ zetten.
-	Branch aanmaken met issue nummer en korte beschrijving (zonder spaties) in de naam.
-	Wijziging(en) t.b.v. issue(s) doorvoeren in de branch.
-	Wijziging(en) committen/pushen in de branch.
-	Issue(s) in ‘**Review**’ zetten.
-	Pull request maken om branch terug te mergen naar de master, vermelden opgeloste issue(s).
-	Reviewers intern selecteren / controle opgeloste issue(s).
-	Reviewers extern selecteren / controle opgeloste issue(s).
-	Zodra reviewers akkoord -> branch mergen naar master.
-	Issue(s) naar ‘**Done**’.
-	Kadaster neemt de versie van de master in de HC github over naar de Kadaster github repository en implementeert deze versie.

# Procesbeschrijving afhandeling bevindingen
Issues met het label 'bug' zijn fouten die zijn geconstateerd bij het testen van de API en betreffen issues in de implementatie van de API.
- Issues met label 'bug' worden door Kadaster overgenomen en behandeld via lokale issue tracking systeem.
- Issues worden intern getest.
- Zodra intern akkoord, wordt het issue in '**Review**' gezet en kan in de testomgeving worden gevalideerd.
- Zodra testen akkoord -> issue naar '**Done**'.
