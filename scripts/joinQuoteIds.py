import argparse

def process_ids(file_path='ids.txt', quote_char="'"):
    """Read the file and process each line into quoted, unique IDs."""
    with open(file_path, 'r') as file:
        unique_quoted_ids = {f"{quote_char}{line.strip()}{quote_char}" 
                            for line in file if line.strip()}
    
    result_string = ', '.join(unique_quoted_ids)
    return result_string

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Process IDs from a file.')
    parser.add_argument('--file', '-f', type=str, default='ids.txt',
                       help='Path to the file containing IDs (default: ids.txt)')
    parser.add_argument('--quote', '-q', type=str, default="'",
                       help='Quote character to use (default: single quote)')
    
    args = parser.parse_args()
    result = process_ids(args.file, args.quote)
    print(result)

