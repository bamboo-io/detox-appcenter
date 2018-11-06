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

echo "Installing dependencies for detox tests..."
npm install

echo "Running 'xcrun simctl list' to list supported devices."
xcrun simctl list

echo "Building the project for Detox tests..."
npx detox build --configuration ios.sim.release

### ERROR FROM APP CENTER BUILD of detox-appcenter repo cloned to:
# https://github.com/sebastianmalcolm/detox-appcenter
# 
#** BUILD SUCCEEDED **
#
#Executing Detox tests...
#node_modules/.bin/mocha e2e --opts e2e/mocha.opts --configuration ios.sim.release   --cleanup   --grep :android: --invert     --artifacts-location "artifacts/ios.sim.release.2018-11-06 13-41-59Z"
#
#
#detox INFO:  [DetoxServer.js] server listening on localhost:50047...
#detox ERROR: [index.js] Error: Can't find a simulator to match with "iPhone 7 Plus", run 'xcrun simctl list' to list your supported devices.
#      It is advised to only state a device type, and not to state iOS version, e.g. "iPhone 7"
#    at AppleSimUtils.findDevicesUDID (/Users/vsts/agent/2.141.1/work/1/s/node_modules/detox/src/devices/AppleSimUtils.js:50:13)
#    at <anonymous>
#  err: Error: Can't find a simulator to match with "iPhone 7 Plus", run 'xcrun simctl list' to list your supported devices.
#        It is advised to only state a device type, and not to state iOS version, e.g. "iPhone 7"
#      at AppleSimUtils.findDevicesUDID (/Users/vsts/agent/2.141.1/work/1/s/node_modules/detox/src/devices/AppleSimUtils.js:50:13)
#      at <anonymous>
#  1) "before all" hook
#
#  0 passing (2m)
#  1 failing
#
#  1) "before all" hook:
#     Error: Timeout of 120000ms exceeded. For async tests and hooks, ensure "done()" is called; if returning a Promise, ensure it resolves.
     
    
echo "Executing Detox tests..."
npx detox test --configuration ios.sim.release --cleanup
