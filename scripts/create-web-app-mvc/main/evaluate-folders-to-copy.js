const axios = require("axios");
const chalk = require("chalk");

const { copyFolders } = require("../utils/copy-folder");

const folders = ["components", "guards", "modules", "pages", "services"];

const baseEndPoint = "https://gitlab.com/api/v4/projects/44403343/repository";

exports.evaluateFoldersToCopy = async (
  type,
  isCryptoInstalled,
  isMqttInstalled
) => {
  // Copy Helpers, Models
  await copyFolders(`web/${type}/helpers`, "helpers/");
  await copyFolders(`web/${type}/models`, "models/");

  // Copy remaining folders
  for (const folder of folders) {
    await evaluateAndCopyFolders(
      folder,
      isCryptoInstalled,
      isMqttInstalled,
      type
    );
  }
};

async function evaluateAndCopyFolders(
  currentFolder,
  isCryptoInstalled,
  isMqttInstalled,
  endPointFolder
) {
  try {
    const { data } = await axios.get(
      `${baseEndPoint}/tree?path=web/${endPointFolder}/${currentFolder}&ref=main`
    );

    for (const obj of data) {
      if (
        currentFolder === "services" &&
        obj.path.includes("encryption") &&
        !isCryptoInstalled
      ) {
        return;
      } else if (
        currentFolder === "services" &&
        obj.path.includes("mqtt") &&
        !isMqttInstalled
      ) {
        return;
      }
      await copyFolders(
        obj.path,
        `${currentFolder}/${obj.path.split("/").pop()}`
      );
    }
  } catch (error) {
    console.error(chalk.red(`Error fetching folders: ${error}`));
  }
}
