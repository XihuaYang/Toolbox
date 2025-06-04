#!/bin/bash

VERSION=$1
MESSAGE=$2
if [ -z "$VERSION" ] || [ -z "$MESSAGE" ]; then
    echo "Missing version or message"
    exit 1
fi
git tag -a "$VERSION" -m "$MESSAGE"
git push origin "$VERSION"