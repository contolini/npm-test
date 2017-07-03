#!/bin/bash
set -e

# If NPM env variables are set and we're in Travis
if [[ -n "$NPM_USERNAME" ]] && [[ -n "$NPM_PASSWORD" ]] && [[ -n "$NPM_EMAIL" ]] && [[ -n "$TRAVIS" ]]; then
  echo "Logging into npm..."
  echo -e "${NPM_USERNAME}\n${NPM_PASSWORD}\n${NPM_EMAIL}\n" | npm login
  echo "Adding git credentials..."
  git config user.name "CFPBot"
  git config user.email "CFPBot@users.noreply.github.com"
fi
