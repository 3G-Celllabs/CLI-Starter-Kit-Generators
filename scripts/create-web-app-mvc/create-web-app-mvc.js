#!/usr/bin/env node
const chalk = require("chalk");
const inquirer = require("inquirer");

const { copyNecessaryFiles } = require("./main/copy-necessary-files");
const { endScript } = require("./main/end-script");
const { evaluateFoldersToCopy } = require("./main/evaluate-folders-to-copy");
const { generateFolders } = require("./main/generate-folders");
const { initializeWebProject } = require("./main/initialize-web-project");
const {
  installAdditionalPackages,
} = require("./main/install-additional-packages");

const { ask } = require("./utils/ask");
const { updateGit } = require("./main/update-git");
const { executeCommand } = require("./utils/execute-command");
const { delay } = require("./utils/delay");
const { checkVersions } = require("./main/check-versions");

const additionalPackages = [
  { name: "crypto-js", checked: false, url: "routes/routes.dart" },
  { name: "lodash", checked: false, url: "services/http_service.dart" },
  { name: "ngx-mqtt", checked: false, url: "services/mqtt_service.dart" },
];

const packagesToInstall = [];

const argv = require("yargs/yargs")(process.argv.slice(2))
  .option("type", {
    alias: "t",
    describe: "app type [ionic|angular]",
    string: true,
  })
  .option("name", {
    alias: "n",
    describe: "app name",
    string: true,
  })
  .option("all", {
    alias: "a",
    describe: "with all (crypto-js, ngx-mqtt, lodash) packages",
    boolean: true,
  })
  .option("crypto", {
    alias: "c",
    describe: "with crypto-js, for encryption and decryption.",
    boolean: true,
  })
  .option("lodash", {
    alias: "l",
    describe: "with lodash, for deep cloning, comparing objects.",
    boolean: true,
  })
  .option("mqtt", {
    alias: "m",
    describe: "with mqtt, for mqtt communication.",
    boolean: true,
  })
  // .option("ble", {
  //   alias: "b",
  //   describe: "with ble",
  //   boolean: true,
  // })
  .demandOption(["type"], "Please specify the type of the app.")
  .usage("$0 [--type|-t] [ionic|angular] [option] [value]")
  .help().argv;

(async () => {
  if (
    argv.type.toLowerCase() !== "ionic" &&
    argv.type.toLowerCase() !== "angular"
  ) {
    console.error(chalk.red(`Error: Invalid type of app. [ionic|angular]`));
    process.exit(1);
  }

  const versionsBelowRequirement = await checkVersions(argv.type.toLowerCase());

  if (versionsBelowRequirement) {
    console.error(chalk.red(`Error: Minimum platform requirements not met.`));
    process.exit(1);
  } else {
    console.log(chalk.green(`Minimum platform requirements met.`));
  }

  const projectName = argv.name ?? (await ask("Enter app name: (ex: my_app)"));

  await initializeWebProject(projectName, argv.type.toLowerCase());

  generateFolders(projectName, argv.type.toLowerCase());

  await handleInstallAdditionalPackages();

  await copyNecessaryFiles(argv.type.toLowerCase());

  const isCryptoInstalled = packagesToInstall.includes("crypto-js");
  const isMqttInstalled = packagesToInstall.includes("ngx-mqtt");

  await evaluateFoldersToCopy(
    argv.type.toLowerCase(),
    isCryptoInstalled,
    isMqttInstalled
  );
  await delay(3000);

  await updateGit(projectName);

  endScript(argv.type.toLowerCase());
})();

async function handleInstallAdditionalPackages() {
  if (argv.all) {
    additionalPackages.forEach((package) => {
      package.checked = true;
      packagesToInstall.push(package.name);
    });
  } else if (argv.crypto || argv.lodash || argv.mqtt) {
    additionalPackages.forEach((package) => {
      if (checkIfselectedPackageIsSameAsCurrent(package)) {
        package.checked = true;
        packagesToInstall.push(package.name);
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
        for (const answer of answers.packages) {
          for (const package of additionalPackages) {
            if (package.name === answer) {
              package.checked = true;
              packagesToInstall.push(package.name);
            }
          }
        }
      })
      .catch((error) => {
        console.error(chalk.red(`Error: ${error}`));
        process.exit(1);
      });
  }
  await installAdditionalPackages(packagesToInstall);
  if (packagesToInstall.includes("crypto-js")) {
    await executeCommand("npm install -D @types/crypto-js");
  }
}

function checkIfselectedPackageIsSameAsCurrent(package) {
  return (
    (argv.crypto && package.name === "crypto-js") ||
    (argv.lodash && package.name === "lodash") ||
    (argv.mqtt && package.name === "ngx-mqtt")
  );
}
