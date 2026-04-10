#!/bin/bash

NAMESPACE=sync-waves

# Start watching each resource in a separate background process.
kubectl -n $NAMESPACE get pod -w | sed 's/^/[POD] /' &
kubectl -n $NAMESPACE get svc -w | sed 's/^/[SVC] /' &
kubectl -n $NAMESPACE get cm -w | sed 's/^/[CM] /' &

# Optionally, keep the script running so background processes don't end.
wait
