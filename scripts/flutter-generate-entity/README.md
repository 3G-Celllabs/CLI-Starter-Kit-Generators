# Generate Flutter Entity (Version 1.0.0)

<br/>

### Instructions:

This is a node script that helps generating entity for flutter app. That is, controllers, services, models etc., are bundled into entity folders such as Home, Login etc.,

First thing first, (If you don't have it) Install node from [Node.js](https://nodejs.org/en/download/)

Go to script folder and install dependencies using

```
npm install
```

Then, move to the folder where you wish to setup your flutter application and run the script using

```
node ./${YOUR-SCRIPT_LOCATION}/flutter-generate-entity.js ${entity_name}
```

**NOTE:** Run the script from flutter app.

This will run the script and first evaluates entity_name. If it is valid, a new folder will be created with all the entity folders and files such as, models/, states/, controller, service etc.,

**NOTE:** You can modify the script if you are sure about what you are doing to match your preferences.
