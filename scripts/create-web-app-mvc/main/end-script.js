const chalk = require("chalk");
const fs = require("fs");
const ora = require("ora");

exports.endScript = (type) => {
  if (type === "ionic") {
    fs.rmSync("home", { recursive: true, force: true });
    ora("").succeed(chalk.green(`Home folder deleted successfully.`));
  }
  console.log("\n");
  ora("").succeed(chalk.green(" App is ready for development!"));
  process.exit(0);
};
