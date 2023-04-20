const axios = require("axios");
const chalk = require("chalk");
const fs = require("fs");
const ora = require("ora");

const { copyFolders } = require("../utils/copy-folder");
const { delay } = require("../utils/delay");

const folders = ["components", "pages", "services"];

const baseEndPoint =
  "https://api.github.com/repos/3G-Celllabs/CLI-Starter-Kit-Generators/contents";

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
    await delay(1000);
  }

  // Delete home folder top level.
  if (type === "ionic") {
    fs.rmSync("home", { recursive: true, force: true });
    ora("").succeed(chalk.green(`Home folder deleted successfully.`));
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
      `${baseEndPoint}/web/${endPointFolder}/${currentFolder}`
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
      const newFolder = obj.path.split("/").pop();
      const destination = `${currentFolder}/${newFolder}`;
      fs.mkdirSync(`${destination}`);
      delay(1000);
      await copyFolders(obj.path, `${destination}`);
    }
  } catch (error) {
    console.error(chalk.red(`Error fetching folders: ${error}`));
  }
}
