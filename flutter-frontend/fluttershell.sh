#!/bin/bash
## Copyright (c) 2023 Oracle and/or its affiliates.
## Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl/

export k8s_pod=$1
for line in $(kubectl get pods --all-namespaces | \
  grep $k8s_pod | awk '{print $2}'); do
    echo "kubectl exec -ti $line -n $2 sh"
    kubectl exec -ti $line -n healthai sh
done