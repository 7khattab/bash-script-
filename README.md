# Simple Bash Script: Word Search in a File

## 📌 Overview
This script is a simple **bash tool** designed to search for a specific word inside a file.  
It allows additional options like:
- Showing line numbers with matches.
- Inverting the match to display lines that **do not** contain the search word.
- Displaying a help message explaining how to use the script.

This project was built to practice handling command-line arguments, conditional statements, and basic scripting logic.

---

## ✨ Features
- **Case-insensitive search** (`grep -i` by default).
- **Optional line numbers** (`-n` option).
- **Invert match option** (`-v` option).
- **User-friendly help message** (`--help` option).
- **Validations** to check missing arguments and file existence.
- **Clear error messages** for wrong usage.

---

## 🛠 Steps I Followed (Breaking the Big Task into Smaller Tasks)

1. **Initialization:**
   - Created two variables `line_numbers` and `invert_match` to store the option flags.
   
2. **Help Function:**
   - Created a `show_help()` function that explains the usage, available options, and an example.

3. **Options Parsing:**
   - Used a `while` loop with `case` statement to read options `-n`, `-v`, and `--help`.
   - Shifted positional arguments after reading options.

4. **Argument Validation:**
   - Checked if the user entered both the search word and the file name.
   - If missing, display an error and show the help message.

5. **File Existence Check:**
   - Verified if the specified file actually exists using `[ -f "$file" ]`.

6. **Building the Search Command:**
   - Based on the user-selected options (`-n`, `-v`), built the appropriate `grep` command dynamically.

7. **Executing the Command:**
   - Ran the `grep` command with the right options based on user input.

---

## 📋 Usage

### Basic Syntax
```bash
./mygrep.sh [OPTIONS] SEARCH_WORD FILE_NAME
