#!/bin/bash

exec 2>&1

rm -rf dist/ peerjs/
git clone https://github.com/Codeko/peerjs.git --branch v1.4.7-react-native --single-branch peerjs
cd peerjs
# git apply ../decoupling.diff
../node_modules/.bin/parcel build --no-source-maps lib/exports.ts -d ../dist --out-file peerjs.min.js
cd ../
cat imports.js dist/peerjs.min.js > dist/react-native-peerjs.js
rm dist/peerjs.min.js

echo "Done. dist/react-native-peerjs.js"

