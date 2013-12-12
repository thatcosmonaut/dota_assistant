# Dota 2 Pick Assistant

A tool for helping people not make awful picks in DOTA games.

## Setup

From a fully migrated clean database, run:

```shell
rake db:seed:roles db:seed:heroes
```

This will populate the database with the necessary information about heroes and team composition.

## How It Works

The current version of the algorithm uses vector math to try and find the hero that will best fit into your current
lineup to get the team as close as possible to an ideal team composition. Right now the algorithm optimizes for the
standard 2-1-2 lane distribution but future versions may allow picking for trilanes and other non-standard strategies.

The attributes that the algorithm takes into account are:
Attack type (melee or ranged), the hero's viability in mid-lane, and the different roles that each hero is suited to.

A hero vector is constructed as follows:
AT  
MID  
CARRY  
DISABLE  
DURABLE  
ESCAPE  
GANK  
INITIATE  
JUNGLE  
LANE SUPPORT  
NUKE  
PUSH  
SUPPORT  

The ideal team vector is currently chosen to optimize for:  
1 viable mid  
1 strong carry  
Roughly 2 supports  
Strong initiation and teamfight  
Strong disable

The algorithm does not take into account hard counters at the moment.
I am trying to find the best way to efficiently represent counters and properly weight the value of having them.

## How To Use
Select the heroes that are currently picked for your team
Select the heroes that are currently picked on the enemy team
Hit submit!

The algorithm will return:  
5 best heroes  
5 worst heroes

that fit into your current team composition.

A lower score is better - the higher the score the farther away the hero is from the best fit.

## Contribution
If you have a suggestion or you find a bug, file an Issue on Github!

If you want to contribute some code to the project, file a Pull Request and I'll take a look when I can.

Please do not plagiarize my code. If you use something from this project give me some credit! Thanks!

## Thanks
Special thanks to Benton Anderson and Alex David for helping me with the linear algebra.

(c) Evan Hemsley 2013
