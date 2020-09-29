# The-Space-War
A remake of a retro game with dynamic visuals. The goal was to add as many dynamic elements as possible!

-> To try it out yourself download the **the_space_war.zip** and **run the_space_war.exe**. 

-> To tweak the code and run the **the_space_war.pde** file with [Processing](https://processing.org/).

![Game Main Screen](https://github.com/rjetalpuria/The-Space-War/blob/master/Screenshots/the%20space%20war%20-2.png)

### Key controls: 

4 arrow keys to move player

‘X’ to shoot

‘P’ to pause

‘S’ to start/ resume



## Mouse controls:

LEFT click the ‘start’ button to start or resume

While playing RIGHT click anywhere to pause



## Dynamic Elements

-> The enemy starts from the previous X- value of the player--ENEMY BEHAVIOR & CHARACTER

-> The enemy speed changes depending on the current second on clock mod 10.--ENEMY BEHAVIOR

-> KEEPS SCORES: based on how long the bullet touches the enemy (&& enemy speed)

-> The Character/Paddle width increases based on current seconds and score. CHARACTER

-> The volume of the background music changes depending on the score and the current minute on clock.--SOUND

-> (randomly)Picks a colors for the items in the title screen and ‘score’ text in game play and then sets its whiteness based on mouseX--DRAWING GRAPHICS & mouse mvmt.

-> (randomly)Picks a colors for the items in game play (except ‘score’ text) and then sets its whiteness based on mouseY. --DRAWING GRAPHICS & mouse mvmt.
