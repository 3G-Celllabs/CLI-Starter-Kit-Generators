#!/usr/bin/env node
const chalk = require("chalk");
const inquirer = require("inquirer");

const { copyNecessaryFiles } = require("./main/copy-necessary-files");
const { createNecessaryFiles } = require("./main/create-necessary-files");
const { endScript } = require("./main/end-script");
const { generateFolders } = require("./main/generate-folders");
const {
  initializeFlutterProject,
} = require("./main/initialize-flutter-project");
const { initializeGit } = require("./main/initialize-git");
const {
  installAdditionalPackages,
} = require("./main/install-additional-packages");
const { installDefaultPackages } = require("./main/install-default-packages");
const { updatePubspec } = require("./main/update-pubspec");

const { ask } = require("./utils/ask");

const additionalPackages = [
  { name: "get", checked: false, url: "routes/routes.dart" },
  { name: "http", checked: false, url: "services/http_service.dart" },
  { name: "mqtt_client", checked: false, url: "services/mqtt_service.dart" },
  {
    name: "flutter_reactive_ble",
    checked: false,
    url: "services/ble_service.dart",
  },
  {
    name: "freezed",
    checked: false,
    url: null,
  },
];

const packagesToInstall = [];
const devPackagesToInstall = [];

const argv = require("yargs/yargs")(process.argv.slice(2))
  .option("name", {
    alias: "n",
    describe: "app name",
    string: true,
  })
  .option("all", {
    alias: "a",
    describe: "with all (getx, mqtt, http, ble) packages",
    boolean: true,
  })
  .option("get", {
    alias: "g",
    describe: "with GetX",
    boolean: true,
  })
  .option("http", {
    alias: "h",
    describe: "with http",
    boolean: true,
  })
  .option("mqtt", {
    alias: "m",
    describe: "with mqtt",
    boolean: true,
  })
  .option("ble", {
    alias: "b",
    describe: "with ble",
    boolean: true,
  })
  .option("freezed", {
    alias: "f",
    describe: "with freezed model",
    boolean: true,
  })
  .option("no-pub", {
    alias: "np",
    describe: "cancel updating pubspec.yaml file",
    boolean: true,
  })
  .option("no-git", {
    alias: "ng",
    describe: "do not initialize git",
    boolean: true,
  })
  .usage("$0 [option] [value]")
  .help().argv;

(async () => {
  const projectName = argv.name ?? (await ask("Enter app name: (ex: my_app)"));

  await initializeFlutterProject(projectName);

  generateFolders(projectName);

  await installDefaultPackages();

  if (!argv.noPub) {
    await updatePubspec();
  }

  await handleInstallAdditionalPackages();

  await createNecessaryFiles(projectName);

  await copyNecessaryFiles(additionalPackages);

  if (!argv.noGit) {
    await initializeGit(projectName);
  }

  endScript();
})();

async function handleInstallAdditionalPackages() {
  if (argv.all) {
    additionalPackages.forEach((package) => {
      package.checked = true;
      packagesToInstall.push(package.name);
    });
    handleFreezed();
  } else if (argv.get || argv.http || argv.mqtt || argv.ble || argv.freezed) {
    additionalPackages.forEach((package) => {
      if (checkIfselectedPackageIsSameAsCurrent(package)) {
        package.checked = true;
        if (package.name == "freezed") {
          handleFreezed();
        } else {
          packagesToInstall.push(package.name);
        }
      }
    });
  } else {
    await inquirer
      .prompt([
        {
          type: "checkbox",
          message: "Select packages to install:",
          name: "packages",
          choices: additionalPackages,
        },
      ])
      .then((answers) => {
        answers.packages.forEach((answer) => {
          additionalPackages.forEach((package) => {
            if (package.name === answer) {
              package.checked = true;
              if (package.name == "freezed") {
                handleFreezed();
              } else {
                packagesToInstall.push(package.name);
              }
            }
          });
        });
      })
      .catch((error) => {
        console.error(chalk.red(`Error: ${error}`));
        process.exit(1);
      });
  }
  await installAdditionalPackages(packagesToInstall, devPackagesToInstall);
}

function checkIfselectedPackageIsSameAsCurrent(package) {
  return (
    (argv.get && package.name === "get") ||
    (argv.http && package.name === "http") ||
    (argv.mqtt && package.name === "mqtt_client") ||
    (argv.ble && package.name === "flutter_reactive_ble") ||
    (argv.fre && package.name === "freezed")
  );
}

function handleFreezed() {
  packagesToInstall.push("freezed_annotation");
  packagesToInstall.push("json_annotation");

  devPackagesToInstall.push("build_runner");
  devPackagesToInstall.push("freezed");
  devPackagesToInstall.push("json_serializable");
}
