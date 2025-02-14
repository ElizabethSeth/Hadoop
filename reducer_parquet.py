import sys

total_sum = 0
total_count = 0

for line in sys.stdin:
    value, count = map(float, line.strip().split("\t"))
    total_sum += value
    total_count += count

print(f"Average: {total_sum / total_count}")
