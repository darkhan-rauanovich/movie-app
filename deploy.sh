#!/usr/bin/env sh

set -e

npm run build

cd dist

git init
git add -A
git commit -m 'New Deployment'
git push -f git@github.com:darkhan-rauanovich/movie-app.git master:gh-pages

cd -