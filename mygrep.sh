#!/bin/bash

# Initialize variables to control options (-n for line numbers, -v for invert match)
line_numbers=false
invert_match=false

# Function to display help message and how to use the script
show_help() {
    echo "Usage: $0 [OPTIONS] SEARCH_WORD FILE_NAME"
    echo ""
    echo "This script searches for a word in a file."
    echo ""
    echo "Options:"
    echo "  -n    Show line numbers with the matching lines."
    echo "  -v    Invert the match (show lines that do NOT contain the search word)."
    echo "  --help   Show this help message and exit."
    echo ""
    echo "Example:"
    echo "  ./mygrep.sh -n hello testfile.txt"
    exit 1
}

# Loop to read all options provided by the user (like -n, -v, --help)
while [[ "$1" == -* ]]; do
    case "$1" in
        -n) line_numbers=true ;;  # If -n is found, enable line_numbers
        -v) invert_match=true ;;  # If -v is found, enable invert_match
        --help) show_help ;;      # If --help is found, display help and exit
        *) echo "Unknown option: $1"; show_help ;; # If unknown option, show error and help
    esac
    shift  # Move to the next argument
done

# After options are processed, the next two arguments should be: search word and file name
search_word="$1"
file="$2"

# Check if the user provided the search word
if [[ -z "$search_word" ]]; then
    echo "Error: You must provide a search word."
    show_help
fi

# Check if the user provided the file name
if [[ -z "$file" ]]; then
    echo "Error: You must provide a file name."
    show_help
fi

# Check if the file actually exists in the system
if [[ ! -f "$file" ]]; then
    echo "Error: File '$file' does not exist."
    exit 1
fi

# Now based on the options, build the correct grep command and run it
if $invert_match; then
    if $line_numbers; then
        # Case: invert match + show line numbers
        grep -inv "$search_word" "$file"
    else
        # Case: invert match only
        grep -iv "$search_word" "$file"
    fi
else
    if $line_numbers; then
        # Case: normal match + show line numbers
        grep -in "$search_word" "$file"
    else
        # Case: normal match only
        grep -i "$search_word" "$file"
    fi
fi

