#!/bin/bash
out_file='./out_file'
json_output="["
for arg in "$@"; do
  repo_json="{\"path\":\"$arg\",\"stats\":"
  output=$(git -C "$arg" shortlog -sn)
  repo_stat_json="{"
  while IFS=$'\t' read -r commits author; do
    repo_stat_json+="\"$author\":$commits,"
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
