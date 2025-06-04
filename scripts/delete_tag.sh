#!/bin/bash

VERSION=$1
if [ -z "$VERSION" ]; then
    echo "Missing version"
    exit 1
fi
git tag -d "$VERSION"
git push origin --delete "$VERSION"