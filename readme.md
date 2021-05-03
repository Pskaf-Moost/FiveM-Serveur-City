# Serveur FiveM - ESX Framework - Moost
## _To-do, fix, future features_


------------


### _Prison_
- Implémenter Esx_extended_jail : https://forum.cfx.re/t/extended-jail-esx-escape/1952776
Le menu prison doit être ajouté au menu esx_policejob (déja fait pour le premier esx_jail, voir dans *policejob/client/main.lua* ).

- - Ce script permet à un ami du prisonnier de le libérer et d'avertir la police. Il y a une action à l'entrée de la prison pour le libérer.
- - Il rajoute aussi 2 prisons différentes, dans le poste de police (garde à vue) ou vraie prison.
- - On veut rajouter une évasion sans passer par l'action. (Quelqu'un vient chercher le prisonnier en hélico, se pose et repart avec lui).

Mais on ne sait pas comment est géré la fuite de la prison (si le joueur s'éloigne dans l'hélico, est-il est libéré automatiquement ?)

- Ce script par contre ( https://forum.cfx.re/t/esx-simple-jail-breaking-system/612435 ) possède un bout de code quelquepart qui doit libérer le joueur de prison si il s'éloigne assez de la prison **(sans le téléporter)**, à mixer avec le script au dessus pour avoir une évasion focntionnelle.

- Notifier la police si le prisonnier s'échappe quand il s'éloigne de la prison, ou alors notifier la police si quelqu'un rentre dans le périmètre de la prison, à voir.  Les notifications de stasiek_selldrugsv2 sont bien réalisés et avertissent la police, avec une petite image (que l'on pourra modifier). On peut reprendre son code pour les notifications.

------------


### _Police_

- La police possède une bonne base.
- Le garage ne fonctionne pas correctement, il faudrait refaire cette partie. 
Il faut que le garage soit accessible par tous les policiers, et que tous les véhicules à l'intérieur soient partagés par la police. Pour le moment chaque policier doit acheter son véhicule, et les autres ne peuvent pas le partager et le sortir du garage... Peut être peut-on trouver un esx_garage pour la police déja fait ? 
Sinon, il faut regarder comment fonctionne les ESX Addon_inventory, Datasore, etc... Qui sont censés rajouter des inventaires partagés pour les sociétés : Peut être qu'on peut mettre des véhicules dans des "inventaires" de société ?

- Il faut rajouter un sous-menu dans les licenses, pour que le Permis du Port d'Armes (PPA) soit délivré par la police. Le port d'arme peut pour le moment être acheter à l'armurerie. (On peut reprendre le code de l'achat de la license, et l'intégrer au menu policejob).
Pas besoin de payer pour le PPA, la police fera passer des faux tests de tir (Plus RP, plus drôle).

- ** Le plus important ** : Il faut ajouter une radio à la LSPD. Plusieurs mods existent, notamment un qui utilise TeamSpeak. A voir lesquels fonctionnent le mieux.


- La prise de service doit être faite par le menu police également. Rajouter un menu "Service" en dessous de "Interaction citoyen, interaction véhicule"...
Le menu service doit comprendre "Prise de service, fin de service" et doit envoyer une notification à tous les policiers pour leur dire que X player vient de prendre son service.
La prise de service est faite lorsque le policier enfile sa tenue pour le moment, lorsqu'on active le esx_service. On peut utiliser cette partie du code pour activer le service, et reprendre les notifications de Stasiekdrugsv2 pour avertir toute la police.

- (Pour plus tard) Le menu service doit aussi comprendre une action "Demande de renfort" qui envoie une notification à tous les policiers "CODE ROUGE"

------------


### _Job_ ###

- Nous allons retirer le métier d'ambulancier des métiers disponible, mais garder esx_ambulancejob.
Esx_ambulancejob possède tout le framework du coma et de la réanimation etc...
On va par contre mettre en vente des médikits et des bandages dans des pharmacies, pour que les joueurs puissent en acheter et réanimer leurs amis ou se soigner.
L'appel de détresse en appuyant sur G ne doit plus notifier les ambulanciers mais **la police** à la place.

- On doit retirer la plupart des métiers de esx_jobs mais garder le framework actif. On peut rajouter d'autres métiers (Kebabier, garbage_job...).
