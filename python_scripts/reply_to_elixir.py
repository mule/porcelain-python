import sys

while 1:

    line = sys.stdin.readline()
    if "quit" in line:
        print("Quitting, bye for now")
        sys.exit()
    print(line)

