const { changeWorkingDirectory } = require("../utils/change-working-directory");
const { copyFile } = require("../utils/copy-file");
const {
  createHomeFoldersAndFiles,
} = require("../utils/create-home-folders-and-files");
const {
  splitDirectoryBasedOnPlatform,
} = require("../utils/split-directory-based-on-platform");

exports.copyNecessaryFiles = async (additionalPackages) => {
  changeWorkingDirectory("../assets/images/bitmaps");

  // Copy assets
  await copyFile("assets/images/logo.png", "logo.png");
  changeWorkingDirectory("../../");

  await copyFile("assets/.env", ".env");
  changeWorkingDirectory("../lib/");

  // Copy Theme to lib folder
  await copyFile("helpers/theme.dart", "theme.dart");

  // Copy  Utils files to utilities folder
  changeWorkingDirectory("utilities/");

  await copyFile("helpers/utils.dart", "utils.dart");
  await copyFile("helpers/api_routes.dart", "api_routes.dart");

  // Copy Splash, Home screens to views/screens folder
  changeWorkingDirectory("../splash/");
  await copyFile("screens/splash_screen.dart", "splash_screen.dart");

  await createHomeFoldersAndFiles();

  for (const package of additionalPackages) {
    if (package["checked"] && package["url"] != null) {
      if (package["name"] == "get") {
        // Copy main.dart replacing existing file
        await copyFile("main.dart", "main.dart");

        changeWorkingDirectory("utilities/controllers/");
        await copyFile(
          "controllers/common_controller.dart",
          "common_controller.dart"
        );
        changeWorkingDirectory(`../../`);
        await copyFile(package["url"], "routes.dart");
      } else {
        const currentDirectory = splitDirectoryBasedOnPlatform();
        if (
          currentDirectory[currentDirectory.length - 2] !== "utilities" &&
          currentDirectory[currentDirectory.length - 1] !== "services"
        ) {
          changeWorkingDirectory(`utilities/services/`);
        }

        await copyFile(package["url"], package["url"].split("/").pop());
      }
    }
  }
  if (splitDirectoryBasedOnPlatform().pop() !== "lib") {
    // Only possibility for this is "else" in for loop
    changeWorkingDirectory(`../../`);
  }
};
