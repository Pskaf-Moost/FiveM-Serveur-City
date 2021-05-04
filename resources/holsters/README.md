# Holsters
This is a resource for the Grand Theft Auto V multiplayer mod, [FiveM](https://fivem.net), which is inspired by the [Cop Holster](https://www.lcpdfr.com/files/file/8017-cop-holster/) script on LSPDFR. It automatically changes ped components when a player draws or holsters a weapon.

<img src="https://media.giphy.com/media/loGRS56xWOA5fEy5OF/giphy.gif" width="185.5" height="240" />

# License
You can edit and redistribute under the terms in the `LICENSE` file. Even though this resource is relatively simple and condensed, I've put in a lot of work to make it so. All I ask is that you don't steal my work and take credit for it; it's very simple.

## Information
### How does this work?
Many ped models used in GTA V (especially ones derived from the base game) have variations of the duty belt with and without guns in the holster. This script puts these variations to use by automatically changing components when the player draws or holsters a weapon. It's fully configurable and supports an unlimited number of peds.

### Does this support EUP?
Yes, the default config file is preconfigured with the default holsters for both male and female peds. However, you may need to configure this a little to accomodate any different holsters.

### Does this have animations?
No, but this is something I'm going to look at adding, along with configuration for more than just one type of weapon.

## Installation
1. Download the [latest release](https://github.com/Jamelele/holsters/releases/latest) as a zip file, or clone the repository using Git.
2. Put it in your `resources` folder.
3. Add `ensure holsters` to your `server.cfg` to ensure it is run on start-up.
4. *Optional*: Edit config.lua to your liking, scroll down further to learn how to.

## Configuration

- [Configuration documentation](https://github.com/Jamelele/holsters/wiki/Configuration-Guide)

## Commands

### /holsters <on/off>
Toggles the resource on and off, if `on/off` is not specified then it will toggle.
