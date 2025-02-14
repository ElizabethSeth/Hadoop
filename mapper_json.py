import sys
import json

for line in sys.stdin:
    data = json.loads(line)
    if "game_index" in data:
        print(data["game_index"])
