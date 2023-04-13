const chalk = require("chalk");
const ora = require("ora");

const {
  installMultiplePackages,
} = require("../utils/install-multiple-packages");

const defaultPackages = [
  "flutter_dotenv",
  "flutter_launcher_icons",
  "google_fonts",
  "intl",
  "logger",
  "uuid",
];

exports.installDefaultPackages = async () => {
  console.log("\n");
  const installSpinner = ora(
    `Installing packages: ${defaultPackages.join(", ")}`
  ).start();

  await installMultiplePackages(defaultPackages);

  installSpinner.succeed(chalk.green(`Packages installed successfully!`));
};
