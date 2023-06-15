const chalk = require("chalk");
const ora = require("ora");

const {
  installMultiplePackages,
} = require("../utils/install-multiple-packages");

exports.installAdditionalPackages = async (
  packagesToInstall,
  devPackagesToInstall
) => {
  const additionalPackagesSpinner = ora(
    `Installing packages: ${packagesToInstall.join(
      ", "
    )} \n ${devPackagesToInstall.join(", ")}`
  ).start();
  console.log("\n");

  await installMultiplePackages(packagesToInstall, devPackagesToInstall);

  additionalPackagesSpinner.succeed(
    chalk.green(`Packages installed successfully!`)
  );
};
