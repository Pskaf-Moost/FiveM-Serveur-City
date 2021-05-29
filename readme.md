# Serveur FiveM - ESX Framework - Moost
## _To-do, fix, future features_

------------


### _Prison_
- [x] Implémenter Esx_extended_jail : https://forum.cfx.re/t/extended-jail-esx-escape/1952776
Le menu prison doit être ajouté au menu esx_policejob (déja fait pour le premier esx_jail, voir dans *policejob/client/main.lua* ).

- - Ce script permet à un ami du prisonnier de le libérer et d'avertir la police. Il y a une action à l'entrée de la prison pour le libérer.
- - Il rajoute aussi 2 prisons différentes, dans le poste de police (garde à vue) ou vraie prison.
- - On veut rajouter une évasion sans passer par l'action. (Quelqu'un vient chercher le prisonnier en hélico, se pose et repart avec lui).

Mais on ne sait pas comment est géré la fuite de la prison (si le joueur s'éloigne dans l'hélico, est-il est libéré automatiquement ?)

- Ce script par contre ( https://forum.cfx.re/t/esx-simple-jail-breaking-system/612435 ) possède un bout de code quelquepart qui doit libérer le joueur de prison si il s'éloigne assez de la prison **(sans le téléporter)**, à mixer avec le script au dessus pour avoir une évasion focntionnelle.

- [x] Notifier la police si le prisonnier s'échappe quand il s'éloigne de la prison, ou alors notifier la police si quelqu'un rentre dans le périmètre de la prison, à voir.  Les notifications de stasiek_selldrugsv2 sont bien réalisés et avertissent la police, avec une petite image (que l'on pourra modifier). On peut reprendre son code pour les notifications.

------------


### _Police_

- La police possède une bonne base.
- [x] Le garage ne fonctionne pas correctement, il faudrait refaire cette partie. 
Il faut que le garage soit accessible par tous les policiers, et que tous les véhicules à l'intérieur soient partagés par la police. Pour le moment chaque policier doit acheter son véhicule, et les autres ne peuvent pas le partager et le sortir du garage... Peut être peut-on trouver un esx_garage pour la police déja fait ? 
Sinon, il faut regarder comment fonctionne les ESX Addon_inventory, Datasore, etc... Qui sont censés rajouter des inventaires partagés pour les sociétés : Peut être qu'on peut mettre des véhicules dans des "inventaires" de société ?

- [x] Alerte quand il y a une bagarre ou un coup de feu : https://github.com/TanguyOrtegat/esx_jb_outlawalert
- - [ ] mettre de jolies blips
- - [ ] faire en sorte que CarJacking/Street Fight ne spamment pas autant

- [x] Commissariat plus grand : https://sv.gta5-mods.com/maps/missionrow-extended-interior

- [x] Casier judiciaire à ajouter au menu : https://forum.cfx.re/t/release-criminalrecords-for-esx/116963 (tout est expliqué)

- [ ] On peut passer par ce mode pour les différents permis : https://forum.cfx.re/t/release-esx-documents/547648
Il permet de créer des documents persos, les remplir, les signer, donner des copies, les montrer, etc... 
On l'utilisera pour le permis de port d'arme et pour le permis de conduire.
 Il faut donc enlever le menu license puisqu'on ne va pas l'utiliser, et enlever la license d'arme de le esx_weaponshop (config).
Pour avoir le permis de port d'armes, il faudra demander à un membre du LSPD de le passer, et il fera un test de tir 

- [ ] ** Le plus important ** : Il faut ajouter une radio à la LSPD. Plusieurs mods existent, notamment un qui utilise TeamSpeak. A voir lesquels fonctionnent le mieux. (https://forum.cfx.re/t/release-tokovoip-a-teamspeak-based-voip-system/475479)



- [x] La prise de service doit être faite par le menu police également. Rajouter un menu "Service" en dessous de "Interaction citoyen, interaction véhicule"...
Le menu service doit comprendre "Prise de service, fin de service" et doit envoyer une notification à tous les policiers pour leur dire que X player vient de prendre son service.
La prise de service est faite lorsque le policier enfile sa tenue pour le moment, lorsqu'on active le esx_service. On peut utiliser cette partie du code pour activer le service, et reprendre les notifications de Stasiekdrugsv2 pour avertir toute la police.

- [ ] Demande de renfort : https://github.com/FAXES/Police-Backup/tree/ESXmaster

- [x] Holster fonctionnel : https://forum.cfx.re/t/release-dynamic-holsters-eup-support/731182

------------


### _Job_ ###

- [ ] Nous allons retirer le métier d'ambulancier des métiers disponible, mais garder esx_ambulancejob.
Esx_ambulancejob possède tout le framework du coma et de la réanimation etc...
On va par contre mettre en vente des médikits et des bandages dans des pharmacies, pour que les joueurs puissent en acheter et réanimer leurs amis ou se soigner.
L'appel de détresse en appuyant sur G ne doit plus notifier les ambulanciers mais **la police** à la place.

- [ ] On doit retirer la plupart des métiers de esx_jobs mais garder le framework actif. On peut rajouter d'autres métiers (Kebabier, garbage_job...).

- [ ] Pour créer une vraie économie, on peut regarder ce mode : https://forum.cfx.re/t/release-harvest-treatment-selling-jobs-system-v1-1/15465 à coupler avec ce mode de craft : https://forum.cfx.re/t/release-esx-crafting-system/145349
- - Autrement dit, le premier mod permet de récolter et traiter des items persos, genre (Salade -> Salade propre ), et le deuxième permet de créer des items à partir d'autre. Par exemple on peut créer un job de fermier, qui pourra récolter tomate et salade, les "traiter" et les rendre propre,  et le Kebabier aura besoin de tomate et salade pour créer ses kebabs, il devra donc les acheter au Fermier.
On peut imaginer pleins d'autres chsoes

- [ ] Job routier :  https://forum.cfx.re/t/release-truckerjob-v0-3-update-29th-january/5237

- [ ] Job de journaliste :https://forum.cfx.re/t/release-weazel-news-camera-and-mic/116118 (rien à faire, RP unqiuement), mais assez cool.

------------

### _Braquage_

Différents script de braquage à la place de celui déja installé : 
- https://forum.cfx.re/t/release-esx-loffe-robbery/668033

- https://forum.cfx.re/t/esx-fleeca-bank-heists/1352598

------------

### _Inventaire, Hud, Divers_ ###

- [x] Nouvelle interface création personnage (peut etre buggé) : https://github.com/PainedPsyche/cui_character

- [x] Il faut ajouter des items. 
- - [x] Munitions : Les rendre achetables dans les magasins d'armes, (ou à l'armurerie pour la police). Il faut aussi les rendre utilisable, et lors de l'utilisation le player recevra les munitions.
- - [x] Il faut rajouter de l'alcool et d'autres nourriture avec ce script : (https://github.com/TheMrDeivid/ESX_shops_with_bars).
Il rajoute des bars et un grand nombre d'item dans le BDD. Le Github contient Esx_shop et esx_basicneed qui sont déja installé, il faudra les remplacer et les back-up, au cas où.

- [x] Il faut rajouter une options de véhicule lock, avec des clefs ou autre.
Cette partie peut être un peu délicate, il faut trouver un script qui fonctionne..
Apparemment ce script est cool : https://forum.cfx.re/t/free-alf-carkeys-the-ultimate-vehicle-system/2793960 
Les fatures qui sont intéréssantes : 
» Lock the Vehicle
» Copy Keys
» Give Keys to other Users via. Menu
» Change your Plate

- [x] Il faut modifier l'interface de l'inventaire et du HUD avec le menu horrible (je m'en occuperais). ( https://forum.cfx.re/t/release-esx-menu-default-edited-to-looks-like-gtaonline/151775)

- [x] Il faut rajouter cette map (https://forum.cfx.re/t/new-postal-code-map/97628)

- [ ] Ce script permet au joueur de présenter ses licences au joueur devant lui ( https://forum.cfx.re/t/release-jsfour-idcard-esx/169787 ). Si on peut le modifier, modifier les images des cartes d'identité etc, ça peut être sympa.

- [x] Nouvelle interface pour le clotheShop : https://forum.cfx.re/t/release-esx-np-skinshop-update/993801 avec sauvegarde de tenue et menu.

- [x] Radar vitesse pour la police : https://forum.cfx.re/t/release-wraith-ars-2x-police-radar-and-plate-reader-v1-3-0/1058277

- [ ] Pêche : https://forum.cfx.re/t/release-advanced-fishing/277267

- [x] Arme lourde sur le dos : https://forum.cfx.re/t/release-weapons-on-back/292036

- [ ] Mettre des NPC dans les shop : https://forum.cfx.re/t/release-ped-npc-addon-shops-nightclub-drugs-update/433051

- [x] Pas de réticule de visée : https://forum.cfx.re/t/release-no-reticle-reticle-disabler-2-2-0/53168 
Le but est de créer des scènes de RP, pas de Headshot des gens et de casser leur jeu.





