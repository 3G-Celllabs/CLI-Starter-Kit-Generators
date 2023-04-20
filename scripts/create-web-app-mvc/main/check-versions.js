const util = require("util");
const exec = util.promisify(require("child_process").exec);
const chalk = require("chalk");

exports.checkVersions = async (type) => {
  if (type === "ionic") {
    const { stdout, stderr } = await exec(`ionic version`);
    if (stderr) {
      return true;
    }
    if (stdout < "7.0.0") {
      console.error(chalk.red(`Minimum Ionic version required: 7.0.0`));
      return true;
    }
  }

  const { stdout, stderr } = await exec(`ng version`);
  if (stderr) {
    return true;
  }
  const ngVersion = stdout.split("Angular CLI: ")[1].split("\n")[0];
  if (ngVersion < "15.0.0") {
    console.error(chalk.red(`Minimum Angular version required: 15.0.0`));
    return true;
  }
  return false;
};
