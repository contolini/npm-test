#!/bin/bash
set -e

export COMMIT_AUTHOR_NAME="$(git log -1 $TRAVIS_COMMIT --pretty="%aN")"

# If this is Travis CI AND
if [[ -n "$TRAVIS" ]] &&
      # This is a pull request OR 
   [[ "$TRAVIS_PULL_REQUEST" != "false" ||
      # The commit author is CFPBot
      "$COMMIT_AUTHOR_NAME" == "CFPBot" ]];
# Then echo some variables and abort everything
then
  echo "TRAVIS: ${TRAVIS}"
  echo "TRAVIS_PULL_REQUEST: ${TRAVIS_PULL_REQUEST}"
  echo "TRAVIS_BRANCH: ${TRAVIS_BRANCH}"
  echo "GH_PROD_BRANCH: ${GH_PROD_BRANCH}"
  echo "GH_DEV_BRANCH: ${GH_DEV_BRANCH}"
  echo "TRAVIS_NODE_VERSION: ${TRAVIS_NODE_VERSION}"
  echo "COMMIT_AUTHOR_NAME: ${COMMIT_AUTHOR_NAME}"
  echo "Abort!"
  exit 0;
fi

echo "TRAVIS: ${TRAVIS}"
echo "TRAVIS_PULL_REQUEST: ${TRAVIS_PULL_REQUEST}"
echo "TRAVIS_BRANCH: ${TRAVIS_BRANCH}"
echo "GH_PROD_BRANCH: ${GH_PROD_BRANCH}"
echo "GH_DEV_BRANCH: ${GH_DEV_BRANCH}"
echo "TRAVIS_NODE_VERSION: ${TRAVIS_NODE_VERSION}"
echo "COMMIT_AUTHOR_NAME: ${COMMIT_AUTHOR_NAME}"
echo "Success!"
