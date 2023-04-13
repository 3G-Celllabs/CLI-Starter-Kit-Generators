const { addFilesWithContent } = require("../utils/add-files-with-content");
const { changeWorkingDirectory } = require("../utils/change-working-directory");

exports.createNecessaryFiles = async (projectName) => {
  // Create constants file with app name.
  changeWorkingDirectory("lib/helpers/");
  const appName = projectName
    .split("_")
    .map((value) => value[0].toUpperCase() + value.slice(1))
    .join(" ");

  addFilesWithContent(
    "constants.dart",
    `class Constants{\n\tstatic String appName = '${appName}';\n}\n`
  );

  // Create assets file with logo.
  addFilesWithContent(
    "assets.dart",
    `class Images{\n\tstatic String logo = '';\n}\n`
  );

  changeWorkingDirectory(`../`);
  // Back to Lib folder
};
