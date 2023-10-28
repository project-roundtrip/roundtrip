#!/usr/bin/env bash

set -e

rm -rf dist/
mkdir -p dist

echo 'Building for web ...'
godot --no-window --export-release "HTML5" dist/index.html
cp enable-threads.js dist/
echo 'done.'

echo 'Building for linux ...'
godot --no-window --export-release 'Linux/X11' dist/hack-to-the-root.x86_64
chmod a+x dist/hack-to-the-root.x86_64
echo 'done.'

echo 'Building for Windows ...'
godot --no-window --export-release 'Windows Desktop' dist/hack-to-the-root.exe
echo 'done.'
