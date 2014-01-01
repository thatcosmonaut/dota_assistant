[![Code Climate](https://codeclimate.com/github/ehemsley/dota_assistant.png)](https://codeclimate.com/github/ehemsley/dota_assistant)
# Dota 2 Pick Assistant

A tool to help people choose the optimal hero for their team in Dota 2.

## Setup

From a fully migrated clean database, run:

```shell
rake db:seed:roles db:seed:heroes
```

This will populate the database with the necessary information about heroes and team composition.

## How It Works

The current version of the algorithm uses vector math to try and find the hero that will best fit into your current
lineup to get the team as close as possible to an ideal team composition. Right now the algorithm allows you to choose
between a 2-1-2, jungling, or trilane composition. I am still working out the kinks of jungling and trilane picking
so bear with me if that doesn't work quite as nicely as 2-1-2 picking just yet.

The attributes that the algorithm takes into account are:
Attack type (melee or ranged), the hero's viability in a solo lane, and the different roles that each hero is suited to.

A hero vector is constructed as follows:  
AT  
SOLO  
OFFLANE (if applicable to composition)  
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

The algorithm does not take into account hard counters at the moment.
I am trying to find the best way to efficiently represent counters and properly weight the value of having them.

## How To Use
1) Select the style of team composition that you want to build  
2) Select the heroes that are currently picked for your team  
3) Select the heroes that are currently picked on the enemy team  
4) Hit submit!

The algorithm will return the 5 best and worst heroes fitting into your team composition.

A lower score is better - the higher the score the farther away the hero is from the best fit.

## Contribution
If you have a suggestion or you find a bug, file an Issue on Github!

If you want to contribute some code to the project, file a Pull Request and I'll take a look when I can.

Please do not plagiarize my code. If you use something from this project give me some credit! Thanks!

## Thanks
Special thanks to Benton Anderson and Alex David for helping me with the linear algebra.

(c) Evan Hemsley 2013
