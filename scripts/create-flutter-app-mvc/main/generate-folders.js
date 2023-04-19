const folders = [
  "assets/images/bitmaps",
  "assets/images/svgs",
  "lib/bindings",
  "lib/controllers",
  "lib/helpers",
  "lib/models/states",
  "lib/routes",
  "lib/services",
  "lib/views/screens",
  "lib/views/widgets/common",
];

const { changeWorkingDirectory } = require("../utils/change-working-directory");
const { createFolder } = require("../utils/create-folder");

exports.generateFolders = (projectName) => {
  changeWorkingDirectory(projectName, true);
  console.log("\n");

  folders.forEach((folder) => createFolder(folder));
};
