#!/usr/bin/env bash

[[ -z "$1" ]] && root="/home/loric/kube_resources" || root="$1"
[[ -d "$root/backup" ]] || mkdir -p "$root/backup"
mv $root/* "$root/backup"

contexts=$(kubectl config get-contexts -o name)
  
for c in $contexts; do
  echo "Querying context $c"
  all="$(kubectl get all --all-namespaces --no-headers --context $c)"
  echo "$all" | while read line; do
    ns="$(echo $line | awk '{print $1}')"
    name="$(echo $line | awk '{print $2}')"
    dir=$(dirname $root/$c/$ns/$name)
    [[ -d "$dir" ]] || mkdir -p "$dir"
    echo "Writing $root/$c/$ns/$name.yaml"
    kubectl get $name --context $c --namespace $ns -o yaml > $root/$c/$ns/$name.yaml
  done
done
