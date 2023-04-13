const chalk = require("chalk");
const ora = require("ora");

const {
  executeCommand,
} = require("../../create-flutter-app-entity-model/utils/execute-command");

const fs = require("fs");

exports.initializeFlutterProject = async (answer) => {
  if (answer.length < 1) {
    ora("").fail(chalk.red("Error: Please provide a project name."));
    process.exit(1);
  } else if (!answer.match(/^[a-z]+(?:_[a-z]+)*$/g)) {
    ora("").fail(
      chalk.red(
        "Error: Invalid app name. Only small case letters and underscores are allowed."
      )
    );
    process.exit(1);
  } else if (fs.readdirSync(process.cwd()).includes(answer)) {
    ora("").fail(chalk.red("Error: Project already exists."));

    process.exit(1);
  } else {
    console.log("\n");
    projectName = answer.trim();
    const initializeFlutterSpinner = ora(
      "Initializing Flutter project"
    ).start();
    try {
      await executeCommand(`flutter create ${projectName}`);
      initializeFlutterSpinner.succeed(
        chalk.green(
          `Flutter project:: ${projectName} is initialized successfully.`
        )
      );
    } catch (error) {
      initializeFlutterSpinner.fail(chalk.red(`Error occured: ${error}`));
    }
  }
  console.log("\n");
};
