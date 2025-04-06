# print_arg.py
import sys
import time

def main():
    if len(sys.argv) != 2:
        print("Usage: python print_arg.py <directory>")
        return
    time.sleep(1)
    print(f"Directory argument: {sys.argv[1]}")

if __name__ == "__main__":
    main()

