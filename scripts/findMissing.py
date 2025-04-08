import argparse

def find_missing_ids(file1, file2):
    """Find IDs that are in file1 but not in file2."""
    
    # Read IDs from file1
    with open(file1, "r") as f1:
        ids_file1 = set(line.strip() for line in f1 if line.strip())

    # Read IDs from file2
    with open(file2, "r") as f2:
        ids_file2 = set(line.strip() for line in f2 if line.strip())

    # Find IDs in file1 but not in file2
    missing_ids = ids_file1 - ids_file2

    # Print the unique IDs
    for uid in missing_ids:
        print(uid)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Find IDs that are in file1 but not in file2.')
    parser.add_argument('file1', help='First input file (all_ids.txt)')
    parser.add_argument('file2', help='Second input file (found_ids.txt)')
    
    args = parser.parse_args()
    
    find_missing_ids(args.file1, args.file2)

