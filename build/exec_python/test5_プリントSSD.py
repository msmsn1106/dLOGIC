# ssd_info.py
import shutil
import psutil

def is_ssd(disk):
    try:
        device = disk.device
        if 'nvme' in device or 'sd' in device:
            return True
    except Exception:
        return False
    return False

def main():
    print("Mounted SSDs and available space:")
    partitions = psutil.disk_partitions(all=False)
    for part in partitions:
        if is_ssd(part):
            usage = shutil.disk_usage(part.mountpoint)
            print(f"{part.device} mounted on {part.mountpoint}")
            print(f"  Total: {usage.total // (1024**3)} GB")
            print(f"  Used:  {usage.used // (1024**3)} GB")
            print(f"  Free:  {usage.free // (1024**3)} GB")
            print()

if __name__ == "__main__":
    main()

