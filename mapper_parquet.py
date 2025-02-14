import sys

for line in sys.stdin:
    value = float(line.strip().split(",")[0])
    print(f"{value}\t1")
