const folders = [
  "src/app/components",
  "src/app/guards",
  "src/app/helpers",
  "src/app/models",
  "src/app/modules",
  "src/app/pages",
  "src/app/services",
];
const { changeWorkingDirectory } = require("../utils/change-working-directory");
const { createFolder } = require("../utils/create-folder");

exports.generateFolders = (projectName, type) => {
  changeWorkingDirectory(projectName, true);
  console.log("\n");

  createFolder("releases/web");

  if (type === "ionic") {
    createFolder("releases/android");
    createFolder("releases/ios");
  } else {
    createFolder("src/assets/icon");
    createFolder("src/environments");
  }
  for (const folder of folders) {
    createFolder(folder);
  }
};
