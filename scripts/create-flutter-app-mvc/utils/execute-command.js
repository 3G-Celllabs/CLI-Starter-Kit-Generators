const util = require("util");
const exec = util.promisify(require("child_process").exec);
const chalk = require("chalk");

exports.executeCommand = async (command, showLogs = false) => {
  try {
    const { stdout, stderr } = await exec(command);

    if (stderr) {
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
