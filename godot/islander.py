# import sqlite3
# import json
# import sys

# DB_PATH = "islander_data.db"

# class Islander:
#     def __init__(self, name, pronouns, appearance):
#         self.name = name
#         self.pronouns = pronouns
#         self.appearance = appearance  # dictionary storing appearance traits

#     def save(self):
#         """Save the islander to the database."""
#         conn = sqlite3.connect(DB_PATH)
#         cursor = conn.cursor()
#         cursor.execute("INSERT INTO islanders (name, pronouns, appearance) VALUES (?, ?, ?)",
#                        (self.name, self.pronouns, json.dumps(self.appearance)))
#         conn.commit()
#         conn.close()

#     @staticmethod
#     def load_all():
#         """Load all islanders from the database."""
#         conn = sqlite3.connect(DB_PATH)
#         cursor = conn.cursor()
#         cursor.execute("SELECT * FROM islanders")
#         islanders = cursor.fetchall()
#         conn.close()
#         return [Islander(i[1], i[2], json.loads(i[3])) for i in islanders]

# def setup_database():
#     """Initialize the database and create the required table."""
#     conn = sqlite3.connect(DB_PATH)
#     cursor = conn.cursor()
#     cursor.execute("""
#         CREATE TABLE IF NOT EXISTS islanders (
#             id INTEGER PRIMARY KEY AUTOINCREMENT,
#             name TEXT,
#             pronouns TEXT,
#             appearance TEXT
#         )
#     """)
#     conn.commit()
#     conn.close()

# if __name__ == "__main__":
#     setup_database()
#     # If three or more arguments are provided, assume we are saving a new character.
#     if len(sys.argv) > 3:
#         name = sys.argv[1]
#         pronouns = sys.argv[2]
#         try:
#             appearance = json.loads(sys.argv[3])
#         except json.JSONDecodeError as e:
#             print("Error decoding JSON for appearance:", e)
#             sys.exit(1)
#         new_islander = Islander(name, pronouns, appearance)
#         new_islander.save()
#     else:
#         # No arguments: load all islanders and output as JSON.
#         all_islanders = Islander.load_all()
#         output = []
#         for isl in all_islanders:
#             output.append({
#                 "name": isl.name,
#                 "pronouns": isl.pronouns,
#                 "appearance": isl.appearance
#             })
#         print(json.dumps(output))



import sys
import json

class Islander:
    def __init__(self, name, pronouns, appearance):
        self.name = name
        self.pronouns = pronouns
        self.appearance = appearance

    def to_dict(self):
        return {
            "char_name": self.name,
            "char_pronouns": self.pronouns,
            "menu_params": self.appearance
        }

if __name__ == "__main__":
    print("Arguments received:", sys.argv, file=sys.stderr)  # Debugging output

    if len(sys.argv) < 4:
        sys.stderr.write("Error: Insufficient arguments\n")
        sys.exit(1)

    char_name = sys.argv[1]
    char_pronouns = sys.argv[2]
    menu_params_raw = sys.argv[3]

    print("Raw menu_params:", menu_params_raw, file=sys.stderr)  # Debugging line

    try:
        menu_params = json.loads(menu_params_raw)  # Convert JSON string to dictionary
    except json.JSONDecodeError as e:
        sys.stderr.write(f"JSON decode error: {e}\n")
        sys.exit(1)

    islander = Islander(char_name, char_pronouns, menu_params)
    
    # Ensure JSON output is the only thing written to stdout
    sys.stdout.write(json.dumps(islander.to_dict()))
    sys.stdout.flush()

