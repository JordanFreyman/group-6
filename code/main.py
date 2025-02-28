import sqlite3
from island import Island
from islander import Islander
import time

if __name__ == "__main__":
    save_file = "island_game_save.json"
    
    leIsland = Island()
    leIsland.load_game(save_file)

    if leIsland.timenow.date() != leIsland.last_login.date():
        leIsland.fountain_visited = False
    else:
        leIsland.fountain_visited = True

    # Main game loop
    while True:
        print(leIsland.timenow)
        leIsland.map(save_file)
