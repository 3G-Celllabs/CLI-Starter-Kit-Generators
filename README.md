# CLI Starter Kit Generator

## Utility CLI scripts to generate flutter, angular, ionic apps.

This repo contains utility cli scripts built in node that can be used to generate flutter, ionic or angular apps with necessary configuration.

The scripts can be found inside the `/scripts` folder and every script contains its own **README** file that includes detailed instructions on how to run it.

`/flutter` folder contains dart utility classes that assist in generating the flutter app.

`/web` folder contains `/angular`, `/ionic` folders which in itself contains utility files that assist in generating the required web app.

## Before you start

1.You would need to either **clone** the scripts (Preferable) or **download** it before continuing any further.

- To clone, run

```
git clone https://github.com/3G-Celllabs/CLI-Starter-Kit-Generators.git
```

in your desired location.

- To download, go to [CLI-Starter-Kit-Generators](https://github.com/3G-Celllabs/CLI-Starter-Kit-Generators.git) and click on **Code** dropdown. Select **Download ZIP**. Extract in desired location.

Then, move to required script folder and follow the internal README.md instructions.

## Flutter Scripts

There are two different scripts that can be used to generate flutter apps.

1. [create-flutter-app-mvc](./scripts/create-flutter-app-mvc/README.md): This will generate a flutter app with controllers, services, models folders as top level citizens(Basic MVC).

2. [create-flutter-app-entity-model](./scripts/create-flutter-app-entity-model/README.md): This will generate a flutter app implementing new entity pattern. That is, every entity such as home, login etc., will contain their own controllers, services, models. The main philosophical reason for doing this is every entity should be self contained(depending on its own classes and maybe some common classes).

There is even a utility script called [flutter-generate-entity](./scripts/flutter-generate-entity/README.md) which can be used to generate a entity/folder containing its own controllers, services etc., This idea is borrowed from Nest, Angular cli.

For further information, please go through the **README** files in scripts/

<br>

## Angular, Ionic Scripts

1. [create-web-app-mvc](./scripts/create-web-app-mvc/README.md): This will generate a web (Ionic|angular) app with components, services, models folders as top level citizens(Basic MVC).
