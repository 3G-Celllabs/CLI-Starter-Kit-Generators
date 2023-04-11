#!/usr/bin/env node
const fs = require("fs");
const chalk = require("chalk");
const ora = require("ora");
const inquirer = require("inquirer");
const {
  createFolder,
  changeWorkingDirectory,
  addFilesWithContent,
  capitalize,
} = require("./utils/utilities");

const argv = require("yargs/yargs")(process.argv.slice(2))
  .option("name", {
    alias: "n",
    describe: "Entity name",
  })
  .option("all", {
    alias: "a",
    describe: "Generate all the folders and files",
    boolean: true,
  })
  .demandOption(["name"], "Please specify the name of the entity.")
  .help().argv;

let entityName = "";

const types = [
  { name: "models", checked: false },
  { name: "states", checked: false },
  { name: "widgets", checked: false },
  { name: "binding", checked: false },
  { name: "controller", checked: false },
  { name: "screen", checked: true },
  { name: "service", checked: false },
];

(async () => {
  await evaluateArgsAndGenerate();

  endScript();
})();

async function evaluateArgsAndGenerate() {
  if (!argv.name.match(/[a-zA-Z]+(?:_[a-zA-Z]+)*/g)) {
    ora("").fail(
      chalk.red(
        `Invalid entity name. Only kebab case (my_app) names are supported.`
      )
    );
    process.exit(1);
  } else {
    entityName = argv.name;
    await generateFolders();
  }
}

async function generateFolders() {
  changeWorkingDirectory("lib/");
  if (
    fs.existsSync(
      process.platform === "win32"
        ? `${process.cwd()}\\${entityName}`
        : `${process.cwd()}/${entityName}`
    )
  ) {
    ora("").fail(
      chalk.red(`Entity already exists. Please choose a different name.`)
    );
    process.exit(1);
  } else {
    createFolder(entityName);
    changeWorkingDirectory(entityName, true);
    console.log("\n");
    if (argv.all) {
      const packages = [
        "models",
        "states",
        "widgets",
        "binding",
        "controller",
        "screen",
        "service",
      ];
      evaluateAnswer(packages);
    } else {
      await inquirer
        .prompt([
          {
            type: "checkbox",
            message: "Select what to include:",
            name: "packages",
            choices: types,
          },
        ])
        .then((answer) => {
          evaluateAnswer(answer.packages);
        })
        .catch((error) => {
          ora("").fail(chalk.red(`Error: ${error}`));
          process.exit(1);
        });
    }
  }
}

function evaluateAnswer(packages) {
  packages.forEach((package) => {
    if (package === "models") {
      createModels();
    }
    if (package === "states") {
      createStates();
    }
    if (package === "widgets") {
      createWidgets();
    }
    if (package === "binding") {
      addBindings();
    }
    if (package === "controller") {
      addController();
    }
    if (package === "screen") {
      addScreen();
    }
    if (package === "service") {
      addService();
    }
  });
}

function createModels() {
  createFolder("models");
}

function createStates() {
  createFolder("states");
}

function createWidgets() {
  createFolder("widgets");
}

function addBindings() {
  addFilesWithContent(
    `${entityName}_binding.dart`,
    `import 'package:get/get.dart';\n\nclass ${capitalize(
      entityName
    )}Binding extends Bindings{\n\t@override\n\tvoid dependencies(){}\n\t}\n`
  );
  console.log(chalk.yellow(`Added ${entityName}_binding.dart file.`));
}

function addController() {
  addFilesWithContent(
    `${entityName}_controller.dart`,
    `import 'package:get/state_manager.dart';\n\nclass ${capitalize(
      entityName
    )}Controller extends GetxController {}`
  );
  console.log(chalk.yellow(`Added ${entityName}_controller.dart file.`));
}

function addScreen() {
  addFilesWithContent(
    `${entityName}_screen.dart`,
    `import 'package:flutter/material.dart';\n\nclass ${capitalize(
      entityName
    )}Screen extends StatelessWidget {\nconst ${capitalize(
      entityName
    )}Screen({super.key});\n@override \nWidget build(BuildContext context){\nreturn const Scaffold(body: SafeArea(child: Placeholder(),),);\n}\n}`
  );

  console.log(chalk.yellow(`Added ${entityName}_screen.dart file.`));
}

function addService() {
  addFilesWithContent(
    `${entityName}_service.dart`,
    `class ${capitalize(entityName)}Service {}`
  );
  console.log(chalk.yellow(`Added ${entityName}_service.dart file.`));
}

function endScript() {
  console.log("\n");
  ora("").succeed(chalk.green(` Entity ${entityName} created successfully!`));
  process.exit(0);
}
