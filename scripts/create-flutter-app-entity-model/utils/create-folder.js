const ora = require("ora");
const fs = require("fs");
const chalk = require("chalk");

exports.createFolder = (folder) => {
  const createFolderSpinner = ora(`Creating ${folder} directory`).start();

  try {
    fs.mkdirSync(`${folder}`, { recursive: true });
    createFolderSpinner.succeed(chalk.green(`${folder} created successfully.`));
  } catch (e) {
    createFolderSpinner.fail(
      chalk.red(`Unable to create ${folder} directory.`)
    );
    process.exit(1);
  }
};
