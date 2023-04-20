# Create Web App (Version 1.0.0)

## uses default folder structure

**NOTE**: Use `Angular 15+`, `Ionic 7+` for generating apps.

**INFO**:Generated apps follow standalone components [Read more here](https://angular.io/guide/standalone-components)

<hr/>

### Instructions:

This is a node script that helps with initializing your web (Ionic|Angular) app with default folder structure where controllers, models, views, services etc., are split into their respective folders.

First thing first, (If you don't have it) Install node from [Node.js](https://nodejs.org/en/download/)

Download and Go to script folder and install dependencies using

```
npm install
```

#### Instructions to setup the script to run from anywhere:

Skip to [Alternate](#alt), if not needed

The script can run directly from your terminal. For that to happen, you need to link it by running

```
npm link
```

Once linked, you can run the script by calling `web-create-mvc` from any path
<br/>

### Below are the commands:

Move to the folder where you want to create the web app and run

(use, **-a** to generate all the folders and files. If you wish to choose what to include don't add **-a**)

```
web-create-mvc -t ionic
```

To see help menu, run

```
web-create-mvc --help

Output:

web-create-mvc [--type|-t] [ionic|angular] [option] [value]

Options:
      --version  Show version number                                   [boolean]
  -t, --type     app type [ionic|angular]                    [string] [required]
  -n, --name     app name                                               [string]
  -a, --all      with all (crypto-js, ngx-mqtt, lodash) packages       [boolean]
  -c, --crypto   with crypto-js, for encryption and decryption.        [boolean]
  -l, --lodash   with lodash, for deep cloning, comparing objects.     [boolean]
  -m, --mqtt     with mqtt, for mqtt communication.                    [boolean]
      --help     Show help                                             [boolean]
```

So, for example, to create ionic app, `my_app` with mqtt, lodash packages. You can run below command:

```
web-create-mvc -t ionic -n my_app -m -l
```

**\*NOTE**: You can just run `web-create-mvc -t [ionic|angular]` to provide/choose necessary options\*

<br/>

<a id="alt"></a>

### Alternatively, you can skip linking and directly run below commands:

Move to the folder where you wish to setup your web application and run the script using

To see all the options. Run

```
node ./${YOUR-SCRIPT_LOCATION}/create-web-app-mvc.js --help
```

```
node ./${YOUR-SCRIPT_LOCATION}/create-web-app-mvc.js -t [ionic|angular]
```

### Description:

1. This will run the script and the first prompt within the script would be to name your web app (follow underscore pattern, eg: dummy_app).

2. Once the ionic/angular app is setup. It will create folders such as components, services etc.,

3. Next the script will ask you to choose addiitional packages that could be helpful.
   Current options: 'mqtt', 'crypto', 'lodash'. choose based on your need.

4. Once these packages are installed, The script will create some default files. such as, styles, env files that will help with application development.

5. It will also copy some example/default files from

```
https://github.com/3G-Celllabs/CLI-Starter-Kit-Generators/tree/main/web
```

which will help with development and help you understand how to structure the app. Based on your what packages you choose to install above, It will even copy the service files with base implementation.

6. Git will be updated with all the new files as base.

7. Once everything is done and script exits.

**NOTE:** You can modify the script if you are sure about what you are doing to match your preferences.
