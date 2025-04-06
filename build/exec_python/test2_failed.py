# failed.py
import sys
import time

def main():
    if len(sys.argv) != 2:
        print("Usage: python failed.py <directory>")
        return
    time.sleep(2)
    print("Failed")

if __name__ == "__main__":
    main()

