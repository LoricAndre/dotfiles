alias i := install
alias a := apply
alias aa := auto-apply

install *args:
	./bin/dots install {{ args }}

apply *args:
	./bin/dots apply {{ args }}

auto-apply:
  #!/usr/bin/env bash
  root=$(git rev-parse --show-toplevel)
  dirs=""
  for file in $(git ls-files --other --modified --exclude-standard); do
    if [[ $file == .* ]] || [[ ! $file == */* ]]; then
      echo "Skipping $file"
    else
      echo "Applying $file"
      dir=$(realpath $file --relative-to $root | cut -d'/' -f1)
      if [[ ! $dirs == *"$dir"* ]]; then
        dirs="$dirs $dir"
      fi
    fi
  done
  ./bin/dots apply $dirs