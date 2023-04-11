const fs = require("fs");
const chalk = require("chalk");
const ora = require("ora");

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

function changeWorkingDirectory(dir, showLog = false) {
  try {
    process.chdir(`${dir}`);
    if (showLog) console.log(chalk.yellow(`Moved in to ${dir} directory.`));
  } catch (err) {
    ora("").fail(chalk.red(`Unable to change dir: ${err}`));
    process.exit(1);
  }
}

module.exports = {
  createFolder,
  addFilesWithContent,
  capitalize,
  changeWorkingDirectory,
};
