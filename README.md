# Tix

## Plan

The plan with this repo is to create a configuration for nixos that will:

- build all the programs that i use as well as the DM that i use

- will able to be configured for different machines

- will be able to change apps, Managers and different personalizations for different machines with a simple configuration

- will be able to produce an iso that installs my system(if possible).

## Directory structure

### nixos

with possible conf and hardware subdirectories that have more general system presets

locales, users, etc...

### apps

that contain all the configs for certain apps that could be used, so that they may be imported using something like `appps.steam.enabled` or `apps.steam {enable = true; config = ...}` for more custom installs.

### src

#### packages

that would contain different presets that would be used more generaly.

example: a `bionix` flake that could be enabled to use for bioinformatic use on the machine.

#### presets

presets like language dev enviroments, desktop presets, etc...

### machines

machine specific presets: graphics, wifi, etc...


## Repo

the repo will evolve while i get the grasp of the system


---



# TODO 

- [ ] development flakes for languages of:

    - [ ] Rust
  
    - [ ] Java
  
    - [ ] Python (and other conda envs)
  
    - [ ] Nushell (nuls, etc..)
  
- [ ] home-manager

    - [ ] nushell
  
    - [ ] helix
  
    - [ ] ssh
  
    - [ ] git
  
    - [ ] ...
  
- [ ] todo

