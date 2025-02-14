#!/usr/bin/env python3
import sys

current_key = None
current_count = 0

# Read from standard input
for line in sys.stdin:
    key, count = line.strip().split("\t")
    count = int(count)
    if current_key == key:
        current_count += count
    else:
        if current_key:
            print(f"{current_key}\t{current_count}")
        current_key = key
        current_count = count

# Print the last key
if current_key:
    print(f"{current_key}\t{current_count}")
