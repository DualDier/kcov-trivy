#!/usr/bin/env bats

load '../app.sh'

@test "adds two numbers" {
  result="$(add_numbers 2 3)"
  [ "$result" -eq 5 ]
}

