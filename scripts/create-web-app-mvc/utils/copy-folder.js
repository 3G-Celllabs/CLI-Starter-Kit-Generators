const axios = require("axios");
const chalk = require("chalk");
const fs = require("fs");
const ora = require("ora");
const path = require("path");

const baseEndPoint = "https://gitlab.com/api/v4/projects/44403343/repository";

exports.copyFolders = async (remotePath, localPath) => {
  try {
    const response = await axios.get(
      `${baseEndPoint}/tree?path=${remotePath}&ref=main`
    );
    await handleCopyFolder(response.data, localPath);
  } catch (error) {
    ora("").fail(chalk.red(`Fetching folders failed: ${error}`));
  }
};

async function handleCopyFolder(files, localPath) {
  for (const file of files) {
    if (file.type === "blob") {
      const fileApiEndpoint = `${baseEndPoint}/files/${encodeURIComponent(
        file.path
      )}?ref=main`;
      try {
        const response = await axios.get(fileApiEndpoint);
        const decodedContent = Buffer.from(
          response.data.content,
          "base64"
        ).toString("utf-8");
        const filePath = `${localPath}/${path.basename(file.path)}`;
        fs.mkdirSync(path.dirname(filePath), { recursive: true });
        fs.writeFileSync(filePath, decodedContent);
        ora("").succeed(
          chalk.green(`File ${filePath} downloaded successfully!`)
        );
      } catch (error) {
        ora("").fail(chalk.red(`Copying files failed: ${error}`));
      }
    }
  }
}
