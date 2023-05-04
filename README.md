# Arma-3-Whirlpool
### June 2020

## Setting
Scenario for 1-4 players, where you take on the role of NATO's elite CTRG. Operating around the island of Tanoa, your mission is to disrupt CSAT forces as they entrench themselves on the island, and to assist local forces in their attempts to undermine CSAT authority.

## Features
Scenario is incomplete and was abandoned due to dependency issues, however it does feature a number of interesting systems that I eventually went on to use in other scenarios:
- A system for attaching chemlights to units that drop off when a player is detected.
- A complex player detection system
  - The ability to register certain units as "callers"; units who are assigned to a region and after having seen the player for a certain time threshold, will create a request for reinforcements from a central "dispatcher".
  - A "dispatcher"; a virtual entity that keeps a register of all available reinforcement groups and their readiness. It parses all incoming reinforcement requests, checks whether there is an available group that can react and if successful will coordinate artillery and motorised infantry to the players last known location.
  - Mortar crews who are also controlled by the dispatcher and provide flare coverage to areas where the player has been reported, thus giving light to AI units and dually informing the player that reinforcements are inbound.

## Notes
Despite this scenario being abandoned due to dependecy issues, the reinforcement system it uses is a huge step above any native solution provided by the engine. Versus my original SQF projects like "First Contact" the cleanliness of the code was an enormous step up in terms of readability and reusability. Functions finally have more reasonable names and the code itself is more in line with the SOLID principles.
