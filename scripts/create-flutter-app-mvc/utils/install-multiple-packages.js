const { executeCommand } = require("./execute-command");

exports.installMultiplePackages = async (packages, devPackages = []) => {
  let dependencies = packages.length > 0 ? packages.join(" ") : "";
  let devDependencies = devPackages.length > 0 ? devPackages.join(" ") : "";
  if (dependencies) {
    await executeCommand(`flutter pub add ${dependencies} `);
  }
  if (devDependencies) {
    await executeCommand(`flutter pub add --dev ${devDependencies}`);
  }
};
