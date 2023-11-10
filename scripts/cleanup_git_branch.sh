if [[ -z "$1" ]]; then
   echo "Branch name empty $1"
   exit 1
fi

if test "$1" = "dev" -o "$1" = "staging" -o "$1" = "production" -o "$1" = "main" -o "$1" = "master"
then
    echo "Attempt to remove protected branch $1"
    exit 1
fi

existed_in_local=$(git branch --list $1)
if [[ -z ${existed_in_local} ]]; then
    echo "Local branch not exist, skipping"
else
    git branch -D $1
fi

existed_in_remote=$(git ls-remote --heads origin $1)
if [[ -z ${existed_in_remote} ]]; then
    echo "Remote branch not exist, skipping"
else
    git push origin --delete $1
fi
