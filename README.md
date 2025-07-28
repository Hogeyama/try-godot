# Dodge The Creeps

A simple 2D game made with Godot Engine 4.4.1 where the player's character must avoid enemies ("creeps") for as long as possible.

## Game Overview

In "Dodge The Creeps", you control a character that must avoid various enemies moving across the screen. The longer you survive, the higher your score. The game ends when you collide with an enemy.

## How to Play

1. Click the "Start" button to begin
2. Use arrow keys to move your character:
   - ↑ (Up): Move up
   - ↓ (Down): Move down
   - ← (Left): Move left
   - → (Right): Move right
3. Avoid colliding with the enemies
4. Press Enter to start a new game after game over

## Project Structure

### Main Components

1. **Main Scene (`main.tscn`)**

   - The core scene that manages the game flow
   - Controls game start, game over, and score management
   - Spawns enemy mobs at random positions and velocities

2. **Player (`player.tscn`)**

   - The player character controlled by arrow keys
   - Features animated sprites for different movement directions
   - Detects collisions with enemies

3. **Mob (`mob.tscn`)**

   - Enemy characters that move across the screen
   - Features different animations (flying, swimming, walking)
   - Moves with random direction and speed

4. **HUD (`hud.tscn`)**
   - User interface elements including score display and messages
   - Manages the start button and game over messages

### Technical Features

- **Signal-based communication** between components
- **Animated sprites** for character representation
- **Timer nodes** for game progression management
- **Physics engine** for collision detection
- **Path2D** for defining enemy spawn positions
- **Web export** capability with JavaScript integration

## Assets

- Player and enemy sprite images in the `art/` folder
- Font: Xolonium-Regular (`fonts/` folder)
- Sound effects and music:
  - Game over sound
  - Background music

## Development

This project demonstrates Godot Engine's core concepts:

- Scene and node hierarchy
- GDScript for game logic
- Signals for inter-node communication
- Input mapping
- Animation system
- Physics and collision detection

## Credits

Art assets and audio are provided as part of the Godot tutorial resources.
