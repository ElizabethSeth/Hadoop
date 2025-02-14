#!/usr/bin/env python3
import sys
import json

for line in sys.stdin:
    try:
        data = json.loads(line.strip())
        if "abilities" in data:
            abilities = data["abilities"]
            for ability in abilities:
                if "ability" in ability and "name" in ability["ability"]:
                    print(f"{ability['ability']['name']}\t1")
    except json.JSONDecodeError:
        continue
