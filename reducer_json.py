import sys
from collections import Counter

counts = Counter()
for line in sys.stdin:
    counts[line.strip()] += 1

for key, count in counts.items():
    print(f"{key}\t{count}")
