const chalk = require("chalk");
const ora = require("ora");

const { executeCommand } = require("../utils/execute-command");

const fs = require("fs");

exports.initializeWebProject = async (answer, type) => {
  if (answer.length < 1) {
    ora("").fail(chalk.red("Error: Please provide a project name."));
    process.exit(1);
  } else if (!answer.match(/^[a-z]+(?:_[a-z]+)*$/g)) {
    ora("").fail(
      chalk.red("Error: Invalid app name. Only kebab(_) case words.")
    );
    process.exit(1);
  } else if (fs.readdirSync(process.cwd()).includes(answer)) {
    ora("").fail(chalk.red("Error: Project already exists."));

    process.exit(1);
  } else {
    console.log("\n");
    projectName = answer.trim();
    await handleProjectInitialization(projectName, type);
  }
  console.log("\n");
};

async function handleProjectInitialization(projectName, type) {
  let initializeAppSpinner = ora("");
  try {
    if (type === "ionic") {
      initializeAppSpinner = ora("Initializing Ionic project").start();
      await executeCommand(
        `ionic start ${projectName} blank --type=angular --capacitor`
      );
      initializeAppSpinner.succeed(
        chalk.green(
          `Ionic project:: ${projectName} is initialized successfully.`
        )
      );
    } else if (type === "angular") {
      initializeAppSpinner = ora("Initializing Angular project").start();
      await executeCommand(
        `ng new ${projectName} --routing --style=scss --strict`
      );
      initializeAppSpinner.succeed(
        chalk.green(
          `Angular project:: ${projectName} is initialized successfully.`
        )
      );
    } else {
      initializeAppSpinner.fail(chalk.red(`Invalid project type.`));
    }
  } catch (error) {
    initializeAppSpinner.fail(chalk.red(`Error occured: ${error}`));
  }
}
