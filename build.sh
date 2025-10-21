#!/bin/bash

exec 2>&1

rm -rf dist/ peerjs/
git clone https://github.com/peers/peerjs --branch v1.4.7 --single-branch peerjs
cd peerjs
git apply ../decoupling.diff
cd ../
parcel build
cat imports.js dist/exports.js > dist/react-native-peerjs.js
rm dist/exports.js
rm -rf peerjs

echo "Done. dist/react-native-peerjs.js"

