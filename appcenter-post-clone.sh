#!/usr/bin/env bash
APPLESIMUTILS_VERSION=0.5.22

echo "Installing applesimutils..."
mkdir simutils
cd simutils
curl https://raw.githubusercontent.com/wix/homebrew-brew/master/AppleSimulatorUtils-${APPLESIMUTILS_VERSION}.tar.gz -o applesimutils.tar.gz
tar xzvf applesimutils.tar.gz
sh buildForBrew.sh .
cd ..
export PATH=$PATH:./simutils/build/Build/Products/Release

echo "Installing correct node version..."
export HOMEBREW_NO_AUTO_UPDATE=1
brew uninstall node@6
brew install node@8
brew link node@8 --force --overwrite

echo "Identifying installed version of Node.js..."
node --version

echo "Installing dependencies for detox tests..."
npm install

echo "Running 'xcrun simctl list' to list supported devices."
xcrun simctl list

echo "Building the project for Detox tests..."
npx detox build --configuration ios.sim.release

echo "Executing Detox tests..."
npx detox test --configuration ios.sim.release --cleanup
