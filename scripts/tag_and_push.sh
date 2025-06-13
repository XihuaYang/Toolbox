#!/bin/bash

VERSION=$1
MESSAGE=$2
if [ -z "$VERSION" ]; then
    echo "Missing version"
    exit 1
fi
if [ -z "$MESSAGE" ]; then
    git tag "$VERSION"
else
    git tag -a "$VERSION" -m "$MESSAGE"
fi
git push origin "$VERSION"