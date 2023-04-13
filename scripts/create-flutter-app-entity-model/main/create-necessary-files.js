const { addFilesWithContent } = require("../utils/add-files-with-content");
const { changeWorkingDirectory } = require("../utils/change-working-directory");

exports.createNecessaryFiles = async (projectName) => {
  console.log("\n");
  const appName = projectName
    .split("_")
    .map((value) => value[0].toUpperCase() + value.slice(1))
    .join(" ");

  changeWorkingDirectory("lib/utilities/");

  // Create assets file with logo.
  addFilesWithContent(
    "assets.dart",
    `class Images{\n\tstatic String logo = '';\n}\n`
  );
  // Create constants file with app name.
  addFilesWithContent(
    "constants.dart",
    `class Constants{\n\tstatic String appName = '${appName}';\n}\n`
  );

  changeWorkingDirectory(`../`);
  // Back to Lib folder
};
