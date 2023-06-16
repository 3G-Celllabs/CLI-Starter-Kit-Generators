# Create Flutter App (Version 1.1.0)

## uses default folder structure

<br/>

### Instructions:

This is a node script that helps with initializing your flutter app with default folder structure where controllers, models, views, services etc., are split into their respective folders.

First thing first, (If you don't have it) **Install node** from [Node.js](https://nodejs.org/en/download/)

Go to **script folder** and install dependencies using

```
npm install
```

#### Instructions to setup the script to run from anywhere. Skip to [Alternate](#alt), if not needed

The script can run directly from your terminal. For that to happen, you need to link it by running

```
npm link
```

Once linked, you can run the script by calling `flutter-create-mvc` from any path
<br/>

### Below are the commands:

**Move to the folder** where you want to create the flutter app and run

(use, **-a** to generate all the folders and files. If you wish to choose what to include don't add **-a**)

```
flutter-create-mvc
```

To see help menu, run

```
flutter-create-mvc --help

Output:

flutter-create-mvc [option] [value]
Options:
      --version       Show version number                              [boolean]
  -n, --name          mvc name                                       [string]
  -a, --all           with all (getx, mqtt, http, ble) packages        [boolean]
  -g, --get           with GetX                                        [boolean]
  -h, --http          with http                                        [boolean]
  -m, --mqtt          with mqtt                                        [boolean]
  -b, --ble           with ble                                         [boolean]
      --no-pub, --np  cancel updating pubspec.yaml file                [boolean]
      --no-git, --ng  do not initialize git                            [boolean]
      --help          Show help                                        [boolean]
```

So, for example, to create flutter app, `my_app` with getx, mqtt packages. You can run below command:

```
flutter-create-mvc -n my_app -g -m
```

**\*NOTE**: You can just run `flutter-create-mvc` to provide/choose necessary options\*

<br/>

<a id="alt"></a>

### Alternatively, you can skip linking and directly run below commands:

**Move to the folder** where you wish to setup your flutter application and run the script using

To see all the options. Run

```
node ./${YOUR_SCRIPT_LOCATION}/create-flutter-app-mvc.js --help
```

```
node ./${YOUR_SCRIPT_LOCATION}/create-flutter-app-mvc.js
```

### Description:

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
https://github.com/3G-Celllabs/CLI-Starter-Kit-Generators/tree/main/flutter
```

which will help with development and help you understand how to structure the app. Based on your what packages you choose to install above, It will even copy the service files with base implementation.

8. Flutter applications are not initialized with git by default. Hence, the script will also initialize git, to provide a base reference.

9. Once everything is done and script exits, Please, don't forget to import files in main.dart, routes.dart (This is not setup by default. Because, we cannot determine the package name until the script is run.) also add the assets/.env, assets/images to assets in pubspec.yaml (This is not done before hand because pubspec is indentation specific.)

**NOTE:** You can modify the script if you are sure about what you are doing to match your preferences.
