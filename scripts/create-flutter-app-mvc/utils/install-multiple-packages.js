const { executeCommand } = require("./execute-command");

exports.installMultiplePackages = async (packages) => {
  await executeCommand(`flutter pub add ${packages.join(" ")}`);
};
