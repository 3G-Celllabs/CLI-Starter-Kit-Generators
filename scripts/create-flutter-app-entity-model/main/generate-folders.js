const topLevelFolders = [
  "assets/images/bitmaps",
  "assets/images/svgs",
  "lib/home",
  "lib/splash",
];

const defaultFolders = [
  "controllers",
  "models",
  "services",
  "states",
  "widgets",
];

const { changeWorkingDirectory } = require("../utils/change-working-directory");
const { createFolder } = require("../utils/create-folder");

exports.generateFolders = () => {
  changeWorkingDirectory(projectName, true);
  console.log("\n");

  topLevelFolders.forEach((folder) => createFolder(folder));

  defaultFolders.forEach((folder) => createFolder(`lib/utilities/${folder}`));
};
