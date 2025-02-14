#!/usr/bin/env python3
import sys

# Input: each row of diamonds data
for line in sys.stdin:
    fields = line.strip().split(",")
    if len(fields) >= 2 and fields[0] != "carat":  # Ignore header
        carat = fields[0]
        price = fields[8]
        print(f"{carat}\t{price}")
