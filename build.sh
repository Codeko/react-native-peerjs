#!/bin/bash

exec 2>&1

rm -rf dist/ peerjs/
git clone https://github.com/peers/peerjs --branch v1.4.7 --single-branch peerjs
cd peerjs
git apply ../decoupling.diff
cd ../
node_modules/.bin/parcel build --no-source-maps peerjs/lib/exports.ts
cat imports.js dist/peerjs.min.js > dist/react-native-peerjs.js
rm dist/peerjs.min.js

echo "Done. dist/react-native-peerjs.js"

