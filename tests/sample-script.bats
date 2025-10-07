#!/usr/bin/env bats
# tests/sample-script.bats - Unit tests for sample-script.sh

# Load the script to test
setup() {
    # Get the directory of the test file
    DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
    # Source the script from parent directory
    source "$DIR/../sample-script.sh"
}

@test "greet function with name" {
    result="$(greet "Alice")"
    [ "$result" = "Hello, Alice!" ]
}

@test "greet function without name defaults to World" {
    result="$(greet)"
    [ "$result" = "Hello, World!" ]
}

@test "add function with two numbers" {
    result="$(add 5 7)"
    [ "$result" -eq 12 ]
}

@test "add function with zero" {
    result="$(add 10 0)"
    [ "$result" -eq 10 ]
}

@test "add function defaults to zero when no args" {
    result="$(add)"
    [ "$result" -eq 0 ]
}

@test "to_uppercase converts text correctly" {
    result="$(to_uppercase "hello world")"
    [ "$result" = "HELLO WORLD" ]
}

@test "to_uppercase handles empty string" {
    result="$(to_uppercase "")"
    [ "$result" = "" ]
}

@test "file_exists returns true for existing file" {
    # Create a temporary file
    temp_file=$(mktemp)
    run file_exists "$temp_file"
    [ "$status" -eq 0 ]
    [[ "$output" =~ "File exists" ]]
    rm "$temp_file"
}

@test "file_exists returns false for non-existing file" {
    run file_exists "/tmp/nonexistent-file-12345.txt"
    [ "$status" -eq 1 ]
    [[ "$output" =~ "File not found" ]]
}