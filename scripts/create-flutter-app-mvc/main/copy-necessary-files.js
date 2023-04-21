const { changeWorkingDirectory } = require("../utils/change-working-directory");
const { copyFile } = require("../utils/copy-file");
const {
  createHomeFoldersAndFiles,
} = require("../utils/create-home-folders-and-files");
const {
  splitDirectoryBasedOnPlatform,
} = require("../utils/split-directory-based-on-platform");

exports.copyNecessaryFiles = async (additionalPackages) => {
  // Copy assets
  changeWorkingDirectory("../assets/images/bitmaps");
  await copyFile("assets/images/logo.png", "logo.png");

  changeWorkingDirectory("../../");
  await copyFile("assets/.env", ".env");

  // Copy Theme, Utils files to helpers folder
  changeWorkingDirectory("../lib/models/");
  await copyFile("models/user.dart", "user.dart");

  // Copy Theme, Utils files to helpers folder
  changeWorkingDirectory("../helpers/");
  await copyFile("helpers/theme.dart", "theme.dart");
  await copyFile("helpers/utils.dart", "utils.dart");
  await copyFile("helpers/api_routes.dart", "api_routes.dart");

  // Copy Splash, Home screens to views/screens folder
  changeWorkingDirectory("../views/screens/");
  await copyFile("screens/home_screen.dart", "home_screen.dart");
  await copyFile("screens/splash_screen.dart", "splash_screen.dart");

  await createHomeFoldersAndFiles();

  for (const package of additionalPackages) {
    if (package["checked"] && package["url"] != null) {
      if (package["name"] == "get") {
        // Copy main.dart replacing existing file
        await copyFile("main.dart", "main.dart");

        changeWorkingDirectory("controllers/");
        await copyFile(
          "controllers/common_controller.dart",
          "common_controller.dart"
        );

        changeWorkingDirectory(`../routes/`);
        await copyFile(package["url"], "routes.dart");
        changeWorkingDirectory(`../`);
      } else {
        if (splitDirectoryBasedOnPlatform().pop() !== "services") {
          changeWorkingDirectory(`services/`);
        }
        await copyFile(package["url"], package["url"].split("/").pop());
      }
    }
  }

  if (splitDirectoryBasedOnPlatform().pop() !== "lib") {
    // Only possibility for this is "else" in for loop
    changeWorkingDirectory(`../`);
  }
};
