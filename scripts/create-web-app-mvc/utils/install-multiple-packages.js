const { executeCommand } = require("./execute-command");

exports.installMultiplePackages = async (packages) => {
  await executeCommand(`npm install ${packages.join(" ")}`);
};
