const chalk = require("chalk");

exports.changeWorkingDirectory = (dir, showLog = false) => {
  try {
    process.chdir(`${dir}`);
    if (showLog) console.log(chalk.yellow(`Moved in to ${dir} directory.`));
  } catch (err) {
    console.error(chalk.red(`Unable to change dir: ${err}`));
    process.exit(1);
  }
};
