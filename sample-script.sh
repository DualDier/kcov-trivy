#!/bin/bash
# sample-script.sh - A simple shell script with functions to test

set -euo pipefail

# Function to greet a user
greet() {
    local name="${1:-World}"
    echo "Hello, ${name}!"
}

# Function to add two numbers
add() {
    local num1="${1:-0}"
    local num2="${2:-0}"
    echo $((num1 + num2))
}

# Function to check if a file exists
file_exists() {
    local filepath="$1"
    if [[ -f "$filepath" ]]; then
        echo "File exists: ${filepath}"
        return 0
    else
        echo "File not found: ${filepath}"
        return 1
    fi
}

# Function to convert text to uppercase
to_uppercase() {
    local text="${1:-}"
    echo "${text}" | tr '[:lower:]' '[:upper:]'
}

# Main execution - only run if script is executed directly (not sourced)
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    echo "Running sample script..."
    greet "Developer"
    echo "2 + 3 = $(add 2 3)"
    echo "Uppercase: $(to_uppercase "hello world")"
fi