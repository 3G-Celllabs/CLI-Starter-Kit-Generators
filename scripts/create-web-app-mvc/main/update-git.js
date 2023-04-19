const chalk = require("chalk");
const ora = require("ora");

const { changeWorkingDirectory } = require("../utils/change-working-directory");
const { executeCommand } = require("../utils/execute-command");
const {
  splitDirectoryBasedOnPlatform,
} = require("../utils/split-directory-based-on-platform");

exports.updateGit = async (projectName) => {
  if (splitDirectoryBasedOnPlatform().pop() !== projectName) {
    changeWorkingDirectory(`../../`);
  }

  await executeCommand("git config core.autocrlf false");

  await executeCommand("git add .");

  await executeCommand(
    'git commit -m "Initialize project with recommended setup."'
  );
  console.log("\n");
  ora("Initializing Git")
    .start()
    .succeed(chalk.green("Git Initialized successfully"));
};
