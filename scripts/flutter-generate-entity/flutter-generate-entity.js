const fs = require("fs");
const chalk = require("chalk");

let entityName = "";

function evaluateArgs() {
  entityName = process.argv[2];
  if (
    !entityName.match(/^[a-zA-Z_]*$/) ||
    entityName[entityName.length - 1] === "_"
  ) {
    console.error(
      chalk.red(
        `Invalid entity name. Only names in flutter pattern are supported`
      )
    );
    process.exit(1);
  } else {
    generateFolders();
  }
}

function generateFolders() {
  changeWorkingDirectory("lib/");
  createFolder(entityName);
  changeWorkingDirectory(entityName, true);
  console.log("\n");

  createModels();
  createStates();
  createWidgets();
  addBindings();
  addController();
  addScreen();
  addService();
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
    )}Screen({super.key});\n@override \nWidget build(BuildContext context){\nreturn const Scaffold(body: SafeArea(child: Center(child: Text('${capitalize(
      entityName
    )} Screen'),),),);\n}\n}`
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

function changeWorkingDirectory(dir, showLog = false) {
  try {
    process.chdir(`${dir}`);
    if (showLog) console.log(chalk.yellow(`Moved in to ${dir} directory.`));
  } catch (err) {
    console.error(chalk.red(`Unable to change dir: ${err}`));
    process.exit(1);
  }
}

function createFolder(folder) {
  try {
    fs.mkdirSync(`${folder}`, { recursive: true });
    console.log(chalk.yellow(`Created ${folder} directory.`));
  } catch (e) {
    console.error(chalk.red(`Unable to create ${folder} directory.`));
  }
}

function addFilesWithContent(fileName, content) {
  fs.writeFileSync(fileName, content);
  console.log(chalk.yellow(`Added ${fileName} file`));
}

function capitalize(word) {
  let newWord = "";
  word.split("_").forEach((value) => {
    newWord += value[0].toUpperCase() + value.slice(1);
  });
  return newWord;
}

function endScript() {
  console.log("\n");
  console.log(chalk.green("SUCCESS:: Entity created successfully!"));
  process.exit(0);
}

async function main() {
  evaluateArgs();

  endScript();
}

main();
