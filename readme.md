# Serveur FiveM - ESX Framework - Moost
## _To-do, fix, future features_


### _Prison_
- Implémenter Esx_extended_jail : https://forum.cfx.re/t/extended-jail-esx-escape/1952776
Le menu prison doit être ajouté au menu esx_policejob (déja fait pour le premier esx_jail, voir dans *policejob/client/main.lua* ).
On ne sait pas comment est géré la fuite de la prison (si le joueur s'éloigne il est libéré automatiquement ?)

- Ce script par contre ( https://forum.cfx.re/t/esx-simple-jail-breaking-system/612435 ) possède un bout de code quelquepart qui doit libérer le joueur de prison si il s'éloigne assez de la prison **(sans le téléporter)**, à mixer avec le script esx_extended_jail pour avoir une évasion focntionnelle

- Notifier la police si le prisonnier s'échappe quand il s'éloigne de la prison, ou alors notifier la police si quelqu'un rentre dans le périmètre de la prison, à voir. 


