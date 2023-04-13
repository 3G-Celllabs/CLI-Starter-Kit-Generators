const { changeWorkingDirectory } = require("./change-working-directory");
const { copyFile } = require("./copy-file");
const { createFolder } = require("./create-folder");

exports.createHomeFoldersAndFiles = async () => {
  changeWorkingDirectory("../home/");
  await copyFile("bindings/home_binding.dart", "home_binding.dart");
  await copyFile("controllers/home_controller.dart", "home_controller.dart");
  await copyFile("screens/home_screen.dart", "home_screen.dart");
  await copyFile("services/home_service.dart", "home_service.dart");

  createFolder("models");
  changeWorkingDirectory("models/");
  await copyFile("models/room.dart", "room.dart");
  await copyFile("models/user.dart", "user.dart");

  changeWorkingDirectory("../");
  createFolder("states");
  changeWorkingDirectory("states/");
  await copyFile("states/user_roles.dart", "user_roles.dart");

  changeWorkingDirectory("../");
  createFolder("widgets");
  changeWorkingDirectory("widgets/");
  await copyFile("widgets/home_tile.dart", "home_tile.dart");

  changeWorkingDirectory("../../");
  // takes you to lib folder.
};
