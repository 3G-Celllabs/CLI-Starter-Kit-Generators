const chalk = require("chalk");
const fs = require("fs");

exports.addFilesWithContent = (fileName, content) => {
  fs.writeFileSync(fileName, content);
  console.log(chalk.yellow(`Added ${fileName} file`));
};
