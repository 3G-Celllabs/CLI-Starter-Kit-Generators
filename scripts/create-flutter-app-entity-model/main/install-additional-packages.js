const chalk = require("chalk");
const ora = require("ora");

const {
  installMultiplePackages,
} = require("../utils/install-multiple-packages");

exports.installAdditionalPackages = async (packagesToInstall) => {
  const additionalPackagesSpinner = ora(
    `Installing packages: ${packagesToInstall.join(", ")}`
  ).start();
  console.log("\n");

  await installMultiplePackages(packagesToInstall);

  additionalPackagesSpinner.succeed(
    chalk.green(`Packages installed successfully!`)
  );
};
