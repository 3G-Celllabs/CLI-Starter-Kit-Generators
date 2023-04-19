const util = require("util");
const exec = util.promisify(require("child_process").exec);
const chalk = require("chalk");

exports.executeCommand = async (command, showLogs = true) => {
  try {
    const { stdout, stderr } = await exec(command);

    if (stderr && !stderr.includes("Installing")) {
      // in Angular. when Git initialization fails. it shows error. but it is not a problem.
      // The error text in that instance includes "Installing".
      console.error(chalk.red(`stderr: ${stderr}`));
      process.exit(1);
    }
    if (showLogs) {
      console.log(chalk.white(`${stdout}`));
    }
  } catch (e) {
    console.error(chalk.red(`${e}`));
    process.exit(1);
  }
};
