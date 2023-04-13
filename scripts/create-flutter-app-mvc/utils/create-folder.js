const chalk = require("chalk");
const fs = require("fs");
const ora = require("ora");

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
