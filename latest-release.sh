#!/usr/bin/env bash

releases=$(curl -L -H "Accept: application/vnd.github+json" https://api.github.com/repos/apache/kafka/tags )

echo $releases | jq -r '.[] | select(.name | match("[0-9]+.[0-9]+.[0-9]+$")) | .name' | head -1