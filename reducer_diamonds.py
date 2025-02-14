#!/usr/bin/env python3
import sys

current_carat = None
price_sum = 0
count = 0

print("Carat\tAverage Price")  

for line in sys.stdin:
    carat, price = line.strip().split("\t")
    try:
        price = float(price)
        carat = float(carat)
    except ValueError:
        continue

    if current_carat == carat:
        price_sum += price
        count += 1
    else:
        if current_carat is not None:
            print(f"{current_carat:.2f}\t{(price_sum / count):.2f}") 
        current_carat = carat
        price_sum = price
        count = 1

if current_carat is not None:
    print(f"{current_carat:.2f}\t{(price_sum / count):.2f}")


