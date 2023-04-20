const chalk = require("chalk");
const ora = require("ora");

exports.endScript = (type) => {
  console.log("\n");
  ora("").succeed(
    chalk.green(`${type.toUpperCase()}: App is ready for development!`)
  );
  process.exit(0);
};
