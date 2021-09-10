#!/bin/bash
set -x
pattern=$1
namespace=$2
count=$(kubectl get pod -n $namespace |grep -E $pattern|wc -l)
if [ $count -gt "0" ]; then
  echo "unexpected Pods found: $count"
  kubectl get pod -n $namespace |grep -E $pattern | awk '{ print $1 }' | xargs kubectl delete pod -n $namespace --grace-period=0 --force=true
fi