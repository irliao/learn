#!/bin/sh

# https://stackoverflow.com/questions/21753340/script-with-non-option-and-option-arguments

OPTIND=1
nonOptionArgs=()
while [ $# -gt 0 ] && [ "$1" != "--" ]; do
  while getopts "a:b:c:def" opt; do
    case $opt in
       a) echo "found a - $OPTARG" ;;
       b) echo "found b - $OPTARG" ;;
       c) echo "found c - $OPTARG" ;;
       d) echo "found d" ;;
       e) echo "found e" ;;
       f) echo "found f" ;;
       *) echo "Invalid option: -$OPTARG" >&2; exit 1;;
    esac
  done
  shift $((OPTIND-1))
  unset OPTIND

  while [ $# -gt 0 ] && ! [[ "$1" =~ ^- ]]; do
    nonOptionArgs=("${nonOptionArgs[@]}" "$1")
    shift
  done
done

if [ "$1" == "--" ]; then
  shift
  nonOptionArgs=("${nonOptionArgs[@]}" "$@")
fi

echo "nonOptionArgs: ${#nonOptionArgs[@]}"
echo "nonOptionArgs ${nonOptionArgs[0]}"
echo "nonOptionArgs ${nonOptionArgs[1]}"
echo "nonOptionArgs ${nonOptionArgs[2]}"
echo "nonOptionArgs ${nonOptionArgs[3]}"
