# Create Flutter App (Version 1.0.2)

## uses default folder structure

<br/>

### Instructions:

This is a node script that helps with initializing your flutter app with default folder structure where controllers, models, views, services etc., are split into their respective folders.

First thing first, (If you don't have it) Install node from [Node.js](https://nodejs.org/en/download/)

Go to script folder and install dependencies using

```
npm install
```

Then, move to the folder where you wish to setup your flutter application and run the script using

```
node ./${YOUR-SCRIPT_LOCATION}/create-flutter-app-default.js
```

1. This will run the script and the first prompt within the script would be to name your flutter app (follow underscore pattern, eg: dummy_app).

2. Once the flutter app is setup. It will create folders such as controllers, services etc.,

3. Then, It will install some flutter packages such as "flutter_dotenv", "uuid", "intl" that will help with app development. (If you feel like you don't need any of the plugins. Please, remove them from pubspec.yaml and run flutter pub get, once the script is finished.)

4. Next, It will update pubspec.yaml file with flutter_icons default script shown below.

```
flutter_icons:
  android: "launcher_icon"
  ios: true
  image_path: "assets/images/bitmaps/round-logo.png"
  min_sdk_android: 21 # android min sdk min:16, default 21`;
```

Please, update the image_path with your logo path.

Using the above script, we can generate app icons, by running (when we need)

```
flutter pub run flutter_launcher_icons
```

5. Next the script will ask you to choose addiitional packages that could be helpful.
   Current options: 'get', 'http', 'mqtt_client', 'flutter_reactive_ble'. Enter either 'y' or 'n' based on your need.

6. Once these packages are installed, The script will create some default files. such as, constants.dart that will help with application development.

7. It will also copy some example/default files from

```
https://gitlab.com/pranay.prasad/utilities/-/raw/main/flutter/
```

which will help with development and help you understand how to structure the app. Based on your what packages you choose to install above, It will even copy the service files with base implementation.

8. Flutter applications are not initialized with git by default. Hence, the script will also initialize git, to provide a base reference.

9. Once everything is done and script exits, Please, don't forget to import files in main.dart, routes.dart (This is not setup by default. Because, we cannot determine the package name until the script is run.) also add the assets/.env, assets/images to assets in pubspec.yaml (This is not done before hand because pubspec is indentation specific.)

**NOTE:** You can modify the script if you are sure about what you are doing to match your preferences.
