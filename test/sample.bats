#!/usr/bin/env bats

setup(){
  mkdir test/hoge
  touch test/hoge/fuga.txt
}
teardown(){
  rm -rf test/hoge
}

@test "invoking wc" {
  result="$(echo 'hoge' | wc -l)"
  [ "$result" -eq 1 ]
}

@test "invoking ls with a nonexistent file prints an error" {
  run ls hoge
  [ "$status" -eq 1 ]
  [ "$output" = "ls: hoge: No such file or directory" ]
}

@test "invoking sample.sh" {
  run sh ./lib/sample.sh
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "this is sample.sh" ]
}

load test_helper
@test "assert with global variable" {
  run ls -la
  [ "$status" -eq "$SUCCESS_CODE" ]
}