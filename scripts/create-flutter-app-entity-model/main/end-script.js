const chalk = require("chalk");
const ora = require("ora");

exports.endScript = () => {
  console.log("\n");
  console.log(
    chalk.magentaBright.bgYellowBright.bold(
      " Few files need to be imported in main.dart, routes.dart "
    )
  );
  console.log("\n");
  ora("").succeed(chalk.green(" App is ready for development!"));
  process.exit(0);
};
