# success.py
import sys
import time

def main():
    if len(sys.argv) != 2:
        print("Usage: python success.py <directory>")
        return
    time.sleep(1)
    print("1 Sec.")
    time.sleep(1)
    print("2 Sec.")
    time.sleep(1)
    print("3 Sec.")
    time.sleep(1)
    print("4 Sec.")
    time.sleep(1)
    print("Success")

if __name__ == "__main__":
    main()

