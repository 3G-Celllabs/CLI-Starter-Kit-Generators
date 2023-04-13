# Utilities

## Utility scripts to generate flutter, angular, ionic apps.

This repo contains utility scripts built in node that can be used to generate flutter, ionic or angular apps.

Scripts are inside the scripts folder and every script contains its own **README** file that includes instructions on how to run it.

Flutter folder contains dart utility classes that assist in generating the flutter app.

## Flutter Scripts

There are two different scripts that can be used to generate flutter apps.

1. `create-flutter-app-default`: This will generate a flutter app with controllers, services, models folders as top level citizens(Basic MVC).

2. `create-flutter-app-entity-model`: This will generate a flutter app implementing new entity pattern. That is, every entity such as home, login etc., will contain their own controllers, services, models. The main philosophical reason for doing this is every entity should be self contained(depending on its own classes and maybe some common classes).

There is even a utility script called `flutter-generate-entity` which can be used to generate a entity/folder containing its own controllers, services etc., This idea is borrowed from Nest, Angular cli.

For further information, please go through the **README** files in scripts/

<br>

## Angular, Ionic Scripts

Coming Soon.
