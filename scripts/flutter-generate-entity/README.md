# Generate Flutter Entity (Version 1.1.0)

<br/>

## Instructions:

This is a node script that helps generating entity for flutter app. That means controllers, services, models etc., are bundled into entity folders such as Home, Login etc.,

First thing first, (If you don't have it) Install node from [Node.js](https://nodejs.org/en/download/)

Go to script folder and install dependencies using

```
npm install
```

#### Instructions to setup the script to run from anywhere. Skip to [Alternate](#alt), if not needed

The script can run directly from your terminal. For that to happen, you need to link it by running

```
npm link
```

Once linked, you can run the script by calling `flutter-gen` from any path
<br/>

### Below are the commands:

Move to the flutter app folder and run

(use, **-a** to generate all the folders and files. If you wish to choose what to include don't add **-a**)

```
flutter-gen -n [entity_name] -a
    or
flutter-gen --name [entity_name] --all
```

To see help menu, run

```
flutter-gen --help

Output:

flutter-generate-entity.js [--name|-n] [value] [option] [value]
Options:
      --version  Show version number                                   [boolean]
  -n, --name     Entity name                                          [required]
  -a, --all      Generate all the folders and files                    [boolean]
      --help     Show help                                             [boolean]
```

<a id="alt"></a>

### Alternatively, you can skip linking and directly run below commands:

Move to the folder where you wish to setup your flutter application and run the script using

(use, **-a** to generate all the folders and files. If you wish to choose what to include dont add **-a**)

```
node ./${YOUR-SCRIPT_LOCATION}/flutter-generate-entity.js -n [entity_name] -a
    or
node ./${YOUR-SCRIPT_LOCATION}/flutter-generate-entity.js --name [entity_name] --all
```

To open help, run

```
node ./${YOUR-SCRIPT_LOCATION}/flutter-generate-entity.js --help
```

**NOTE:** Run the script from flutter app.

This will run the script and first evaluates entity_name. If it is valid, a new folder will be created with all the entity folders and files such as, models/, states/, controller, service etc.,

**NOTE:** You can modify the script if you are sure about what you are doing to match your preferences.
