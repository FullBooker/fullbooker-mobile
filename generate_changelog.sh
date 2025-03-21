#!/bin/bash
temp_file=$(mktemp)

# All commits
total_commits=$(git rev-list --count HEAD)

# Collect all commits, oldest to newest, format with version headers
git log --reverse --pretty=format:'__COMMIT__%n%s%n%b%n' | awk -v total="$total_commits" '
BEGIN {
  version = 1;
  RS="__COMMIT__\n";
  ORS="";
}
{
  if (NF == 0) next;

  n = split($0, lines, "\n");
  subject = lines[1];
  body = "";

  for (i = 2; i <= n; i++) {
    if (length(lines[i]) > 0) {
      body = body "  - " lines[i] "\n";
    }
  }

  printf "## 0.0.%d\n\n- %s\n%s\n", version, subject, body;
  version++;
}' > "$temp_file"

{
  echo "# CHANGELOG"
  awk 'BEGIN { RS=""; ORS="\n\n" } { lines[NR] = $0 } END { for (i = NR; i >= 1; i--) print lines[i] }' "$temp_file"
} > CHANGELOG.md

rm "$temp_file"
