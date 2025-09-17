name: Minify JSON

on:
  push:
    paths:
      - "*.json"
      - "data/*.json"
      - "translations/*.json"

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3

      - name: Install jq
        run: sudo apt-get update && sudo apt-get install -y jq

      - name: Minify JSON
        run: |
          folders=(. data translations)
          for folder in "${folders[@]}"; do
            for file in "$folder"/*.json; do
              [[ "$file" == *.min.json || ! -f "$file" ]] && continue
              min_file="${file%.json}.min.json"
              jq -c . "$file" > "$min_file"
              echo "Generated $min_file"
            done
          done

      - name: Commit minified JSON
        run: |
          git config user.name "github-actions"
          git config user.email "github-actions@github.com"
          git add "*.min.json" "data/*.min.json" "translations/*.min.json"
          git diff-index --quiet HEAD || git commit -m "Auto-update minified JSON"
          git push
