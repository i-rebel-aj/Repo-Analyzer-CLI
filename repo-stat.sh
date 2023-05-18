#!/bin/bash
json_output="["
for arg in "$@"; do
  repo_json="{\"path\":\"$arg\",\"stats\":"
  output=$(git -C "$arg" shortlog -sn)
  repo_stat_json="{"
  while IFS=$'\t' read -r commits author; do
    # Get the number of lines added and deleted by the author
    lines_added=$(git -C "$arg" log --author="$author" --oneline --shortstat | awk '/files? changed/ {s+=$4} /insertions?/ {s+=$4} END {print s}')
    lines_deleted=$(git -C "$arg" log --author="$author" --oneline --shortstat | awk '/files? changed/ {s+=$6} /deletions?/ {s+=$6} END {print s}')
    repo_stat_json+="\"$author\":{\"contributions\":$commits,\"lines_added\":${lines_added:-0},\"lines_deleted\":${lines_deleted:-0} },"
  done <<< "$output"
  repo_stat_json="${repo_stat_json%,}" # Remove trailing comma
  repo_stat_json+="}"
  repo_json+="$repo_stat_json}"
  json_output+="$repo_json,"
done
json_output="${json_output%,}"
json_output+="]"
#echo $json_output

# Print the JSON output
echo "$json_output" >> output.json
