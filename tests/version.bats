#!/usr/bin/env bats

@test "devtools version prints version" {
  run ../bin/devtools version
  [ "$status" -eq 0 ]
  [[ "$output" == dev-tools* || "$output" == devtools* ]]
} 