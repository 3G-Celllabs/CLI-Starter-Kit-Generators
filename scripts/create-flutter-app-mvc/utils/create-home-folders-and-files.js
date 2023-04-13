const { changeWorkingDirectory } = require("./change-working-directory");
const { copyFile } = require("./copy-file");

exports.createHomeFoldersAndFiles = async () => {
  changeWorkingDirectory("../../bindings/");
  await copyFile("bindings/home_binding.dart", "home_binding.dart");

  changeWorkingDirectory("../controllers/");
  await copyFile("controllers/home_controller.dart", "home_controller.dart");
  changeWorkingDirectory("../services/");
  await copyFile("services/home_service.dart", "home_service.dart");
  changeWorkingDirectory("../");
};
