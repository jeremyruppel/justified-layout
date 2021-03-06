#!/usr/bin/env bash
set -ex

# Babelify
echo "Babelifying..."
babel src --out-dir lib

# Browserify
echo "Browserifying..."
browserify -r ./lib/index.js:justified-layout > ./dist/justified-layout.js; uglifyjs ./dist/justified-layout.js -o ./dist/justified-layout.min.js

# Add the license back to the uglified file
echo "Licensify..."
echo '// Copyright 2016 Yahoo Inc.
// Licensed under the terms of the MIT license. Please see LICENSE file in the project root for terms.
' | cat - dist/justified-layout.min.js > temp && mv temp dist/justified-layout.min.js