#!/usr/bin/env bats

load test_helper
# NOTE: Redirect output to /dev/null to avoid errors from the anonymous
# function pattern during `bats` runs.
load ../functions > /dev/null 2>&1

###############################################################################
# hello()
###############################################################################

_HELLO_HELP="$(
    cat <<HEREDOC
Usage:
  hello
  hello -h | --help

Options:
  -h --help  Display this usage information.

Description:
  Say hello.
HEREDOC
)"

@test "\`hello\` with no arguments returns status 0." {
  run hello
  [[ "${status}" -eq 0 ]]
}

@test "\`hello\` with no arguments prints a string." {
  run hello
  [[ "${output}" == "Hello." ]]
}

@test "\`hello -h\` returns status 0." {
  run hello -h
  [[ "${status}" -eq 0 ]]
}

@test "\`hello -h\` prints help." {
  run hello -h
  _compare "${_HELLO_HELP}" "${output}"
  [[ "${output}" == "${_HELLO_HELP}" ]]
}

@test "\`hello --help\` returns status 0." {
  run hello
  [[ "${status}" -eq 0 ]]
}

@test "\`hello --help\` prints help." {
  run hello --help
  _compare "${_HELLO_HELP}" "${output}"
  [[ "${output}" == "${_HELLO_HELP}" ]]
}

###############################################################################
# hi()
###############################################################################

_HI_HELP="$(
    cat <<HEREDOC
Usage:
  hi
  hi --all
  hi -h | --help

Options:
  --all      Say "hi" to everyone.
  -h --help  Display this usage information.

Description:
  Say hi.
HEREDOC
)"

@test "\`hi\` with no arguments returns status 0." {
  run hi
  [[ "${status}" -eq 0 ]]
}

@test "\`hi\` with no arguments prints a string." {
  run hi
  [[ "${output}" == "Hi!" ]]
}

@test "\`hi -h\` returns status 0." {
  run hi -h
  [[ "${status}" -eq 0 ]]
}

@test "\`hi -h\` prints help." {
  run hi -h
  _compare "${_HI_HELP}" "${output}"
  [[ "${output}" == "${_HI_HELP}" ]]
}

@test "\`hi --help\` returns status 0." {
  run hi --help
  [[ "${status}" -eq 0 ]]
}

@test "\`hi --help\` prints help." {
  run hi --help
  _compare "${_HI_HELP}" "${output}"
  [[ "${output}" == "${_HI_HELP}" ]]
}

@test "\`hi --all\` returns status 0." {
  run hi --all
  [[ "${status}" -eq 0 ]]
}

@test "\`hi --all\` prints a string." {
  run hi --all
  _compare "Hi, everyone!" "${output}"
  [[ "${output}" == "Hi, everyone!" ]]
}

###############################################################################
# hey()
###############################################################################

_HEY_HELP="$(
    cat <<HEREDOC
Usage:
  hey
  hey --all
  hey -h | --help

Options:
  --all      Say "hey" to everyone.
  -h --help  Display this usage information.

Description:
  Say hey.
HEREDOC
)"

@test "\`hey\` with no arguments returns status 0." {
  run hey
  [[ "${status}" -eq 0 ]]
}

@test "\`hey\` with no arguments prints a string." {
  run hey
  [[ "${output}" == "Hey!" ]]
}

@test "\`hey -h\` returns status 0." {
  run hey -h
  [[ "${status}" -eq 0 ]]
}

@test "\`hey -h\` prints help." {
  run hey -h
  _compare "${_HEY_HELP}" "${output}"
  [[ "${output}" == "${_HEY_HELP}" ]]
}

@test "\`hey --help\` returns status 0." {
  run hey --help
  [[ "${status}" -eq 0 ]]
}

@test "\`hey --help\` prints help." {
  run hey --help
  _compare "${_HEY_HELP}" "${output}"
  [[ "${output}" == "${_HEY_HELP}" ]]
}

@test "\`hey --all\` returns status 0." {
  run hey --all
  [[ "${status}" -eq 0 ]]
}

@test "\`hey --all\` prints a string." {
  run hey --all
  _compare "Hey, everyone!" "${output}"
  [[ "${output}" == "Hey, everyone!" ]]
}
