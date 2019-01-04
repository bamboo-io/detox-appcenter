# Detox on AppCenter React Native Demo Project

## Background
This sample project demonstrates running Detox tests prior to a regular MS [AppCenter](https://appcenter.ms/) build
* on React 16.3.1 and React Native 0.55.4
* with Detox 9.1.2 built by Xcode 10.1 [![Build status](https://build.appcenter.ms/v0.1/apps/e0fa00d3-cd36-4825-900b-8de41c6c29fa/branches/detox_9.1.2-xcode_10.1/badge)](https://appcenter.ms)
* and Mocha 5.2.0 test runner, currently

This project has also run Detox tests successfully, on React 16.4.1 and React Native 0.56.0, in Sebastian Malcolm's AppCenter account with:-
* Detox 9.1.2 built by Xcode 10.1 [![Build status](https://build.appcenter.ms/v0.1/apps/b941d881-bc98-48d1-8bc6-8ddf76856b36/branches/detox_9.1.2-xcode_10.1/badge)](https://appcenter.ms)
* Detox 9.1.2 built by Xcode 9.4.1 [![Build status](https://build.appcenter.ms/v0.1/apps/b941d881-bc98-48d1-8bc6-8ddf76856b36/branches/detox_9.1.2/badge)](https://appcenter.ms)
* Detox 9.0.4 built by Xcode 10.1 [![Build status](https://build.appcenter.ms/v0.1/apps/b941d881-bc98-48d1-8bc6-8ddf76856b36/branches/detox_9.0.4-xcode_10.1/badge)](https://appcenter.ms)
* Detox 9.0.4 built by Xcode 9.4.1 [![Build status](https://build.appcenter.ms/v0.1/apps/b941d881-bc98-48d1-8bc6-8ddf76856b36/branches/detox_9.0.4/badge)](https://appcenter.ms)

## Requirements
Make sure you have installed:
* Xcode (tested with Xcode 9.4.1 and Xcode 10.1)
* xcpretty (`gem install xcpretty` - https://github.com/supermarin/xcpretty)
* Node.js (`brew install node@8` or `nvm install`. Node version 8.X or newer is _required_)
* react-native dependencies:
   * watchman is installed (`brew install watchman`)

See software installation commands in `appcenter-post-clone.sh` for any other dependencies that may need to be installed to build and run this project anywhere other than in MS [AppCenter](https://appcenter.ms/).

### Step 1: Install Dependencies
* Run `npm install`.

## To test Release build of your app
### Step 2: Build
* Build the demo project
 ```sh
 npx detox build --configuration ios.sim.release
 ```

### Step 3: Test
* Run tests on the demo project
 ```sh
 npx detox test --configuration ios.sim.release
 ```
 This action will open a new simulator and run the tests on it.

## To test Debug build of your app
### Step 2: Build
* Build the demo project
 ```sh
 npx detox build --configuration ios.sim.debug
 ```

### Step 3: Test
 * start react-native packager
 ```sh
 npm run start
 ```

 * Run tests on the demo project
 ```sh
 npx detox test --configuration ios.sim.debug
 ```
 This action will open a new simulator and run the tests on it.
