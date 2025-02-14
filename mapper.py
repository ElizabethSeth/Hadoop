import sys
import re


for line in sys.stdin:
    line = line.strip()  
    words = re.findall(r'\b[a-zA-Z0-9]+\b', line) 
    for word in words:
        print(f"{word}\t1")
