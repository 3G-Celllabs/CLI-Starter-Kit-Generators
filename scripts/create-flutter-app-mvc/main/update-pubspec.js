const chalk = require("chalk");
const fs = require("fs");
const ora = require("ora");

exports.updatePubspec = async () => {
  console.log("\n");

  const updatePubSpinner = ora(`Updating Pubspec`).start();

  return new Promise((resolve, reject) => {
    const dataToAppend = `
  assets:
    - assets/.env
    - assets/images

flutter_icons:
  android: "launcher_icon"
  ios: true
  image_path: "assets/images/bitmaps/logo.png"
  min_sdk_android: 21 # android min sdk min:16, default 21`;

    fs.appendFile("pubspec.yaml", dataToAppend, "utf8", (err) => {
      if (err) {
        updatePubSpinner.fail(chalk.red(`Error: ${err}`));
        reject(err);
      }
      updatePubSpinner.succeed(
        chalk.green(`pubspec.yaml updated successfully.`)
      );
      console.log("\n");
      resolve(null);
    });
  });
};
